package aa.exakt;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.security.KeyPair;
import java.security.MessageDigest;
import java.security.PrivateKey;
import java.security.Provider;
import java.security.Security;
import java.security.Signature;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.xml.bind.DatatypeConverter;

import org.apache.http.impl.cookie.DateUtils;
import org.bouncycastle.openssl.PEMReader;

import com.google.gson.Gson;

public class AuthProcessor
{
	
	private RequestObject r;
	private String result;
	private Date date;

	private static final String SIGNATURE_ALGORITHM 	= "SHA1withRSA";
	//private static final String PRIVATE_KEY_FILE 		= "resources/exakt-pri.pem";
	//private static final String PUBLIC_KEY_FILE		= "exakt-key.pem";//"resources/xyber1.pkcs1.pub.pem";
	
	public static final String CONTENT_TYPE 			= "application/vnd.net.wyrls.Message-v1+json";
	public static final String METHOD 					= "POST";
	
	private static Provider bc;
	
	public AuthProcessor(RequestObject r, String result, Date date){
		this.r = r;
		this.result = result;
		this.date = date;
	}
	
	// read PEM files starting with: -----BEGIN RSA PRIVATE KEY----- ...
	private static PrivateKey readPrivateKeyPEMFile() throws Exception {
		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
	    InputStream stream = classLoader.getResourceAsStream("config/exakt-pri.pem");//server-pub.pem");
		
		PEMReader pemr = new PEMReader(new BufferedReader(new InputStreamReader(stream)));
        KeyPair kp = (KeyPair)pemr.readObject();
        return kp.getPrivate();
	}
	
	
	// read PEM files starting with: -----BEGIN RSA PUBLIC KEY----- ...	
	/*private static PublicKey readPublicKeyPEMFile(final String filePath) throws Exception {
		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
	    InputStream stream = classLoader.getResourceAsStream("/config/xyber1.pkcs1.pub.pem");//server-pub.pem");
	    		//resources/xyber1.pkcs1.pub.pem");//
	      
        PEMReader pemr = new PEMReader(new BufferedReader(new InputStreamReader(stream)));
        PublicKey pubKey = (PublicKey)pemr.readObject();
        return pubKey;
	}	*/
	
	/*public static boolean verify(String signature, String stringToSign){
		
		boolean valid = Boolean.FALSE;
		try{
			AuthProcessor.init();
			
			// read the public key from a PEM file
			PublicKey pub = readPublicKeyPEMFile(PUBLIC_KEY_FILE);
			
			Signature vsig = Signature.getInstance(SIGNATURE_ALGORITHM, bc);
			vsig.initVerify(pub);
			vsig.update(stringToSign.getBytes("UTF8"));
			
			byte[] byteSigned = javax.xml.bind.DatatypeConverter.parseBase64Binary(signature);
			
			 valid = vsig.verify(byteSigned);
			
		}catch(Exception e){
			System.out.println(e);
		}
		return valid;
	}*/
	
	private static SimpleDateFormat ISO8601FORMAT = new SimpleDateFormat("yyyyMMdd'T'HHmmss");
	private static SimpleDateFormat RFC2822FORMAT = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss zzz");
	
	public Object[] sign()throws Exception{
		
		//Instantiate GSON
		Gson gson = new Gson();
		
		//Construct the JSON Object from String
	      
       /* String jsonString = new String("{" +
							"\"from\":\"54535\"," +   								//our ACCESS NUMBER : constant
							"\"to\":\"" + r.getPhone() + "\"," +						//user's MOBILE NUMBER
							"\"content_type\":\"text/plain\"," +
							"\"body\":\"" + result + "\"," +						// output
							"\"date\":\"" + ISO8601FORMAT.format(current) + "\"" +	//parse DateTime to ISO8601 Compliant format		
							"}");*/
		JSONModel jsonModel = new JSONModel("54535", r.getPhone(), "text/plain", result, ISO8601FORMAT.format(date), "MMDA_REPLY_FREE");
		
        //JSONObject jsonObject = (JSONObject)JSONSerializer.toJSON(jsonString);
        String json = gson.toJson(jsonModel);
        //Parse DateTime to RFC 2822 Compliant format
		//String rfcDate = ISO8601FORMAT.format(ISO8601FORMAT.parse(ISO8601FORMAT.format(current)));
		
        System.out.println(json);
        
		//MD5 digest of the JSON encoded message body
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(json.getBytes("UTF-8"), 0, json.getBytes("UTF-8").length);
		String md5String = DatatypeConverter.printBase64Binary(md.digest());
		
		int contentLength = json.getBytes("UTF-8").length;
		
		if(json.length() == 0 || json.equals(null))
			contentLength = 0;
			
		if(md5String.length() == 0 || md5String.equals(null))
			md5String = "";
		
		//Construct stringToSign for Base64Encoded Signature
		String stringToSign = 	AuthProcessor.METHOD + "\n" +
								"/messages" + "\n" +
								DateUtils.formatDate(DateUtils.parseDate(DateUtils.formatDate(date))) + "\n" +
								AuthProcessor.CONTENT_TYPE + "\n" +
								contentLength + "\n" +
								md5String + "\n";
				
		System.out.println(stringToSign);
		
		AuthProcessor.init();
		
		//Load the Private-Key file for signing
		PrivateKey priv = readPrivateKeyPEMFile();
		Signature sig = Signature.getInstance(SIGNATURE_ALGORITHM, bc);
		sig.initSign(priv);
		sig.update(stringToSign.getBytes("UTF8"));
		
		byte[] byteSigned = sig.sign();
		
		//The signature is finally Base64 encoded
		String b64Signed = DatatypeConverter.printBase64Binary(byteSigned);
		
		System.out.println(b64Signed);
		
		return new Object[]{b64Signed, json , new Integer(contentLength)};
	}
	
	private static void init(){
		
		bc = new org.bouncycastle.jce.provider.BouncyCastleProvider();	
		Security.addProvider(bc);
	}
}

