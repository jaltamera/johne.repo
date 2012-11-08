package aa.exakt.queue;

import java.util.LinkedList;
import java.util.Observable;
import java.util.Observer;

import aa.exakt.AARunnable;

public class WorkQueue {

	private final int nThreads;
	private final PoolWorker[] threads;
	private final LinkedList<AARunnable> queue;
	
	public static volatile int QUEUE_SIZE;

	public WorkQueue(int nThreads)
	{
		this.nThreads = nThreads;
		queue = new LinkedList<AARunnable>();
		threads = new PoolWorker[nThreads];

		for (int i=0; i < nThreads; i++) {
			threads[i] = new PoolWorker("Worker-"+(i+1));
			threads[i].start();
		}
	}	
	
	public void execute(/*RequestObject r*/Runnable r) {
		synchronized(queue) {
			queue.addLast((AARunnable)r);
			queue.notify();
		}
	}
	
	public void enqueue(Runnable r){
		synchronized(queue) {
			queue.addLast((AARunnable)r);
			System.out.println("Enqueued: " + queue.size());
			for(int x = 0; x < queue.size(); x++){
				System.out.println(((AARunnable)queue.get(x)).getRequestObject().getInput());
			}
				
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

					r = (AARunnable) queue.removeFirst();
					System.out.println("Running: " + r.getRequestObject().getInput());
					r.addObserver(this);
				}

				// If we don't catch RuntimeException, 
				// the pool could leak threads

                try {
                	System.out.println("\n==============LF===============\n");
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
				System.out.println(((AARunnable)arg0).getRequestObject().getID());
				WorkQueueFactory.getQueueInstance().enqueue((AARunnable)arg0);
		}
	}
}
