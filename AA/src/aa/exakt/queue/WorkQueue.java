package aa.exakt.queue;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.LinkedList;

import aa.exakt.RequestObject;
import aa.exakt.io.AASender;
import aa.exakt.io.IGSender;
import aa.exception.AAException;
import aa.exception.IGException;
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
			threads[i] = new PoolWorker("Worker-"+(i+1));
			threads[i].start();
		}
	}

	public void execute(/*RequestObject r*/Runnable r) {
		synchronized(queue) {
			queue.addLast(r);
			queue.notify();
		}
	}
	
	public void enqueue(Runnable r){
		synchronized(queue) {
			queue.addLast(r);
			try {
				queue.wait();
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			}
		}
	}
	
	private class PoolWorker extends Thread {
		
		public PoolWorker(String name){
			super(name);
		}
		
		public void run() {
			
			Runnable r;

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

					r = (Runnable) queue.removeFirst();
				}

				// If we don't catch RuntimeException, 
				// the pool could leak threads

                try {
                    r.run();
                }
                catch (RuntimeException e) {
                	
                	System.out.println(e);
					
                }
                catch (Exception e) {
                	
                	System.out.println(e);
					
                }
			}
		}
	}
}
