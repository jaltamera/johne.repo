package ph.com.exakt.aa.bom;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Observable;
import java.util.Timer;
import java.util.concurrent.TimeUnit;

import ph.com.exakt.aa.exception.IGException;
import ph.com.exakt.aa.io.AASender;
import ph.com.exakt.aa.io.IGSender;
import ph.com.exakt.aa.sql.ConnectionPoolManager;

public class AAProcessor {

	Timer timer;
	
	public AAProcessor(int seconds) {
		AAScheduledThreadPoolExecutor executor = new AAScheduledThreadPoolExecutor(100, new AARejectedExecutionHandler());
		InnerAARunnable aaRunnable = new InnerAARunnable();
		aaRunnable.addObserver(executor);
		executor.scheduleWithFixedDelay(aaRunnable, 0, 2L, TimeUnit.SECONDS);
		System.out.println("Started\n-------");
	}
	
	class InnerAARunnable extends Observable implements Runnable{
		
		public void run(){
			
			PreparedStatement pstm = null;
			Statement stm = null;
			Connection con = null;
			ResultSet rs = null;

			int responseCode = 200;

			try {

				con = ConnectionPoolManager.getConnection();
				//con.setAutoCommit(false);
				
				//if unable to connect to database, throw DBException
				if(con != null){
					
					String query = "SELECT TOP 1 * from tbl_transaction where flag = 0 FOR UPDATE";
					
					stm = con.createStatement();
					rs = stm.executeQuery(query);
					
					if(rs.next()){
						
						System.out.println("\n===========================LF===========================\n");
						
						//RequestObject r = new RequestObject(rs.getString("t_message"), rs.getString("t_number"), rs.getInt("ID"));
						RequestObject r = new RequestObject(rs.getString("t_message"), rs.getString("t_number"), rs.getInt("ID"), rs.getString("thread"));
						
						// TODO put this into properties file
						query = "UPDATE tbl_transaction SET flag = 1 WHERE ID = ?";

						pstm = con.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

						pstm.setInt(1, r.getID());
						
						if(pstm.executeUpdate() == 1){
							
							String result = "";

							//send http request to localhost:80/AA_Web
							System.out.println("Input: " + r.getInput());
							AASender aa = new AASender(r);
							result = aa.getAAResult();

							//if AA result is null, throw AAException
							if(!result.equals("")){

								//send http request to IG
								IGSender sender = new IGSender();
								responseCode = sender.send(r, result);
								
								if(responseCode < 200 || responseCode > 299)
									throw new IGException(responseCode);
								
							}
						}
					}
				}
				
			}catch (Exception e){
			}finally{
				try {
					if(rs != null)rs.close(); 
					if(stm != null)stm.close();
					if(pstm != null)pstm.close();
					if(con != null) con.close();
				} catch (Exception ex) {
				}
			}
			
			if(responseCode < 200 || responseCode > 299){
				setChanged();
				notifyObservers();
			}
		}
	}
	
	public static void main(String args[])throws Exception{
		new AAProcessor(1);
	}
}
