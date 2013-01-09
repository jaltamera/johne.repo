package ph.com.exakt.aa.bom;

/*
 * @author : Johne Altamera 
 */

/*
 * the JSONModel Bean 
 */

public class JSONModel {

	public JSONModel(String from, String to, String contentType, String body,
			String date, String usageType, String thread) {
		super();
		this.from = from;
		this.to = to;
		this.content_type = contentType;
		this.body = body;
		this.date = date;
		this.usagetype = usageType;
		this.thread = thread;
	}

	public static final String _FROM = "from";
	public static final String _TO = "to";
	public static final String _CONTENT_TYPE = "content_type";
	public static final String _BODY = "body";
	public static final String _DATE = "date";
	public static final String _USAGE_TYPE = "usagetype";
	
	private String from;
	private String to;
	private String content_type;
	private String body;
	private String date;
	private String usagetype;

	// additional Document fields
	
	public static final String _ID = "id";
	public static final String _DELIVERY_RECEIPT_URL = "delivery_receipt_url";
	public static final String _THREAD = "thread";
	public static final String _TELCO = "telco";
	
	private String id;
	private String deliveryReceiptUrl;
	private String thread;
	private String telco;
	
	public JSONModel(){
		this.from = "";
		this.to = "";
		this.content_type = "";
		this.body = "";
		this.date = "";
		this.usagetype = "";
	}
	
	public JSONModel(String from,
			String to,
			String contentType,
			String body,
			String date){

		this.from = from;
		this.to = to;
		this.content_type = contentType;
		this.body = body;
		this.date = date;
	}
	
	public JSONModel(String from,
					 String to,
					 String contentType,
					 String body,
					 String date,
					 String usageType){

		this.from = from;
		this.to = to;
		this.content_type = contentType;
		this.body = body;
		this.date = date;
		this.usagetype = usageType;
	}
	
	public void setFrom(String from){
		this.from = from;
	}

	public void setTo(String to){
		this.to = to;
	}

	public void setContentType(String contentType){
		this.content_type = contentType;
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

	public String getUsageType() {
		return usagetype;
	}

	public void setUsageType(String usageType) {
		this.usagetype = usageType;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDeliveryReceiptUrl() {
		return deliveryReceiptUrl;
	}

	public void setDeliveryReceiptUrl(String deliveryReceiptUrl) {
		this.deliveryReceiptUrl = deliveryReceiptUrl;
	}

	public String getThread() {
		return thread;
	}

	public void setThread(String thread) {
		this.thread = thread;
	}

	public String getTelco() {
		return telco;
	}

	public void setTelco(String telco) {
		this.telco = telco;
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

