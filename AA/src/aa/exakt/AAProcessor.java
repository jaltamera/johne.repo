package aa.exakt;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Timer;
import java.util.TimerTask;

import aa.exakt.io.LogPrinter;
import aa.exakt.queue.WorkQueue;
import aa.exakt.queue.WorkQueueFactory;
import aa.sql.ConnectionPoolManager;

public class AAProcessor {

	Timer timer;

	public AAProcessor(int seconds) {
		timer = new Timer();
		timer.scheduleAtFixedRate(new RemindTask(), 0, seconds*1000);
		//timer.schedule(new RemindTask(), seconds*1000);//
	}

	class RemindTask extends TimerTask {
		
		int cur_status = 0;
		int new_status = 0;
		
		int ctr = 0;
		
		public void run() {
			
			Connection con = null;
			Statement stm = null;
			ResultSet rs = null;

			try{

				//get a connection from the connection pool
				con = ConnectionPoolManager.getConnection(); 
				
				// TODO insert this into sql.properties file
				String query = "SELECT * from tbl_transaction where flag = 0 order by ID asc";

				stm = con.createStatement();
				rs = stm.executeQuery(query);
				
				//get the singleton object of WorkQueue (the thread pool)
				final WorkQueue workQueue = WorkQueueFactory.getQueueInstance();
				
				while(rs.next()){
					
					//create the RequestObject w/c contains the message and mobile number
					final RequestObject r = new RequestObject(rs.getString("t_message"), rs.getString("t_number"), rs.getInt("ID"));

					//add a runnable object w/c executes the send and update to the synchronized queue

					workQueue.execute(new AARunnable(r, LogPrinter.getPrinter()));
				}

				cur_status = 1;

			}catch(Exception e){
				cur_status = 0;
			}finally{
				try{
					if(rs != null)rs.close();
					if(stm != null)stm.close();
					if(con != null)con.close();
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

	public static void main(String args[])throws Exception{
		new AAProcessor(1);
	}
}
