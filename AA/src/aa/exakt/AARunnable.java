package aa.exakt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Savepoint;
import java.util.Observable;

import aa.exakt.io.AASender;
import aa.exakt.io.IGSender;
import aa.exakt.io.LogPrinter;
import aa.sql.ConnectionPoolManager;

public class AARunnable extends Observable implements Runnable {
	
	RequestObject requestObject;
	LogPrinter printer;
	
	public AARunnable(RequestObject requestObject, LogPrinter printer){
		this.requestObject = requestObject;
		this.printer = printer;
	}
	
	public void run() {
		
		synchronized(printer){
			
			PreparedStatement pstm = null;
			Connection con = null;

			int responseCode = 0;

			try {

				con = ConnectionPoolManager.getConnection();
				con.setAutoCommit(false);
				
				//if unable to connect to database, throw DBException
				if(con != null){
					
					//create transaction savepoint
					Savepoint savepoint = con.setSavepoint();
					
					// TODO put this into properties file
					String query = "UPDATE tbl_transaction SET flag = 1 WHERE ID = ?";

					pstm = con.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

					pstm.setInt(1, requestObject.getID());
					
					if(pstm.executeUpdate() == 1){
						
						printer.print("-------LF-------");
						
						String result = "";

						//send http request to localhost:80/AA_Web
						AASender aa = new AASender(requestObject);
						result = aa.getAAResult(printer);

						//if AA result is null, throw AAException
						if(!result.equals("")){

							//send http request to IG
							IGSender sender = new IGSender();
							responseCode = sender.send(requestObject, result, printer);
							printer.print("Response Code: " + responseCode);
							
							con.commit();
						}
					}else
						con.rollback(savepoint);
					
				}
				
			}catch (Exception e){
				setChanged();
				notifyObservers();
				System.out.println(e);
			}finally{
				try {
					con.setAutoCommit(true);
					if(pstm != null)pstm.close();
					if(con != null) con.close();
				} catch (Exception e) {
				}
			}
		}
	}

}
