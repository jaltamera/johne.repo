package aa.exakt;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Savepoint;
import java.util.Observable;

import aa.exakt.io.AASender;
import aa.exakt.io.IGSender;
import aa.sql.ConnectionPoolManager;

public class AARunnable extends Observable implements Runnable, Serializable {
	
	RequestObject requestObject;
	
	public AARunnable(RequestObject r){
		requestObject = r;
	}
	
	public void run() {
		
		PreparedStatement pstm = null;
		Connection con = null;

		int responseCode = 0;

		try {

			con = ConnectionPoolManager.getConnection();
			con.setAutoCommit(false);
			con.setTransactionIsolation(2);
			
			//if unable to connect to database, throw DBException
			if(con != null){
				
				//create transaction savepoint
				Savepoint savepoint = con.setSavepoint();
				
				// TODO put this into properties file
				String query = "UPDATE tbl_transaction SET flag = 1 WHERE ID = ?";

				pstm = con.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

				pstm.setInt(1, requestObject.getID());
				
				if(pstm.executeUpdate() == 1){
					
					String result = "";

					//send http request to localhost:80/AA_Web
					
					AASender aa = new AASender(requestObject);
					result = aa.getAAResult();

					//if AA result is null, throw AAException
					if(!result.equals("")){

						//send http request to IG
						IGSender sender = new IGSender();
						responseCode = sender.send(requestObject, result);
						System.out.println("Response Code: " + responseCode);
						
						if(responseCode < 300 || responseCode > 199){
							con.commit(); System.out.println("Commit");
						}else
							con.rollback(savepoint); System.out.println("Rollback");
					}
				}
			}
			
		}catch (Exception e){
			
			try {
				//con.commit();
				if(pstm != null)pstm.close();
				if(con != null) con.close();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			
			//setChanged();
			//notifyObservers();
		}
	}
	
	public RequestObject getRequestObject(){
		return requestObject;
	}
}
