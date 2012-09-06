package ph.com.exakt.main;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.KeyPair;
import java.security.MessageDigest;
import java.security.PrivateKey;
import java.security.Provider;
import java.security.PublicKey;
import java.security.Security;
import java.security.Signature;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.xml.bind.DatatypeConverter;

import org.apache.http.impl.cookie.DateUtils;
import org.bouncycastle.openssl.PEMReader;

import ph.com.exakt.json.JSONModel;
import ph.com.exakt.json.Reader;

import com.google.gson.Gson;
import com.google.gson.stream.JsonWriter;

/*
 * @author Johne
 */

public class ActingServer {

	private static String input;
	private static String phone;

	public static final String SIGNATURE_ALGORITHM 		= "SHA1withRSA";
	public static final String CONTENT_TYPE 			= "application/vnd.net.wyrls.Message-v1+json";
	public static final String METHOD 					= "POST";

	private static SimpleDateFormat ISO8601FORMAT = new SimpleDateFormat("yyyyMMdd'T'HHmmss");
	private static SimpleDateFormat RFC2822FORMAT = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss Z");

	// read PEM files starting with: -----BEGIN RSA PRIVATE KEY----- ...
	private static PrivateKey readPrivateKeyPEMFile(final String filePath) throws Exception {
		PEMReader pemr = new PEMReader(new BufferedReader(new InputStreamReader(ActingServer.class.getResourceAsStream(filePath))));
		KeyPair kp = (KeyPair)pemr.readObject();
		pemr.close();
		return kp.getPrivate();
	}

	// read PEM files starting with: -----BEGIN RSA PUBLIC KEY----- ...	
	private static PublicKey readPublicKeyPEMFile(final String filePath) throws Exception {
		PEMReader pemr = new PEMReader(new BufferedReader(new InputStreamReader(new FileInputStream(filePath))));
		PublicKey pubKey = (PublicKey)pemr.readObject();
		pemr.close();
		return pubKey;
	}

	public static void main(String[] args) throws Exception {

		/*
		 * Set Params
		 */
		try {
			input = args[0];
			phone = args[1];
		} catch (Exception e) {
			System.out.println("No input entered!");
		}

		/*
		 * Initialize the Current DateTime
		 */
		Date current = Calendar.getInstance().getTime();

		/*
		 * Construct the JSONObject 
		 */
		Gson gson = new Gson();
		JSONModel jsonModel = new JSONModel( phone, "54535", "text/plain", input , ISO8601FORMAT.format(current));

		String json = gson.toJson(jsonModel);
		
		/*
		 * Construct the MD5 Digest
		 */
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(json.getBytes(), 0, json.length());
		String md5String = DatatypeConverter.printBase64Binary(md.digest());

		/*
		 * Initialize the Content_Length HEADER
		 */
		int contentLength = json.length();

		if(json.length() == 0 || json.equals(null))
			contentLength = 0;

		if(md5String.length() == 0 || md5String.equals(null))
			md5String = "";

		/*
		 * Parse date to RFC compliant
		 */
		String rfcDate = RFC2822FORMAT.format(RFC2822FORMAT.parse(RFC2822FORMAT.format(current)));

		/*
		 * Construct StringToSign
		 */
		String stringToSign = 	ActingServer.METHOD + "\n" +
				"/exakt/InboundServlet" + "\n" +
				DateUtils.formatDate(DateUtils.parseDate(DateUtils.formatDate(current))) + "\n" +
				ActingServer.CONTENT_TYPE + "\n" +
				contentLength + "\n" +
				md5String + "\n";

		/*
		 * Initialize bouncycastle security provider
		 */
		Provider bc = new org.bouncycastle.jce.provider.BouncyCastleProvider();	
		Security.addProvider(bc);

		/*
		 * Load PrivateKey and sign the string
		 */
		PrivateKey priv = readPrivateKeyPEMFile("exakt-pri.pem");
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
		jw.name(JSONModel._USAGE_TYPE).value(jsonModel.getUsagetype());

		jw.endObject(); // }
		jw.close();
		writer.close();
		
		System.out.println("JSON:" + json);
		System.out.println("StringToSign: " + stringToSign);
		System.out.println("Signature: " + b64Signed);
		
		System.out.println("Done " + connection.getResponseCode() + "\n\n");
	}
}
