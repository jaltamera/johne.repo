package aa.exakt.io;

import aa.exakt.RequestObject;

public class SampleSender {
	
	
	public static void main(String args[])throws Exception{
		new IGSender().send(new RequestObject("asdas", "123", 5123), "sample!!");
	}
}
