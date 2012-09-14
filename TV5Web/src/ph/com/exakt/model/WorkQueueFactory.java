package ph.com.exakt.model;

import java.util.concurrent.ConcurrentLinkedQueue;

public class WorkQueueFactory {

	private static volatile WorkQueue workQueue;
	/** A private Constructor prevents any other class from instantiating. */
	private WorkQueueFactory() {

	}
	public static synchronized WorkQueue getQueueInstance() {
		if (workQueue == null) {
			workQueue = new WorkQueue(10);
		}
		return workQueue;
	}
	public Object clone() throws CloneNotSupportedException {
		throw new CloneNotSupportedException();
	}
}
