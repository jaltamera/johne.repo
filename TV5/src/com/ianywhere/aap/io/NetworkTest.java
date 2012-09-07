package com.ianywhere.aap.io;

import com.dejima.core.io.AgentNetworkOutput;
import com.dejima.core.io.UnsupportedFormatException;
import com.dejima.core.kernel.ChainIdentifier;
import com.dejima.exceptions.OPALParseException;
import com.dejima.sdk.AgentNetwork;

public class NetworkTest 
{
	public static void main (String[] args)
	{
		AgentNetwork agentNetwork = new AgentNetwork();
		
		AgentNetworkOutput agentNetworkOutput = new AgentNetworkOutput();
		
		try
		{
			String[] errors = agentNetwork.load("C:/apache-tomcat-5.5.23/webapps/textsss/network/textsss/textsss.opal");
		}
		catch(OPALParseException e)
		{
			e.printStackTrace();
		}
		
		ChainIdentifier chainID;
        if (agentNetworkOutput.getChainID() == null)
        {
            chainID = new ChainIdentifier("hello");
        }
        else
        {
            chainID = agentNetworkOutput.getChainID();
        }
        
        // process and diplay results
        try
        {
	        AgentNetworkOutput newOutput = agentNetwork.process("check", chainID, null, "SMS");
	        agentNetworkOutput.initializeTo(newOutput);       
	
	        String output = agentNetworkOutput.getFormattedOutput();
	        
	        System.out.println("OUTPUT: " + output);
        }
        catch(UnsupportedFormatException e)
        {
        	e.printStackTrace();
        }
	}
}
