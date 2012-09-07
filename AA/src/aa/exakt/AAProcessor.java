package aa.exakt;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Timer;
import java.util.TimerTask;

import aa.sql.ConnectionPoolManager;

public class AAProcessor {
	
	private Connection con = null;
	private Statement stm = null;
	private ResultSet rs = null;
	
	Timer timer;

	public AAProcessor(int seconds) {
		timer = new Timer();
		timer.scheduleAtFixedRate(new RemindTask(), 0, seconds*1000);
		//schedule(new RemindTask(), seconds*1000);//
	}

	class RemindTask extends TimerTask {
		public void run() {
			
			try{
				con = ConnectionPoolManager.getConnection();
				
				String query = "SELECT * from tbl_transaction where flag = 0 order by ID asc";
				
				stm = con.createStatement();
				rs = stm.executeQuery(query);
				
				while(rs.next()){
					
					WorkQueue workQueue = WorkQueueFactory.getQueueInstance();
					workQueue.execute(new RequestObject(rs.getString("t_message"), rs.getString("t_number"), rs.getInt("ID")));
				}
				
			}catch(Exception e){
				System.out.println("Error connecting to db : AA PRocessor");
				//e.printStackTrace();
			}finally{
				try{
					rs.close();
					stm.close();
					con.close();
				}catch(Exception e){
					System.out.println("Error closing resultset - 1 : AA Processor");
					//e.printStackTrace();
				}
			}
			
		}
	}
	
	public static void main(String args[])throws Exception{
		new AAProcessor(1);
	}
}
