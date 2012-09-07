package aa.exakt;

import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.Hashtable;

public class AASender{

	private final RequestObject requestObject;
	
	public AASender(RequestObject requestObject){
		this.requestObject = requestObject;
	}

	public String getAAResult(){
		
		String result = "";
		
		try{
			URL url = new URL("http://localhost/traffic/interface/smsSimulator.jsp");

			URLConnection servletConnection = url.openConnection();

			// inform the connection that we will send output and accept input
			servletConnection.setDoInput(true);
			servletConnection.setDoOutput(true);

			// Don't use a cached version of URL connection.
			servletConnection.setUseCaches(false);
			servletConnection.setDefaultUseCaches(false);

			// Specify the content type that we will send binary data
			servletConnection.setRequestProperty("Content-Type", "application/x-java-serialized-object");

			// get input and output streams on servlet
			ObjectOutputStream os = new ObjectOutputStream(servletConnection.getOutputStream());

			// send your data to the servlet
			//String s = "Some object I am sending to the server";

			Hashtable ht = new Hashtable();
			ht.put("input", this.requestObject.getInput());
			ht.put("phone", this.requestObject.getPhone());

			os.writeObject(ht);
			os.flush();
			os.close();

			System.out.println("Message Sent!");

			ObjectInputStream is = new ObjectInputStream(servletConnection.getInputStream());

			Object o = is.readObject();
			is.close();

			result = (String) o;

		}catch(Exception e){
			System.out.println("Error connecting to smsSimulator_jsp_interface");
		}
		
		return result;

	}

}
