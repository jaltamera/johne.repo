package model.com;

public class RequestObject {

	private String input;
	private String phone;
	
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
	
}
