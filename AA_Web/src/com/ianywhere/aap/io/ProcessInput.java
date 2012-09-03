package com.ianywhere.aap.io;

import java.util.ResourceBundle;

import com.dejima.core.io.AgentNetworkOutput;
import com.dejima.core.io.Context;
import com.dejima.core.kernel.ChainIdentifier;
import com.dejima.core.nlp.text.action.InterpretationActuation;
import com.dejima.sdk.AgentNetwork;
import com.dejima.utils.log.LogManager;

public class ProcessInput 
{	
	AgentNetworkOutput agentNetworkOutput = new AgentNetworkOutput();
	
	protected static final LogManager logger = new LogManager(ProcessInput.class);
	protected static final ResourceBundle resource = ResourceBundle.getBundle("application");
	private String formatterName;
	private String formattedOutput = "";
	public boolean debug = true;
	
	public void log(String msg) 
	{
		System.out.println(msg);
	}
	
	private String inputMessage = "";
	private String userId = "";
	
	public static AgentNetwork agentNetwork = new AgentNetwork();
	
	static {		
		try {

			String[] errors = agentNetwork
					.load(resource.getString("opal.path"));
			logger.info("Network loaded:" + resource.getString("opal.path"));
			if (errors.length > 0) {
				logger.info("<hr>");
				
				logger.info("Errors found when loading " + agentNetwork.getOpalName() + ":<br>");
				logger.info("<p><ol type=\"1\">");
				for (int i = 0; i < errors.length; i++) {
					logger.info("<li>" + errors[i]);
				}
				logger.info("</ol><hr>");
			}
		} catch (Exception e) {
			logger.info("Exception in loading agent network:" + e.getMessage());
		}
	}
	
	public ProcessInput(String input)
	{
		this(input, null);
	}
	
	public ProcessInput(String input, String formatterName)
	{
		inputMessage = input; 
		this.userId = userId;
		
		this.formatterName = formatterName;
		
		if(this.formatterName == null || this.formatterName.trim().equals(""))
		{
			formatterName = resource.getString("formatter.name");
		}
	}
	
	public synchronized void processRequest() 
	{	
		UserSessionManager userSessMgr = UserSessionManager.getUserSessionManager();
		
		try 
		{			
			logger.info("Input Query=" + inputMessage);
			
			if (inputMessage != null && inputMessage.length() > 0)
			{
				ChainIdentifier cid = userSessMgr.getChainID(userId);
				Context ctx = ((UserContext) cid.getSession()).getContext();
				agentNetworkOutput = agentNetwork.process(inputMessage.toUpperCase(), cid, ctx, formatterName);	
			
				
				formattedOutput = agentNetworkOutput.getFormattedOutput();  
				Context recvd_ctx = agentNetworkOutput.getContext();
				ChainIdentifier recvd_cid = agentNetworkOutput.getChainID();

				userSessMgr.setChainID(userId, recvd_cid, recvd_ctx); 
				
			}							
			logger.info("Formatted Output=" + formattedOutput);				
			
		} 
		catch (Exception e) 
		{
			handleUserError(e);
		}
	}
	
    public String getFormattedOutput()
    {
    	return formattedOutput;
    }
    
    public InterpretationActuation getInterpretationActuation()
    {
    	if(agentNetworkOutput != null)
    	{
    		return agentNetworkOutput.getInterpretation();
    	}
    	
    	return null;
    }
    
    protected void handleUserError(Exception e)
    {
    	logger.error("FAIL: Sorry, there was an error.");		
		logger.error("Exception:" + e.getMessage());
		e.printStackTrace();
    }
}
