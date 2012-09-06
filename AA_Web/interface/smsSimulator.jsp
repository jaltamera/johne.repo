<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dejima.core.io.Context"%>
<%@ page import="com.dejima.core.io.AgentNetworkOutput"%>
<%@ page import="com.dejima.core.kernel.ChainIdentifier"%>
<%@ page
	import="com.dejima.core.nlp.text.action.InterpretationActuation"%>
<%@ page import="com.ianywhere.aap.io.*"%>
<%@ page import="com.interaksyon.formatter.*"%>
<%@ page import="java.io.DataOutputStream"%>

<jsp:useBean id="agentNetwork" class="com.dejima.sdk.AgentNetwork"
	scope="application" />
<jsp:useBean id="agentNetworkOutput"
	class="com.dejima.core.io.AgentNetworkOutput" scope="session" />

<%
    String resultString = "";
	String formattedOutput = "";
	String formatter = "traffic";
	String debug = request.getParameter("debug");
    
    ResourceBundle resource = ResourceBundle.getBundle("application");
	formatter = resource.getString("formatter.name");
	try
	{
		//Load the Agent network if hasn't been loaded before
		if (agentNetwork.getOpalName() == null)
		{
			//load the opal
			String opalName = resource.getString("opal.path");	
			String[] errors = agentNetwork.load(opalName);
			if (errors.length > 0)
			{
			   //out.println("<hr>");
			   resultString += "<hr>";
			   // out.println("Errors found when loading " + opalName + ":<br>");
			   resultString += "Errors found when loading " + opalName + ":<br>";
			   // out.println("<p><ol type=\"1\">");
			   resultString += "<p><ol type=\"1\">";
			   for (int i=0; i<errors.length; i++)
			   {
				   System.out.println("<li>" + errors[i]);
				   // out.println("<li>" + errors[i]);
				   resultString += "<li>" + errors[i];
			   }
			   // out.println("</ol><hr>");
			   resultString += "</ol><hr>";
			}
		}
		
		//Parse the request to retrieve the user input request
		String input = request.getParameter("input");
        String phone = request.getParameter("phone");
        
		// Process request
		UserSessionManager userSessMgr = UserSessionManager.getUserSessionManager();		
        if(agentNetwork.getOpalName() != null && input != null && input.length() > 0){   
		//if (input != null && input.length() > 0){
		    
			//if(agentNetworkOutput.getChainID() == null){
				ChainIdentifier cid = userSessMgr.getChainID(phone);
			    Context ctx = ((UserContext) cid.getSession()).getContext();
			    AgentNetworkOutput newOutput = agentNetwork.process(input, cid, ctx, formatter);	
			    agentNetworkOutput.initializeTo(newOutput);
			    formattedOutput = agentNetworkOutput.getFormattedOutput();  
			    Context recvd_ctx = agentNetworkOutput.getContext();
			    ChainIdentifier recvd_cid = agentNetworkOutput.getChainID();
			
			    userSessMgr.setChainID(phone, recvd_cid, recvd_ctx); 
			    
			    System.out.println("Formatted Output=" + formattedOutput);				
				System.out.println(InterpretationActuation.getXml(agentNetworkOutput.getInterpretation(), true));
		        resultString += formattedOutput;
		         
		        resultString = resultString.replaceAll("<LF>", "<br/>");
			
				System.out.println(resultString);
				
				DataOutputStream dos = new DataOutputStream(response.getOutputStream());
				dos.writeBytes(resultString);
				dos.flush();
				dos.close();
			//}			
		}
	}
	catch(Exception e)
	{
		System.out.println("FAIL: Sorry, there was an error.");
		System.out.println("Exception thrown: "+ e.toString());
		e.printStackTrace();
	}
%>
<div style="width: 252px; height: 448px;">
	<img src="bigphone.jpg" />
	<div
		style="margin: -356px 0px 0px 46px; overflow: auto; overflow-x: hidden; height: 220px; width: 164px; font-family: arial; font-size: 70%; font-weight: bold; white-space: -moz-pre-wrap; word-wrap: break-word;">
		<br />
		<% out.println(resultString); %>
	</div>
</div>


