package aa.exakt;

public class SampleSender {
	
	
	public static void main(String args[])throws Exception{
		new IGSender().send(new RequestObject("asdas", "123", 5123), "sample!!");
	}
}
