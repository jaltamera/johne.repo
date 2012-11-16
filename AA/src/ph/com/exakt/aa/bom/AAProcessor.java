package ph.com.exakt.aa.bom;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Observable;
import java.util.Timer;
import java.util.TimerTask;

import ph.com.exakt.aa.exception.IGException;
import ph.com.exakt.aa.io.AASender;
import ph.com.exakt.aa.io.IGSender;
import ph.com.exakt.aa.queue.WorkQueue;
import ph.com.exakt.aa.queue.WorkQueueFactory;
import ph.com.exakt.aa.sql.ConnectionPoolManager;

public class AAProcessor {

	Timer timer;
	
	public AAProcessor(int seconds) {
		
		timer = new Timer();
		timer.scheduleAtFixedRate(new RemindTask(), 0, seconds*1000);
	}
	
	class RemindTask extends TimerTask {

		int cur_status = 0;
		int new_status = 0;

		public void run() {

			Connection con = null;
			PreparedStatement pstm = null;
			Statement stm = null;
			ResultSet rs = null;

			try{

				//get a connection from the connection pool
				con = ConnectionPoolManager.getConnection(); 

				// TODO insert this into sql.properties file
				String query = "SELECT * from tbl_transaction readpast where flag = 0 order by ID asc FOR UPDATE";//"SELECT * from tbl_transaction where flag = 0 order by ID asc";

				stm = con.createStatement();
				rs = stm.executeQuery(query);

				//get the singleton object of WorkQueue (the thread pool)
				WorkQueue workQueue = WorkQueueFactory.getQueueInstance();

				while(rs.next()){

					//create the RequestObject w/c contains the message and mobile number
					RequestObject r = new RequestObject(rs.getString("t_message"), rs.getString("t_number"), rs.getInt("ID"));
					
					query = "UPDATE tbl_transaction SET flag = 1 WHERE ID = ?";
					
					pstm = con.prepareStatement(query);
					pstm.setInt(1, r.getID());
					
					if(pstm.executeUpdate() == 1){
						//add a runnable object w/c executes the send and update to the synchronized queue
						workQueue.execute(new AARunnable(r));
					}
				}

				cur_status = 1;

			}catch(Exception e){
				cur_status = 0;
			}finally{
				try{
					if(rs != null)	rs.close();
					if(pstm != null)pstm.close();
					if(stm != null)	stm.close();
					if(con != null)	con.close();
				}catch(Exception e){
				}
			}

			if(new_status != cur_status){
				String display = (cur_status == 1) ? "Connected" : "Unable to Connect";
				System.out.println(display);
			}

			new_status = cur_status;
		}
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
						
						RequestObject r = new RequestObject(rs.getString("t_message"), rs.getString("t_number"), rs.getInt("ID"));
						
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
