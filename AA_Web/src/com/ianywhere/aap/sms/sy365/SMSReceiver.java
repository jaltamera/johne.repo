package com.ianywhere.aap.sms.sy365;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.dejima.apps.poc.Sybase365.Connector365;
import com.dejima.apps.poc.Sybase365.GenericXMLParser;
import com.dejima.apps.poc.Sybase365.Set365MessageProperties;
import com.dejima.utils.log.LogManager;

/**
 * SMS receiver class performs sms request parsing to retrieve required 
 * information from the input and performs response preparation by
 * adding required headers and credentials to the response  
 * 
 * @author singhb
 * Date: 08/04/2007
 */
public class SMSReceiver 
{	
	protected static final LogManager logger = new LogManager(SMSReceiver.class);
	
	Set365MessageProperties smp = null;		
	Connector365 con = null;
	GenericXMLParser gxp = null;
	private String propertyName = ""; 
	
	private String msisdn = "";
	private String originatingAddr = "";
	private String inputMessage = "";
	private String operatorId = "";
	private String shortcode = "";
	
	public SMSReceiver(String property)
	{
		propertyName = property;
		smp = new Set365MessageProperties();		
		con = new Connector365();
		gxp = new GenericXMLParser();	
	}

	public String getInput()
	{
		return inputMessage;
	}
	
	/**
	 * Parse the sms request received by the Sybase 365
	 * @param request http request 
	 * @return String message received by Sybase 365
	 * @throws ServletException
	 * @throws IOException
	 */
	
	public String parseRequest(HttpServletRequest request) throws ServletException, IOException
	{	
		if(request != null)
		{
			logger.info("SMSRECEIVER::Received SMS Message");
			try
			{				
				BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
				String msg = "";
				StringBuffer xmlData = new StringBuffer();
		
				//Read the data		
				msg = br.readLine();
				while(msg!=null) 
				{
					xmlData.append(msg.trim());
					msg = br.readLine();
				}
				
				new URLDecoder();
				msg = URLDecoder.decode(xmlData.toString(), "UTF-8");
				//logger.info("-------------Sybase 365 XML Recvd------------\n" + msg);
				inputMessage = parseXML(msg);
			}
			catch(Exception e)
			{
				logger.error("SMSReceiver:Parse request Exception:" + e.getMessage());
				return "";
			}
		}
		return inputMessage;
	}
	
	/**
	 * Parse the message content  to retrieve information 
	 * @param xmlMsg Message content
	 * @return String user sms input retrieved form the message tag
	 */
	public String parseXML(String xmlMsg)
	{
		try
		{
			String varName = "XmlMsg=";
			int index = xmlMsg.indexOf(varName);
			xmlMsg = xmlMsg.substring(index + varName.length());
			Hashtable hash = gxp.parseXML(xmlMsg);
			Vector v_msisdn = (Vector)hash.get("MSISDN");
			Vector v_originatingAddr = (Vector)hash.get("ORIGINATING_ADDRESS");
			Vector v_message = (Vector)hash.get("MESSAGE");
			Vector v_operatorId = (Vector) hash.get("OPERATORID");
			 
			msisdn = (String) v_msisdn.elementAt(0);
			originatingAddr = (String) v_originatingAddr.elementAt(0);
			operatorId = (String) v_operatorId.elementAt(0);
			shortcode = originatingAddr;
			
			return (String) v_message.elementAt(0);
		}
		catch(Exception e)
		{
			logger.error("SMSReceiver:Parse xml Exception:" + e.getMessage());
			
			return "";
		}
		
	}
	public boolean isParserOK()
	{
		if (gxp.xmlOk)
		{
			logger.info("SMSRECEIVER::Sent OK ACK");
			return true;
		}
		else
		{
			logger.info("SMSRECEIVER::Sent NOK ACK");
			return false;
		}
	}
	/**
	 * Prepares SMS response for Sybase 365 
	 * @param formattedOutput response to be sent to the user
	 * @return List sms response
	 */
	public List<String> prepareSMSResponse(String formattedOutput)
	{
		try {		
			URL url = new URL(SY365ResourceBundle.getResource(propertyName + ".url"));
			smp.setHeaderPost(url.getPath() + " HTTP/1.1");
			smp.setHeaderHost(url.getHost());
		} catch (MalformedURLException e) {
			logger.error("SMSRECEIVER::MalformedURLException" + e.getMessage());
		}		
		smp.setUserID(SY365ResourceBundle.getResource(propertyName + ".username"));
		smp.setPassword(SY365ResourceBundle.getResource(propertyName + ".passwd"));
		smp.setVersion(SY365ResourceBundle.getResource(propertyName + ".version"));
		smp.setSubject(SY365ResourceBundle.getResource(propertyName + ".subject"));
		smp.setList(msisdn);
		//This is to make SMS msg look better with no junk chars with this regular expresssion.		
		if ((!formattedOutput.equals("")) && (formattedOutput != null))
		{
			formattedOutput = formattedOutput.replaceAll(",\\*\\*,,", " *** ");	
			formattedOutput = formattedOutput.trim();
			//smp.setText(formattedOutput);
		}
		else 
			formattedOutput = "Sorry No matches found for your request. Pls try again.";
						
		smp.setDCS("7b");
		smp.setOriginatingAddr(originatingAddr);
		//	SpliText set to yes, would send multiple SMS messages to user. 
		smp.setSplitText("yes");
		
		List<String> postMessage = null;
		List<List> message = new ArrayList<List>();
		String postMsg = "";
		

			smp.setText(formattedOutput);
			postMsg = con.get365MessageBody(smp);		
			logger.info("--------postMsg--------\n" + postMsg);
			postMessage = new ArrayList<String>();
			postMessage.add(SY365ResourceBundle.getResource(propertyName + ".url"));
			postMessage.add(postMsg);
			postMessage.add(smp.getHeaderAuthorization());
			message.add(postMessage);
			//System.out.println((String) postMessage.get(1));
						
		return postMessage;
	}
	public String getPhone()
	{
		return msisdn;
	}	
	public String getOperatorId()
	{
		return operatorId;
	}
	public String getShortcode()
	{
		return shortcode;
	}
	
	public static void main(String[] args)
	{
		String xml = 
			"XmlMsg=<?xml version=\"1.0\" ?>" +
			"<SMS_MO>" +
			"<MSISDN>+639175028433</MSISDN>" +
			"<ORIGINATING_ADDRESS>447786200131</ORIGINATING_ADDRESS>" +
			"<MESSAGE>Miles ko</MESSAGE>" +
			"<PARAMETERS>" +
			"<OPERATORID>7</OPERATORID>" +
			"<ACCOUNTID>21438</ACCOUNTID>" +
			"<MESSAGEID>740067925</MESSAGEID>" +
			"<OPERATOR_INFORMATION>" +
			"<OPERATOR_STANDARD>GSM</OPERATOR_STANDARD>" +
			"<OPERATOR_CODE>" +
			"<MCC>234</MCC>" +
			"<MNC>15</MNC>" +
			"</OPERATOR_CODE>" +
			"</OPERATOR_INFORMATION>" +
			"<DCS>7b</DCS>" +
			"<CLASS>0</CLASS>" +
			"<RECEIVED_SERVICENUMBER>447786200131</RECEIVED_SERVICENUMBER>" +
			"<KEYWORD>N/A</KEYWORD>" +
			"<RECEIVEDTIME>" +
			"<DATE>Mon, 20 Oct 2008</DATE>" +
			"<TIME>03:15:33</TIME>" +
			"</RECEIVEDTIME>" +
			"</PARAMETERS>" +
			"</SMS_MO>";
		
		SMSReceiver smsReceiver = new SMSReceiver("XmlMsg");
		smsReceiver.parseXML(xml);
		
		System.out.println("operatorId=" + smsReceiver.getOperatorId());
	}
}
