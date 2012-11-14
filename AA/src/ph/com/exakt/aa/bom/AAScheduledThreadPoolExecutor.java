package ph.com.exakt.aa.bom;

import java.util.Observable;
import java.util.Observer;
import java.util.concurrent.ScheduledThreadPoolExecutor;

import ph.com.exakt.aa.bom.AAProcessor.InnerAARunnable;

public class AAScheduledThreadPoolExecutor extends ScheduledThreadPoolExecutor implements Observer{

	public AAScheduledThreadPoolExecutor(int corePoolSize) {
		super(corePoolSize);
	}

	public void update(Observable observable, Object arg1) {
		this.execute((InnerAARunnable) observable);
	}
}
