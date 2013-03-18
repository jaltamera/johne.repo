package ph.com.exakt.model;

import java.io.Serializable;

public class RequestObject implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7795166185467119980L;

	public RequestObject(String input, String phone, String thread, String date, String telco) {
		super();
		this.input = input;
		this.phone = phone;
		this.thread = thread;
		this.date = date;
		this.telco = telco;
	}

	private String input;
	private String phone;
	private String thread;
	private String date;
	private String telco;
	
	public RequestObject(String arg0, String arg1){
		this.input = arg0;
		this.phone = arg1;
	}

	public String getInput() {
		return input;
	}

	public void setInput(String input) {
		this.input = input;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@Override
	public String toString(){
		return "[" + input + "," + phone + "]";
	}

	public String getThread() {
		return thread;
	}

	public void setThread(String thread) {
		this.thread = thread;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTelco() {
		return telco;
	}

	public void setTelco(String telco) {
		this.telco = telco;
	}
	
}
