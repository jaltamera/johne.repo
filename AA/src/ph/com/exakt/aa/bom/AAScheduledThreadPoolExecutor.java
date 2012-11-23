package ph.com.exakt.aa.bom;

import java.util.Observable;
import java.util.Observer;
import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ScheduledThreadPoolExecutor;

import ph.com.exakt.aa.bom.AAProcessor.InnerAARunnable;
import ph.com.exakt.aa.queue.WorkQueue;
import ph.com.exakt.aa.queue.WorkQueueFactory;

public class AAScheduledThreadPoolExecutor extends ScheduledThreadPoolExecutor implements Observer{
	
	
	public AAScheduledThreadPoolExecutor(int size, RejectedExecutionHandler reh){
		super(size, reh);
	}
	
	public AAScheduledThreadPoolExecutor(int corePoolSize) {
		super(corePoolSize);
	}

	public void update(Observable observable, Object arg1) {
		//workQueue.execute((Runnable)observable);
		System.out.println("Discarded");
	}
}
