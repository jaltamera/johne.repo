package ph.com.exakt.aa.bom;

/*
 * @author : Johne Altamear
 */

/*
 * the RequestObject Bean
 */

public class RequestObject {

	private String input;
	private String phone;
	private int ID;
	
	public RequestObject(String arg0, String arg1, int id){
		this.input = arg0;
		this.phone = arg1;
		this.ID = id;
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
	
	public int getID() {
		return ID;
	}

	public void setID(int id) {
		this.ID = id;
	}
	
}
