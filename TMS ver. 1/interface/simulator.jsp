<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<title>Exakt|TV5|MMDA Traffic Monitoring System</title>
</head>
<body>
<h3><a name="top"></a>Type your inquiry below</h3>
<form action="simulator.jsp" id="inputArea" name="inputArea" method="post"> 
<%
    String message = "";
    
    if(request.getParameter("message") != null)
    {
        message = request.getParameter("message");
    }
    
    String phone = "";
    
    if(request.getParameter("phone") != null)
    {
        phone = request.getParameter("phone").trim();
    }
 
%>

<table>
<tr>
        <td>Phone</td>
        <td><input type="text" value="<%= phone%>" name="phone" id="phone" size="25"/></td>
    </tr>
       <tr>
        <td>Input</td>
        <td><input type="text" value="<%= message %>" name="message" id="message" size="25"/></td>
    </tr>
    <tr>
        <td colspan="2">
            <input type="submit" value="Send"/>
            <input type="button" value="Clear" onclick="message.value = '';"/>
        </td>
    </tr>
</table>
</form>

<jsp:include page="smsSimulator2.jsp" />

</body>
</html>