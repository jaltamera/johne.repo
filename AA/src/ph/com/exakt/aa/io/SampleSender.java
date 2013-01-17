package ph.com.exakt.aa.io;

import ph.com.exakt.aa.bom.RequestObject;

public class SampleSender {
	
	
	public static void main(String args[])throws Exception{
		new IGSender().send(new RequestObject("asdas", "123", 5123), "sample!!");
	}
}
