package aa.exakt;

import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ThreadPoolExecutor;

public class AARejectedExecutionHandler implements RejectedExecutionHandler {

	public void rejectedExecution(Runnable runnable, ThreadPoolExecutor threadPoolExecutor) {
		threadPoolExecutor.execute(runnable);
	}

}
