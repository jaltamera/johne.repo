package com.ianywhere.aap.io;

import com.dejima.core.io.Context;
import com.dejima.core.nlp.text.action.XmlActuation;

public class UserContext 
{
	XmlActuation actuation;
	String sessionid;
	String id;
	Context context;
	
	public UserContext(String msisdn, String session, XmlActuation userActuation, Context ctx)
	{
		actuation = userActuation;
		sessionid = session;
		id = msisdn;
		context = ctx;
	}
	public UserContext() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() 
	{
		StringBuffer sb = new StringBuffer();
		sb.append("UserContext[sessionid=").append(sessionid).append(",id=");
		sb.append(id).append(",context=").append(context).append("]");
		return sb.toString();
	}
	public String getSessionid() 
	{
		return sessionid;
	}
	public void setSessionid(String sessionid) 
	{
		this.sessionid = sessionid;
	}
	public String getId() 
	{
		return id;
	}
	public void setId(String id) 
	{
		this.id = id;
	}
	public XmlActuation getActuation() 
	{
		return actuation;
	}
	public void setActuation(XmlActuation actuation) 
	{
		this.actuation = actuation;
	}
	public Context getContext() 
	{
		return context;
	}
	public void setContext(Context context) 
	{
		this.context = context;
	}
}

