<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="com.dejima.core.io.Context"%>
<%@ page import="com.dejima.core.io.AgentNetworkOutput"%>
<%@ page import="com.dejima.core.kernel.ChainIdentifier"%>
<%@ page
	import="com.dejima.core.nlp.text.action.InterpretationActuation"%>
<%@ page import="com.ianywhere.aap.io.*"%>
<%@ page import="com.interaksyon.formatter.*"%>

<%@ page import="java.io.InputStream"%>
<%@ page import="java.io.ObjectInputStream"%>
<%@ page import="java.io.OutputStream"%>
<%@ page import="java.io.OutputStreamWriter"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

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

	try {
		//Load the Agent network if hasn't been loaded before
		if (agentNetwork.getOpalName() == null) {
			//load the opal
			String opalName = resource.getString("opal.path");
			String[] errors = agentNetwork.load(opalName);
			if (errors.length > 0) {
				//out.println("<hr>");
				resultString += "<hr>";
				// out.println("Errors found when loading " + opalName + ":<br>");
				resultString += "Errors found when loading " + opalName
						+ ":<br>";
				// out.println("<p><ol type=\"1\">");
				resultString += "<p><ol type=\"1\">";
				for (int i = 0; i < errors.length; i++) {
					System.out.println("<li>" + errors[i]);
					// out.println("<li>" + errors[i]);
					resultString += "<li>" + errors[i];
				}
				// out.println("</ol><hr>");
				resultString += "</ol><hr>";
			}
		}

		//Parse the request to retrieve the user input request
		String input = "";//request.getParameter("message");
		String phone = "";//request.getParameter("phone");
		String telco = "";

		try {

			//establish http connection
			InputStream inputStream = request.getInputStream();
			ObjectInputStream objectInputStream = new ObjectInputStream(inputStream);
			//input = (String)objectInputStream.readObject();
			
			Hashtable hashTable = (Hashtable) objectInputStream.readObject();
			input = (String) hashTable.get("input");
			phone = (String) hashTable.get("phone");
			telco = (String) hashTable.get("telco");
			
			try{
				
				if(telco.equalsIgnoreCase("sun")){
					input += " 1";
				}else if(telco.equalsIgnoreCase("globe")){
					input += " 2";
				}else if(telco.equalsIgnoreCase("smart")){
					input += " 3";
				}
				
			}catch(Exception e){
				e.printStackTrace();
			}
			
			System.out.println("\n===================");
			System.out.println("Message Received");
			
			objectInputStream.close();
			inputStream.close();

			UserSessionManager userSessMgr = UserSessionManager
					.getUserSessionManager();
			if (agentNetwork.getOpalName() != null && input != null) {

				//if(agentNetworkOutput.getChainID() == null){
				ChainIdentifier cid = userSessMgr.getChainID(phone);
				Context ctx = ((UserContext) cid.getSession())
						.getContext();
				AgentNetworkOutput newOutput = agentNetwork.process(
						input, cid, ctx, formatter);
				agentNetworkOutput.initializeTo(newOutput);
				formattedOutput = agentNetworkOutput
						.getFormattedOutput();
				Context recvd_ctx = agentNetworkOutput.getContext();
				ChainIdentifier recvd_cid = agentNetworkOutput
						.getChainID();

				userSessMgr.setChainID(phone, recvd_cid, recvd_ctx);

				//System.out.println("Formatted Output=" + formattedOutput);				
				//System.out.println(InterpretationActuation.getXml(agentNetworkOutput.getInterpretation(), true));
				resultString += formattedOutput;

				resultString = resultString.replaceAll("<LF>", "<br/>");
				System.out.println("\nAA output: " + resultString);

			}

				OutputStream outputStream = response.getOutputStream();
				ObjectOutputStream objectOutputStream = new ObjectOutputStream(outputStream);
				objectOutputStream.writeObject(resultString);
			
				objectOutputStream.flush();
				objectOutputStream.close();
				outputStream.flush();
				outputStream.close();

				/* OutputStreamWriter writer = new OutputStreamWriter(response.getOutputStream());

				writer.write(resultString);
				writer.flush();
				writer.close(); */

			

			//End of Authorization

		} catch (IOException e) {
			System.out.println(e);
		}

	} catch (Exception e) {
		System.out.println("FAIL: Sorry, there was an error.");
		System.out.println("Exception thrown: " + e.toString());
		e.printStackTrace();
	}
%>
<div style="width: 252px; height: 448px;">
	<img src="bigphone.jpg" />
	<div
		style="margin: -356px 0px 0px 46px; overflow: auto; overflow-x: hidden; height: 220px; width: 164px; font-family: arial; font-size: 70%; font-weight: bold; white-space: -moz-pre-wrap; word-wrap: break-word;">
		<br />
		<%
			out.println(resultString);
		%>
	</div>
</div>


