package com.interaksyon.json;


public class JSONModel {

	public static final String _FROM = "from";
	public static final String _TO = "to";
	public static final String _CONTENT_TYPE = "content_type";
	public static final String _BODY = "body";
	public static final String _DATE = "date";

	private String from;
	private String to;
	private String content_type;
	private String body;
	private String date;
	
	public JSONModel(){
		this.from = "";
		this.to = "";
		this.content_type = "";
		this.body = "";
		this.date = "";
	}
	
	public JSONModel(String from,
					 String to,
					 String content_type,
					 String body,
					 String date){

		this.from = from;
		this.to = to;
		this.content_type = content_type;
		this.body = body;
		this.date = date;
	}
	
	public void setFrom(String from){
		this.from = from;
	}

	public void setTo(String to){
		this.to = to;
	}

	public void setContentType(String content_type){
		this.content_type = content_type;
	}

	public void setBody(String body){
		this.body = body;
	}

	public void setDate(String date){
		this.date = date;
	}

	public String getFrom(){
		return this.from;
	}
	
	public String getTo(){
		return this.to;
	}
	
	public String getContentType(){
		return this.content_type;
	}
	
	public String getBody(){
		return this.body;
	}
	
	public String getDate(){
		return this.date;
	}
	
	/*@Override 
	public String toString() {
	    
		String result = new String("{" +
				"\"from\":\"" + this.from + "\"," +   								//our ACCESS NUMBER : constant
				"\"to\":\"" + this.to + "\"," +							//user's MOBILE NUMBER
				"\"content_type\":\"" + this.content_type + "\"," +
				"\"body\":\"" + this.body + "\"," +						// output
				"\"date\":\"" + this.date + "\"" +						//parse DateTime to ISO8601 Compliant format		
				"}");

	    return result.replaceAll("\\", "");
	  }*/
}

