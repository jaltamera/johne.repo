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
	private String thread;
	private int ID;
	
	public RequestObject(String input, String phone, int id, String thread){
		this.input = input;
		this.phone = phone;
		this.ID = id;
		this.thread = thread;
	}
	
	public RequestObject(String input, String phone, int id){
		this.input = input;
		this.phone = phone;
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

	public String getThread() {
		return thread;
	}

	public void setThread(String thread) {
		this.thread = thread;
	}
	
}
