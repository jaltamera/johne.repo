package exakt.test;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
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

import javax.xml.bind.DatatypeConverter;

import org.apache.http.impl.cookie.DateUtils;
import org.bouncycastle.openssl.PEMReader;

import com.google.gson.Gson;
import com.google.gson.stream.JsonWriter;


public class Server 
{
	private static final String SIGNATURE_ALGORITHM 	= "SHA1withRSA";
	//private static final String STRING_TO_SIGN   		= "hello world\n";
	private static final String PRIVATE_KEY_FILE 		= "src/exakt/test/server-pri.pem";
	//private static final String PUBLIC_KEY_FILE			= "exakt-key.pem";		
		
	// read PEM files starting with: -----BEGIN RSA PRIVATE KEY----- ...
	private static PrivateKey readPrivateKeyPEMFile(final String filePath) throws Exception {
		PEMReader pemr = new PEMReader(new BufferedReader(new InputStreamReader(new FileInputStream(filePath))));
        KeyPair kp = (KeyPair)pemr.readObject();
        return kp.getPrivate();
	}
	
	// read PEM files starting with: -----BEGIN RSA PUBLIC KEY----- ...	
	private static PublicKey readPublicKeyPEMFile(final String filePath) throws Exception {
        PEMReader pemr = new PEMReader(new BufferedReader(new InputStreamReader(new FileInputStream(filePath))));
        PublicKey pubKey = (PublicKey)pemr.readObject();
        return pubKey;
	}
		
	private static SimpleDateFormat ISO8601FORMAT = new SimpleDateFormat("yyyyMMdd'T'HHmmss");
	private static SimpleDateFormat RFC2822FORMAT = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss Z");
			
    public static void main(String[] args) throws Exception
    {
			
		java.util.Date current = Calendar.getInstance().getTime();
				
		//Instantiate GSON
		Gson gson = new Gson();
		
		//Construct the JSON Object from String
		
		JSONModel jsonModel = new JSONModel(args[1], "54535", "text/plain", args[0], ISO8601FORMAT.format(current));
		
        //JSONObject jsonObject = (JSONObject)JSONSerializer.toJSON(jsonString);
        String json = gson.toJson(jsonModel);
		
        System.out.println(json);
        
        //Parse DateTime to RFC 2822 Compliant format
		String rfcDate = RFC2822FORMAT.format(RFC2822FORMAT.parse(RFC2822FORMAT.format(current)));
		
		//MD5 digest of the JSON encoded message body
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(json.getBytes(), 0,json.length());
		String md5String = DatatypeConverter.printBase64Binary(md.digest());
		
		int contentLength = json.length();
		
		if(json.length() == 0 || json.equals(null))
			contentLength = 0;
			
		if(md5String.length() == 0 || md5String.equals(null))
			md5String = "";
		
		//Construct stringToSign for Base64Encoded Signature
		String stringToSign = 	"POST" + "\n" +
								"/TV5Web/InboundServlet" + "\n" +
								rfcDate + "\n" +
								"application/vnd.net.wyrls.Message-v1+json" + "\n" +
								contentLength + "\n" +
								md5String;
				
				
		Provider bc = new org.bouncycastle.jce.provider.BouncyCastleProvider();
		Security.addProvider(bc);
		
		//Load the Private-Key file for signing
		PrivateKey priv = readPrivateKeyPEMFile(PRIVATE_KEY_FILE);
		Signature sig = Signature.getInstance(SIGNATURE_ALGORITHM, bc);
		sig.initSign(priv);
		sig.update(stringToSign.getBytes("UTF8"));
		
		byte[] byteSigned = sig.sign();
		
		//The signature is finally Base64 encoded
		String b64Signed = DatatypeConverter.printBase64Binary(byteSigned);
		
		System.out.println(stringToSign);
		
        URL url = new URL("http://localhost/TV5Web/InboundServlet");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

        // Initialize the connection 
        conn.setDoOutput(true);
        conn.setDoInput(true);
        conn.setRequestMethod("POST");
        conn.setUseCaches(false);
        conn.setRequestProperty("Content-Type", "application/vnd.net.wyrls.Message-v1+json");
        conn.setRequestProperty("Host", "SampleServer");
		conn.setRequestProperty("Authorization", "MCWS u/4/exakt1:" + b64Signed);
		conn.setRequestProperty("Date", DateUtils.formatDate(DateUtils.parseDate(DateUtils.formatDate(current))));
		conn.setRequestProperty("Method", "POST");
		
        conn.connect();

        //PrintWriter writer = new PrintWriter(new OutputStreamWriter(conn.getOutputStream(), "UTF-8"));
			          							          							
		JsonWriter jw;
		
		 try {
			jw = new JsonWriter(new OutputStreamWriter(conn.getOutputStream(), "UTF-8"));

			jw.beginObject(); // {
			jw.name(JSONModel._FROM).value(jsonModel.getFrom()); 
			jw.name(JSONModel._TO).value(jsonModel.getTo());
			jw.name(JSONModel._CONTENT_TYPE).value(jsonModel.getContentType()); 
			jw.name(JSONModel._BODY).value(jsonModel.getBody()); 
			jw.name(JSONModel._DATE).value(jsonModel.getDate()); 			

			jw.endObject(); // }
			jw.close();

			System.out.println("Done ");

		 } catch (IOException e) {
			System.out.println(e + ": Error in JsonWriter");
		 }

         String strServerResponse = "";

		BufferedReader inStream = null;
		inStream = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		
        System.out.println("Server says: ");
        while ((strServerResponse = inStream.readLine()) != null)
        {
            System.out.println(strServerResponse);
        } // end while

        inStream.close(); 
        
     }
}