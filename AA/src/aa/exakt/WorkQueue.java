package aa.exakt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.LinkedList;

import aa.sql.ConnectionPoolManager;

public class WorkQueue {

	private final int nThreads;
	private final PoolWorker[] threads;
	private final LinkedList queue;

	public WorkQueue(int nThreads)
	{
		this.nThreads = nThreads;
		queue = new LinkedList();
		threads = new PoolWorker[nThreads];

		for (int i=0; i<nThreads; i++) {
			threads[i] = new PoolWorker();
			threads[i].start();
		}
	}

	public void execute(RequestObject r/*Runnable r*/) {
		synchronized(queue) {
			queue.addLast(r);
			queue.notify();
		}
	}

	private class PoolWorker extends Thread {
		public void run() {
			RequestObject r;

			while (true) {
				synchronized(queue) {
					while (queue.isEmpty()) {
						try
						{
							queue.wait();
						}
						catch (InterruptedException ignored)
						{
						}
					}

					r = (RequestObject) queue.removeFirst();
				}

				// If we don't catch RuntimeException, 
				// the pool could leak threads

				// Try connecting to the smsSimulator.jsp

				PreparedStatement pstm = null;
				Connection con = null;

				try {

					con = ConnectionPoolManager.getConnection();

					// TODO put this into properties file
					String query = "UPDATE tbl_transaction SET flag = 1 WHERE ID=?";

					pstm = con.prepareStatement(query);

					pstm.setInt(1, r.getID());

					pstm.executeUpdate();

					String result = "";

					AASender aa = new AASender(r);
					result = aa.getAAResult();
					System.out.println("Result: " + result);

					if(!result.equals("")){
						IGSender sender = new IGSender();
						sender.send(r, result);
					}else
						throw new Exception();

				}catch (Exception e) {
					System.out.println("Error updating data | sending the request : WorQueue");
					synchronized(queue) {
						queue.addLast(r);
						try {
							queue.wait();
						} catch (InterruptedException e1) {
							e1.printStackTrace();
						}
					}

				}finally{
					try {
						pstm.close();
						con.close();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						//e.printStackTrace();
						System.out.println("Error closing connection - 2 : WorkQueue");	
					}

				}

			}
		}
	}
}
