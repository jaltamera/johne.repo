package ph.com.exakt.aa.bom;

import java.util.Observable;

import ph.com.exakt.aa.io.AASender;
import ph.com.exakt.aa.io.IGSender;

public class AARunnable extends Observable implements Runnable {

	RequestObject requestObject;

	public AARunnable(RequestObject r){
		requestObject = r;
	}

	public void run() {

		int responseCode = 0;

		try {

			String result = "";

			//send http request to localhost:80/AA_Web
			AASender aa = new AASender(requestObject);
			result = aa.getAAResult();

			//if AA result is null, throw AAException
			if(!result.equals("")){

				//send http request to IG
				IGSender sender = new IGSender();
				responseCode = sender.send(requestObject, result);
				System.out.println("Response Code: " + responseCode);

				if(responseCode < 200 || responseCode >= 300){
					this.setChanged();
					this.notifyObservers();
				}
			}

		}catch (Exception e){
		}
	}

	public RequestObject getRequestObject(){
		return requestObject;
	}
}
