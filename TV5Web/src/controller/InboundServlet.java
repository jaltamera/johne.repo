package controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.auth.AuthProcessor;
import model.auth.InboundServletWrapper;
import model.com.RequestObject;
import model.com.WorkQueue;
import model.com.WorkQueueFactory;
import model.json.JSONModel;
import model.json.Reader;

import org.json.simple.parser.ContainerFactory;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.google.gson.Gson;

/**
 * Servlet implementation class InboundServlet
 */
public class InboundServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
		//System.out.println("Hello World!");

		/*System.out.println(request.getMethod() + " " + request.getRequestURI() + " " + request.getProtocol());
		//System.out.println(request.getRemoteHost());
		System.out.println(request.getHeader("Authorization"));
		System.out.println(request.getHeader("Date"));
		System.out.println(request.getHeader("Content-Type"));
		System.out.println(request.getHeader("Content-Length"));
		System.out.println();*/

		try{
			//RequestObject requestObject = new RequestObject(request);

			//Reader jsonReader = new Reader(requestObject.getBufferedReader());
			//JSONModel jsonModel = jsonReader.parse();
			
			InboundServletWrapper wrapper = new InboundServletWrapper(request);
			Reader jsonReader = new Reader(wrapper.getReader());

			JSONModel jsonModel = jsonReader.parse();
			/*     Authorization    */

			Gson gson = new Gson();

			String userID = "";
			String password = "";
			String phone = "";
			String input = "";
			String jsonString = gson.toJson(jsonModel);
			
			boolean valid = false;

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
								
								String stringToSign = AuthProcessor.getStringToSign(wrapper);
									
								//System.out.println(stringToSign);
								
								valid = AuthProcessor.verify(password, stringToSign);		

								System.out.println("Result: " + valid);

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
									
								WorkQueue workQueue = WorkQueueFactory.getQueueInstance();
								workQueue.execute(new RequestObject(input, phone));
										
								}
							}
						}
					}
				}
			}

			//End of Authorization

		}catch(IOException ioe){
			ioe.printStackTrace();
			//logger.error(ioe);
		}catch(ParseException pe){
			pe.printStackTrace();
			//logger.error(pe);
		}catch(NoSuchAlgorithmException nsae){
			nsae.printStackTrace();
			//logger.error(nsae);
		}catch(Exception e){
			e.printStackTrace();
			//logger.fatal("Wild error appeared while reading processing the request: " + e);
		}

	}

}
