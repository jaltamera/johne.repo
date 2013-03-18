package ph.com.exakt.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.LinkedList;

import org.apache.log4j.Logger;

import ph.com.exakt.controller.InboundServlet;
import ph.com.exakt.sql.pool.ConnectionPoolManager;

public class WorkQueue {

	private final int nThreads;
	private final PoolWorker[] threads;
	private final LinkedList queue;
	
	public WorkQueue(int nThreads)
	{
		this.nThreads = nThreads;
		queue = new LinkedList();
		threads = new PoolWorker[nThreads];
		new DatabasePoller().start();

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
	
	private class DatabasePoller extends Thread{
		public void run(){
			while(true){
				synchronized(queue){
					Connection con = null;
					try{
						con = ConnectionPoolManager.getConnection();
						
						if(con.getMetaData() != null && !queue.isEmpty()){
							queue.notify();
						}
					}catch(Exception e){
					}finally{
						try{
							con.close();
						}catch(Exception e){
						}
					}
				}
			}
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
				
				//if(r != null){
					
					PreparedStatement pstm = null;
					Connection con = null;

					try {

						con = ConnectionPoolManager.getConnection();

						// TODO put this into properties file
						String query = "INSERT INTO tbl_transaction(t_message, t_number, flag, thread, date_pub, telco) VALUES(?,?,0,?,?,?)";

						pstm = con.prepareStatement(query);

						pstm.setString(1, r.getInput());
						pstm.setString(2, r.getPhone());
						pstm.setString(3, r.getThread());
						pstm.setString(4, r.getDate());
						pstm.setString(5, r.getTelco());

						pstm.executeUpdate();
					}

					catch (Exception e) {
						synchronized(queue) {
							queue.addLast(r);
							try {
								queue.wait();
							} catch (InterruptedException e1) {
							}
						}

					}finally{
						try {
							pstm.close();
							con.close();
						} catch (Exception e) {
						}
					}
				//}
			}
		}
	}
}
