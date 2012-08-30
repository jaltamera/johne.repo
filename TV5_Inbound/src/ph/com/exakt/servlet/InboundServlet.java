package ph.com.exakt.servlet;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.Provider;
import java.security.Security;
import java.security.Signature;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.DatatypeConverter;

import org.apache.http.impl.cookie.DateUtils;

import ph.com.exakt.auth.AuthProcessor;
import ph.com.exakt.json.JSONModel;
import ph.com.exakt.json.Reader;
import ph.com.exakt.main.ActingServer;

import com.google.gson.Gson;
import com.google.gson.stream.JsonWriter;

/**
 * Servlet implementation class InboundServlet
 */
public class InboundServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

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

	protected void processRequest(HttpServletRequest request, HttpServletResponse response){
		
		/*
		 * Wrap the InputStream so we can read it more than once
		 */
		InboundServletRequestWrapper isrw = null;
		Reader reader = null;

		try {
			isrw = new InboundServletRequestWrapper(request);
			reader = new Reader(isrw.getInputStream());
		} catch (IOException e) {
			System.out.println("InboundServlet error # 1: " + e);
		}

		/*
		 * Parse the inputstream to json
		 */
		Gson gson = new Gson();
		JSONModel jsonModel = reader.parse();
		String json = gson.toJson(jsonModel);

		String stringToSign = "";
		try {
			stringToSign = AuthProcessor.getStringToSign(isrw);
		} catch (NoSuchAlgorithmException e) {
			System.out.println("InboundServlet error # 2: " + e);
		} catch (ParseException e) {
			System.out.println("InboundServlet error # 3: " + e);
		}

		/*
		 * Read the AUTHORIZATION header
		 */
		String signature = "";

		String authHeader = request.getHeader("Authorization");
		if (authHeader != null) {
			java.util.StringTokenizer st = new java.util.StringTokenizer(authHeader);
			if (st.hasMoreTokens()) {
				String authType = st.nextToken();

				if (authType.equalsIgnoreCase("MCWS")) {

					String credentials = st.nextToken();

					int p = credentials.indexOf(":");
					if (p != -1) {
						signature = credentials.substring(p+1);
					}
				}
			}
		}

		/*
		 * Verify the request
		 */
		boolean valid = false;
		
		try {
			valid = AuthProcessor.verify(signature, stringToSign);
		} catch (Exception e) {
			System.out.println("InboundServlet error # 4: " + e);
		}
		
		if(valid){
			System.out.println("JSON Received: " + json + "\n\n");
			System.out.println("StringToSign: " + stringToSign);
		}else{
			System.out.println("Verification: " + valid);
		}
		
		//TODO remove everything below from here
		//TODO if valid add insertion of data to table
		/*
		 * Initialize the Current DateTime
		 */
		Date current = Calendar.getInstance().getTime();
		
		/*
		 * Initialize DateFormatter
		 */
		SimpleDateFormat ISO8601FORMAT = new SimpleDateFormat("yyyyMMdd'T'HHmmss");
		SimpleDateFormat RFC2822FORMAT = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss Z");

		
		/*
		 * Construct the JSONObject 
		 */
		JSONModel jsonModelR = new JSONModel( jsonModel.getTo(), jsonModel.getFrom(), "text/plain", "Hi" , ISO8601FORMAT.format(current));
		String jsonR = gson.toJson(jsonModelR);

		/*
		 * Construct the MD5 Digest
		 */
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(jsonR.getBytes(), 0, jsonR.length());
		String md5String = DatatypeConverter.printBase64Binary(md.digest());

		/*
		 * Initialize the Content_Length HEADER
		 */
		int contentLength = jsonR.length();

		if(jsonR.length() == 0 || jsonR.equals(null))
			contentLength = 0;

		if(md5String.length() == 0 || md5String.equals(null))
			md5String = "";

		/*
		 * Parse date to RFC compliant
		 */
		String rfcDate = ISO8601FORMAT.format(ISO8601FORMAT.parse(ISO8601FORMAT.format(current)));

		/*
		 * Construct StringToSign
		 */
		String stringToSignR = 	AuthProcessor.METHOD + "\n" +
				"exakt/InboundServlet" + "\n" +
				rfcDate + "\n" +
				AuthProcessor.CONTENT_TYPE + "\n" +
				contentLength + "\n" +
				md5String + "\n";

		/*
		 * Initialize bouncycastle security provider
		 */
		Provider bc = new org.bouncycastle.jce.provider.BouncyCastleProvider();	
		Security.addProvider(bc);

		/*
		 * Verify the request
		 */
		PrivateKey priv = readPrivateKeyPEMFile("/resources/exakt-pri.pem");
		Signature sig = Signature.getInstance(SIGNATURE_ALGORITHM, bc);
		sig.initSign(priv);
		sig.update(stringToSign.getBytes("UTF8"));

		byte[] byteSigned = sig.sign();

		String b64Signed = DatatypeConverter.printBase64Binary(byteSigned);

		/*
		 * Connection Initialization
		 */
		HttpURLConnection connection = null;
		connection = (HttpURLConnection)new URL("http://localhost/exakt/InboundServlet").openConnection();
		connection.setRequestMethod("POST");
		connection.setDoOutput(true);
		connection.setDoInput(true);

		connection.setRequestProperty("Content-Type", ActingServer.CONTENT_TYPE);
		connection.setRequestProperty("Host", "ismsteam");
		connection.setRequestProperty("Authorization", "MCWS u/4/exakt1:" + b64Signed);
		connection.setRequestProperty("Date", DateUtils.formatDate(DateUtils.parseDate(DateUtils.formatDate(current))));
		connection.setRequestProperty("Method", ActingServer.METHOD);

		connection.connect();

		/*
		 * POST the JSON
		 */
		OutputStream outputStream = connection.getOutputStream();

		PrintWriter writer = new PrintWriter(new OutputStreamWriter(outputStream, "UTF-8"));
		JsonWriter jw = new JsonWriter(writer);

		jw.beginObject(); // {
		jw.name(JSONModel._FROM).value(jsonModel.getFrom()); 
		jw.name(JSONModel._TO).value(jsonModel.getTo());
		jw.name(JSONModel._CONTENT_TYPE).value(jsonModel.getContentType()); 
		jw.name(JSONModel._BODY).value(jsonModel.getBody()); 
		jw.name(JSONModel._DATE).value(jsonModel.getDate()); 			

		jw.endObject(); // }
		jw.close();
		writer.close();

		System.out.println("Done ");

		
	}

}
