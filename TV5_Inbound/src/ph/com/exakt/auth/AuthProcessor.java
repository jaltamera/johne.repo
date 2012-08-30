package ph.com.exakt.auth;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.security.KeyPair;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.Provider;
import java.security.PublicKey;
import java.security.Security;
import java.security.Signature;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.DatatypeConverter;

import org.bouncycastle.openssl.PEMReader;

import ph.com.exakt.servlet.InboundServletRequestWrapper;


public class AuthProcessor
{

	private static final String SIGNATURE_ALGORITHM 	= "SHA1withRSA";
	private static final String PRIVATE_KEY_FILE 		= "/WEB_INF/lib/exakt-key.pem";
	private static final String PUBLIC_KEY_FILE			= "/WEB_INF/lib/xyber1.pkcs1.pub.pem";
	
	public static final String CONTENT_TYPE 			= "application/vnd.net.wyrls.Message-v1+json";
	public static final String METHOD 					= "POST";
	
	private static Provider bc;
	
	// read PEM files starting with: -----BEGIN RSA PRIVATE KEY----- ...
	private static PrivateKey readPrivateKeyPEMFile(final String filePath) throws Exception {
        PEMReader pemr = new PEMReader(new BufferedReader(new InputStreamReader(new FileInputStream(filePath))));
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
	
	public static boolean verify(String signature, String stringToSign)throws Exception{
		
		AuthProcessor.init();
		
		// read the public key from a PEM file
		PublicKey pub = readPublicKeyPEMFile(PUBLIC_KEY_FILE);
		
		Signature vsig = Signature.getInstance(SIGNATURE_ALGORITHM, bc);
		vsig.initVerify(pub);
		vsig.update(stringToSign.getBytes("UTF8"));
		
		byte[] byteSigned = javax.xml.bind.DatatypeConverter.parseBase64Binary(signature);
		
		return vsig.verify(byteSigned);
	}
	
	private static SimpleDateFormat ISO8601FORMAT = new SimpleDateFormat("yyyyMMdd'T'HHmmss");
	private static SimpleDateFormat RFC2822FORMAT = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss Z");
	
	private static void init(){
		bc = new org.bouncycastle.jce.provider.BouncyCastleProvider();	
		Security.addProvider(bc);
	}
	
	public static String getStringToSign(HttpServletRequest request) throws ParseException, NoSuchAlgorithmException{
		
		InboundServletRequestWrapper isrw = (InboundServletRequestWrapper)request;
		
		//Parse DateTime to RFC 2822 Compliant format
		//String rfcDate = RFC2822FORMAT.format(RFC2822FORMAT.parse(request.getHeader("Date")));
			
		//MD5 digest of the JSON encoded message body
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(isrw.getBody().getBytes(), 0, isrw.getBody().length());
		String md5String = DatatypeConverter.printBase64Binary(md.digest());
					
		if(md5String.length() == 0 || md5String.equals(null))
			md5String = "";
		
		//Construct stringToSign for Base64Encoded Signature
		String stringToSign = 	request.getMethod() + "\n" +
								request.getRequestURI() + "\n" +
								request.getHeader("Date") + "\n" +
								request.getHeader("Content-Type") + "\n" +
								isrw.getBody().length() + "\n" +
								md5String;
		
		return stringToSign;
	}
}

