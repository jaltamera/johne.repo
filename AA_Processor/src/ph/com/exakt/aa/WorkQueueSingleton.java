package ph.com.exakt.aa;

public class WorkQueueSingleton {

	private static WorkQueue workQueue;
	/** A private Constructor prevents any other class from instantiating. */
	
	private WorkQueueSingleton() {
		//	 Optional Code
	}
	public static synchronized WorkQueue getSingletonObject() {
		if (workQueue == null) {
			workQueue = new WorkQueue(10);
		}
		return workQueue;
	}
	public Object clone() throws CloneNotSupportedException {
		throw new CloneNotSupportedException();
	}
}
