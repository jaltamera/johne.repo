/**
 * 
 */
package com.ianywhere.aap.sms.io;

import java.util.List;

import com.dejima.apps.poc.Sybase365.HttpSender;
import com.ianywhere.aap.io.ProcessInput;
import com.ianywhere.aap.sms.sy365.SMSReceiver;

/**
 * @author hwijaya
 *
 */
public class ProcessSmsInput extends ProcessInput implements Runnable {

	private SMSReceiver smsReceiver;
	
	public ProcessSmsInput(SMSReceiver smsReceiver)
	{
		super(smsReceiver.getInput(), smsReceiver.getPhone());
	}
	
	public void run() 
	{
		processRequest();
		
		String output = getFormattedOutput();
		
		if(output != null && !output.equals(""))
		{
			List<String> postMsg = smsReceiver.prepareSMSResponse(resource.getString("msg.subscriberNotFound"));					
			new HttpSender().postMessage(postMsg.get(0), postMsg.get(1), postMsg.get(2));
		}
	}
	
	@Override
	protected void handleUserError(Exception e)
    {
    	logger.error("FAIL: Sorry, there was an error.");		
		logger.error("Exception:" + e.getMessage());
		e.printStackTrace();
		
		List<String> postMsg = smsReceiver.prepareSMSResponse(resource.getString("msg.serviceUnavailable"));					
		new HttpSender().postMessage(postMsg.get(0), postMsg.get(1), postMsg.get(2));
    }
}
