package aa.exakt;

import java.util.Observable;
import java.util.Observer;
import java.util.concurrent.ScheduledThreadPoolExecutor;

import aa.exakt.AAProcessor.InnerAARunnable;

public class AAScheduledThreadPoolExecutor extends ScheduledThreadPoolExecutor implements Observer{

	public AAScheduledThreadPoolExecutor(int corePoolSize) {
		super(corePoolSize);
	}

	public void update(Observable observable, Object arg1) {
		System.out.println("Dumaan dito");
		this.execute((InnerAARunnable) observable);
	}
}
