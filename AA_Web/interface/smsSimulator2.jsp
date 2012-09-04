<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import= "java.util.*"%>
<%@ page import= "com.dejima.core.io.Context"%>
<%@ page import= "com.dejima.core.io.AgentNetworkOutput"%>
<%@ page import= "com.dejima.core.kernel.ChainIdentifier"%>
<%@ page import= "com.dejima.core.nlp.text.action.InterpretationActuation"%>
<%@ page import= "com.ianywhere.aap.io.*"%>
<%@ page import= "com.interaksyon.formatter.*" %>
<%@ page import= "com.interaksyon.rsa.*" %>
<%@ page import= "com.interaksyon.json.*" %>

<%@ page import= "java.io.InputStream" %>
<%@ page import= "java.io.ObjectInputStream" %>
<%@ page import= "java.io.OutputStream" %>
<%@ page import= "java.io.ObjectOutputStream" %>

<%@ page import= "java.util.Enumeration"%>
<%@ page import= "java.io.*" %>
<%@ page import= "java.util.*" %>
<%@ page import= "org.json.simple.*" %>
<%@ page import= "org.json.simple.parser.*" %>
<%@ page import= "org.apache.http.impl.cookie.DateUtils" %>
<%@ page import= "net.sf.json.JSONObject" %>
<%@ page import= "com.google.gson.*" %>
<%@ page import= "com.google.gson.stream.*" %>

<jsp:useBean id="agentNetwork" class="com.dejima.sdk.AgentNetwork" scope="application"/>
<jsp:useBean id="agentNetworkOutput" class="com.dejima.core.io.AgentNetworkOutput" scope="session"/>

<%
    String resultString = "";
	String formattedOutput = "";
	String formatter = "traffic";
	String debug = request.getParameter("debug");
    
	final String FROM = "from";
	final String BODY = "body";
	
    ResourceBundle resource = ResourceBundle.getBundle("application");
	formatter = resource.getString("formatter.name");
	
	Gson gson;
	
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
		String input = "";	//request.getParameter("message");
        String phone = "";	//request.getParameter("phone");
		
        //Verification
        
        
        JSONModel jsonObject;
        String jsonString;
		/*Displays HTTP Header of client*/
		//just checking the http request header
							
		/*System.out.println(request.getMethod() + " " + request.getRequestURI() + " " + request.getProtocol());
	    System.out.println(request.getRemoteHost());
	    System.out.println(request.getHeader("Authorization"));
	    System.out.println(request.getHeader("Date"));
	    System.out.println(request.getHeader("Content-Type"));
	    System.out.println(request.getHeader("Content-Length"));
	    
		System.out.println("\nDone with the headers\n");*/
		
		/*end Displays HTTP Header of client*/
		
		try
		{
			
			//Instantiate GSON
			gson = new Gson();
						
			//establish http connection
			InputStream inputStream = request.getInputStream();
			//ObjectInputStream objectI = new ObjectInputStream(inputStream);
			//InputStreamReader is = new InputStreamReader(objectI);
			//jsonObject = gson.fromJson(is, JSONModel.class);
			com.interaksyon.json.Reader reader = new com.interaksyon.json.Reader(inputStream);
			jsonObject = reader.parse();
			jsonString = gson.toJson(jsonObject);
			//jsonString = (String)objectI.readObject();
			
			System.out.println("\nJSON: " + jsonString);
			
			//objectI.close();
			//is.close();
			inputStream.close();
					
			/*     Authorization    */
			
			String userID = null;
	  		String password = null;

		      // Assume not valid until proven otherwise
	
		      boolean valid = false;
	
		      // Get the Authorization header, if one was supplied
	
		      String authHeader = request.getHeader("Authorization");
		      if (authHeader != null) {
		         java.util.StringTokenizer st = new java.util.StringTokenizer(authHeader);
		         if (st.hasMoreTokens()) {
		            String authType = st.nextToken();
	
		            // We only handle HTTP Basic authentication
	
		            if (authType.equalsIgnoreCase("MCWS")) {
		               
		            	//System.out.println("AUTHTYPE is MCWS : Success!");
		            	
		            	String credentials = st.nextToken();
						
		               //MCWS client_id:signature
		               // This example uses sun.misc.* classes.
		               // You will need to provide your own
		               // if you are not comfortable with that.
	
		               //sun.misc.BASE64Decoder decoder = new sun.misc.BASE64Decoder();
		              // String userPass =
		                  //new String(decoder.decodeBuffer(credentials));
	//	               String encoding = new sun.misc.BASE64Encoder().encode (userPassword.getBytes());
	
		               // The decoded string is in the form
		               // "userID:password".
	
		               int p = credentials.indexOf(":");
		               if (p != -1) {
		                  userID = credentials.substring(0, p);
		                  password = credentials.substring(p+1);
							                  
							//verify the signature 					
					
		                  if ((!userID.trim().equals("")) &&
		                      (!password.trim().equals(""))) {
		                     
		                	//System.out.println("Authorization header is not null");
		                     
		                	String stringToSign = AuthProcessor.createStringToSign(request, jsonObject);
		                	
		             		valid = AuthProcessor.verify(password, stringToSign);		
		                    
		             		System.out.println("Result: " + valid + "\n\n" + "StringToSign: " + stringToSign + "\n\n" + "Signature: " + password + "\n\n" + "JSONModel" + jsonString);
		             		
		             		//assertion: verification successful
		             		if(valid){
		             			
		             		
		             			JSONParser parser = new JSONParser();
		          			  ContainerFactory containerFactory = new ContainerFactory(){
		          				public List creatArrayContainer() {
		          				  return new LinkedList();
		          				}

		          				public Map createObjectContainer() {
		          				  return new LinkedHashMap();
		          				}
		          							
		          			  };
		          							
		          			  try{
		          				Map json = (Map)parser.parse(jsonString, containerFactory);
		          				Iterator iter = json.entrySet().iterator();
		          				//System.out.println("==iterate result==");
		          				while(iter.hasNext()){
		          				  Map.Entry entry = (Map.Entry)iter.next();
		          				  //System.out.println(entry.getKey() + "=>" + entry.getValue());
		          				  if(entry.getKey().toString().equals(FROM))
		          				  		phone = entry.getValue().toString();
		          				  		
		          				  if(entry.getKey().toString().equals(BODY))
		          					  	input = entry.getValue().toString();
		          				}
		          									
		          				//System.out.println("==toJSONString()==");
		          				//System.out.println(JSONValue.toJSONString(json));
		          			  }
		          			  catch(ParseException pe){
		          				System.out.println(pe);
		          			  }
		          			  
		          			//System.out.println("\nDone with the JSONObject\n");
		          			  
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
			          				    
			          				    //System.out.println("Formatted Output=" + formattedOutput);				
			          					//System.out.println(InterpretationActuation.getXml(agentNetworkOutput.getInterpretation(), true));
			          			        resultString += formattedOutput;
			          			         
			          			        resultString = resultString.replaceAll("<LF>", "<br/>");
			          					System.out.println("\nAA output: " + resultString);
			          			        
			          					//System.out.println(resultString);
			          					
			          					String params[] = new String[]{resultString, phone};
			          					
			          					Object[] objectArray = AuthProcessor.sign(request, stringToSign, params);
			          					System.out.println("\nSigning Complete: ");// + (String)objectArray[1]);
			          			        	
			          					//Set request properties
			          					
			          					
			          					
			          					response.setHeader("Content-Type", AuthProcessor.CONTENT_TYPE);
			          					response.setHeader("Host", "ismsteam.com");
			          					response.setHeader("Authorization","MCWS u/4/exakt1:" + objectArray[0]); // CHANGE THE ID
			          					response.setHeader("Date", DateUtils.formatDate(DateUtils.parseDate(DateUtils.formatDate(Calendar.getInstance().getTime()))));
			          					response.setHeader("Method", "POST");
			          							
			          					//Sending POST Request using ObjectOutputStream
				          			    OutputStream outputStream = response.getOutputStream();
			          					/*ObjectOutputStream objectO = new ObjectOutputStream(outputStream);
			          			        objectO.writeObject("hello");//objectArray[1].toString());
			          			     	System.out.println("\nnapadala ang hello");
			          			        
			          			        outputStream.flush();
			          					objectO.flush();
			          			        outputStream.close();
			          					objectO.close();*/
			          					
			          					JSONModel newJsonModel = (JSONModel)objectArray[1];
			          					
			          					PrintWriter writer = new PrintWriter(new OutputStreamWriter(outputStream, "UTF-8"));
			          					//writer.println(...);
			          							
			          					JsonWriter jw;
			          					
			          					 try {
			          						jw = new JsonWriter(writer);

			          						jw.beginObject(); // {
			          						jw.name(JSONModel._FROM).value(newJsonModel.getFrom()); 
			          						jw.name(JSONModel._TO).value(newJsonModel.getTo());
			          						jw.name(JSONModel._CONTENT_TYPE).value(newJsonModel.getContentType()); 
			          						jw.name(JSONModel._BODY).value(newJsonModel.getBody()); 
			          						jw.name(JSONModel._DATE).value(newJsonModel.getDate()); 			

			          						jw.endObject(); // }
			          						jw.close();

			          						System.out.println("Done ");

			          					 } catch (IOException e) {
			          						System.out.println(e + ": Error in JsonWriter");
			          					 }
			          			        
			          				//}			
			          			}
		          			
		             		}else{
		             			resultString = "Verification Process Failed...";
		             			System.out.println(resultString);
		             		}
		          	        
		          	       
		             		
		                  }
		               }
		            }
		         }
		      }
			      
			      //End of Authorization
			
			
			
		} catch (IOException e){
			System.out.println(e);
		} 
								
       	
	}
	catch(Exception e)
	{
		System.out.println("FAIL: Sorry, there was an error.");
		System.out.println("Exception thrown: "+ e.toString());
		e.printStackTrace();
	}
%>
<div style="width: 252px; height:448px;">
<img src="bigphone.jpg"/>
	<div style="margin: -356px 0px 0px 46px; 
			overflow: auto; overflow-x: hidden; 
			height: 220px; width: 164px; 
			font-family: arial; font-size: 70%;
			font-weight: bold; white-space: -moz-pre-wrap; 
			word-wrap: break-word;">
			<br/><% out.println(resultString); %>
	</div>
</div>
				

