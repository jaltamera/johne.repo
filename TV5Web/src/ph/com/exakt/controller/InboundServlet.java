package ph.com.exakt.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.simple.parser.ContainerFactory;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import ph.com.exakt.auth.AuthProcessor;
import ph.com.exakt.auth.InboundServletWrapper;
import ph.com.exakt.json.JSONModel;
import ph.com.exakt.json.Reader;
import ph.com.exakt.model.RequestObject;
import ph.com.exakt.model.WorkQueue;
import ph.com.exakt.model.WorkQueueFactory;

import com.google.gson.Gson;

/**
 * Servlet implementation class InboundServlet
 */
public class InboundServlet extends HttpServlet {
	
	private static Logger logger = Logger.getLogger(InboundServlet.class);
	
	private static final long serialVersionUID = 1L;

	static WorkQueue workQueue;
	
	static{
		workQueue = WorkQueueFactory.getQueueInstance();
	}
	//private static Logger logger = Logger.getLogger(InboundServlet.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InboundServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.processRequest(request, response);
	}
	
	public void processRequest(HttpServletRequest request, HttpServletResponse response){

		try{
			
			InboundServletWrapper wrapper = new InboundServletWrapper(request);
			Reader jsonReader = new Reader(wrapper.getReader());

			JSONModel jsonModel = jsonReader.parse();

			Gson gson = new Gson();

			String userID = "";
			String password = "";
			String phone = "";
			String input = "";
			
			String jsonString = gson.toJson(jsonModel);
			
			System.out.println("JSON: " + jsonString);
			
			boolean valid = false;

			String authHeader = request.getHeader("Authorization");
			if (authHeader != null) {
				
				StringTokenizer st = new StringTokenizer(authHeader);
				
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
								
								String stringToSign = AuthProcessor.getStringToSign(wrapper);
									
								//System.out.println(stringToSign);
								
								DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
								Date date = new Date();
								
								valid = AuthProcessor.verify(password, stringToSign);		
								
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

									Map json = (Map)parser.parse(jsonString, containerFactory);
									Iterator iter = json.entrySet().iterator();
									//System.out.println("==iterate result==");
									while(iter.hasNext()){
										Map.Entry entry = (Map.Entry)iter.next();
										//System.out.println(entry.getKey() + "=>" + entry.getValue());
										if(entry.getKey().toString().equals("from"))
											phone = entry.getValue().toString();

										if(entry.getKey().toString().equals("body"))
											input = entry.getValue().toString();
									}
									
								workQueue.execute(new RequestObject(input, phone));
										
								}
								
								//log 
								logger.info("\n" + dateFormat.format(date) + " " + input + " " + phone + " " + valid);
								
							}
						}
					}
				}
			}

			//End of Authorization

		}catch(IOException ioe){
			ioe.printStackTrace();
			logger.error(ioe);
			//logger.error(ioe);
		}catch(ParseException pe){
			pe.printStackTrace();
			logger.error(pe);
			//logger.error(pe);
		}catch(NoSuchAlgorithmException nsae){
			nsae.printStackTrace();
			logger.error(nsae);
			//logger.error(nsae);
		}catch(Exception e){
			e.printStackTrace();
			logger.error(e);
			//logger.fatal("Wild error appeared while reading processing the request: " + e);
		}

	}

}
