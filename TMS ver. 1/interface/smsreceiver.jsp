<%@ page import= "java.util.*"%>
<%@ page import= "com.ianywhere.aap.sms.io.*"%>
<%@ page import= "com.ianywhere.aap.sms.sy365.*"%>
<%@ page contentType="text/html" %>

<%
SMSReceiver smsReceiver = new SMSReceiver("sy365");
String input = smsReceiver.parseRequest(request);
if(smsReceiver.isParserOK())
{
    out.println("OK");
}
else
{
	out.println("NOK");
}
Thread t1 = new Thread(new ProcessSmsInput(smsReceiver)); 
t1.start(); %>