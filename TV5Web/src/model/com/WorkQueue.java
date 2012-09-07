package model.com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.LinkedList;

import model.sql.pool.ConnectionPoolManager;

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

				PreparedStatement pstm = null;
				Connection con = null;

				try {

					con = ConnectionPoolManager.getConnection();

					// TODO put this into properties file
					String query = "INSERT INTO tbl_transaction(t_message, t_number, flag) VALUES(?,?,0)";

					pstm = con.prepareStatement(query);

					pstm.setString(1, r.getInput());
					pstm.setString(2, r.getPhone());

					pstm.executeUpdate();
				}

				catch (Exception e) {
					synchronized(queue) {
						queue.addLast(r);
						try {
							queue.wait();
						} catch (InterruptedException e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
						}

						System.out.println(queue.size());
					}

				}finally{
					try {
						pstm.close();
						con.close();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				}
			}
		}
	}
}
