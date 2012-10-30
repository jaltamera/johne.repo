package aa.exakt.queue;

import java.util.LinkedList;
import java.util.Observable;
import java.util.Observer;

import aa.exakt.AARunnable;
import aa.exakt.io.LogPrinter;

public class WorkQueue {

	private final int nThreads;
	private final PoolWorker[] threads;
	private final LinkedList queue;
	
	public static volatile int QUEUE_SIZE;

	public WorkQueue(int nThreads)
	{
		this.nThreads = nThreads;
		queue = new LinkedList();
		threads = new PoolWorker[nThreads];

		for (int i=0; i < nThreads; i++) {
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
			System.out.println("Enqueued: " + queue.size());
			try {
				queue.wait();
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			}
		}
	}
	
	private class PoolWorker extends Thread implements Observer{
		
		public PoolWorker(String name){
			super(name);
		}
		
		public void run() {
			
			AARunnable r;
			
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

					r = (AARunnable) queue.remove(0);
					r.addObserver(this);
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

		public void update(Observable arg0, Object arg1) {
			WorkQueueFactory.getQueueInstance().enqueue((Runnable)arg0);
		}
	}
}
