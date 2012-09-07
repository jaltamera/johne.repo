package com.interaksyon.rsa;

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
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.DatatypeConverter;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;
import com.google.gson.*;
import com.interaksyon.json.JSONModel;

import org.bouncycastle.openssl.PEMReader;


public class AuthProcessor
{

	private static final String SIGNATURE_ALGORITHM 	= "SHA1withRSA";
	private static final String PRIVATE_KEY_FILE 		= "tv5/exakt-key.pem";
	private static final String PUBLIC_KEY_FILE			= "tv5/xyber1.pkcs1.pub.pem";
	
	public static final String CONTENT_TYPE 			= "application/vnd.net.wyrls.Message-v1+json";
	public static final String METHOD 					= "POST";
	
	private static Provider bc;
	
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
	
	public static Object[] sign(HttpServletRequest request, String signature, String[] params)throws Exception{
		
		java.util.Date current = Calendar.getInstance().getTime();
				
		//Instantiate GSON
		Gson gson = new Gson();
		
		//Construct the JSON Object from String
	      
        /*String jsonString = new String("{" +
							"\"from\":\"SU01\"," +   								//our ACCESS NUMBER : constant
							"\"to\":\"" + params[1] + "\"," +						//user's MOBILE NUMBER
							"\"content_type\":\"text/plain\"," +
							"\"body\":\"" + params[0] + "\"," +						// output
							"\"date\":\"" + ISO8601FORMAT.format(current) + "\"" +	//parse DateTime to ISO8601 Compliant format		
							"}");*/
		
		JSONModel jsonModel = new JSONModel("54535", params[1], "text/plain", params[0], ISO8601FORMAT.format(current));
		
        //JSONObject jsonObject = (JSONObject)JSONSerializer.toJSON(jsonString);
        String json = gson.toJson(jsonModel);
		
        //Parse DateTime to RFC 2822 Compliant format
		String rfcDate = ISO8601FORMAT.format(ISO8601FORMAT.parse(ISO8601FORMAT.format(current)));
		
		//MD5 digest of the JSON encoded message body
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(json.getBytes(), 0, json.length());
		String md5String = new BigInteger(1, md.digest()).toString(16);
		
		int contentLength = json.length();
		
		if(json.length() == 0 || json.equals(null))
			contentLength = 0;
			
		if(md5String.length() == 0 || md5String.equals(null))
			md5String = "";
		
		//Construct stringToSign for Base64Encoded Signature
		String stringToSign = 	AuthProcessor.METHOD + "\n" +
								request.getRequestURI() + "\n" +
								rfcDate + "\n" +
								AuthProcessor.CONTENT_TYPE + "\n" +
								contentLength + "\n" +
								md5String;
				
		AuthProcessor.init();
		
		//Load the Private-Key file for signing
		PrivateKey priv = readPrivateKeyPEMFile(PRIVATE_KEY_FILE);
		Signature sig = Signature.getInstance(SIGNATURE_ALGORITHM, bc);
		sig.initSign(priv);
		sig.update(stringToSign.getBytes("UTF8"));
		
		byte[] byteSigned = sig.sign();
		
		//The signature is finally Base64 encoded
		String b64Signed = DatatypeConverter.printBase64Binary(byteSigned);

		return new Object[]{b64Signed, jsonModel};
		
	}
	
	private static void init(){
		
		bc = new org.bouncycastle.jce.provider.BouncyCastleProvider();	
		Security.addProvider(bc);
		
	}
	
	
	public static String createStringToSign(HttpServletRequest request, Object jsonObject) throws ParseException, NoSuchAlgorithmException{
		
		Gson gson = new Gson();
		String jsonString = gson.toJson((JSONModel)jsonObject);
		
		//Parse DateTime to RFC 2822 Compliant format
		String pattern = "EEE, dd MMM yyyy HH:mm:ss Z";
		SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
		String rfcDate = dateFormat.format(dateFormat.parse(dateFormat.format(dateFormat.parse(request.getHeader("Date")))));
			
		//MD5 digest of the JSON encoded message body
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(jsonString.getBytes(), 0, jsonString.length());
		String md5String = new BigInteger(1, md.digest()).toString(16);
					
		if(md5String.length() == 0 || md5String.equals(null))
			md5String = "";
		
		//Construct stringToSign for Base64Encoded Signature
		String stringToSign = 	request.getMethod() + "\n" +
								request.getRequestURI() + "\n" +
								rfcDate + "\n" +
								request.getHeader("Content-Type") + "\n" +
								jsonString.length() + "\n" +
								md5String;
		
		return stringToSign;
	}
}

