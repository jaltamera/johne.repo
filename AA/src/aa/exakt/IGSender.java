package aa.exakt;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Calendar;
import java.util.Date;

import org.apache.http.impl.cookie.DateUtils;

import com.google.gson.stream.JsonWriter;

public class IGSender {

	public void send(RequestObject r, String result)throws Exception{

		Date current = Calendar.getInstance().getTime();

		Object[] objectArray = null;

		try{
			AuthProcessor auth = new AuthProcessor(r, result, current);
			objectArray = auth.sign();
		}catch(Exception e){
			System.out.println("Error in signing : IGSender");
		}

		HttpURLConnection connection = null;
		

		URL serverAddress = null;

		serverAddress = new URL("http://api.ame22.wyrls.net/messages");
		//set up out communications stuff
		connection = null;

		//Set up the initial connection
		connection = (HttpURLConnection)serverAddress.openConnection();
		connection.setRequestMethod("POST");
		connection.setDoOutput(true);
		connection.setDoInput(true);
		//connection.setReadTimeout(10000);

		connection.setRequestProperty("Content-Type", AuthProcessor.CONTENT_TYPE);
		connection.setRequestProperty("Host", "ismsteam.com");
		connection.setRequestProperty("Authorization","MCWS u/4/exakt1:" + objectArray[0]); // CHANGE THE ID
		connection.setRequestProperty("Date", DateUtils.formatDate(DateUtils.parseDate(DateUtils.formatDate(Calendar.getInstance().getTime()))));
		connection.setRequestProperty("Method", "POST");
		//connection.setRequestProperty("User-Agent","Mozilla/5.0 ( compatible ) ");
		//connection.setRequestProperty("Accept","*/*");
		connection.setFixedLengthStreamingMode((Integer)objectArray[2]);
		
		connection.connect();

		JSONModel newJsonModel = (JSONModel)objectArray[1];

		OutputStreamWriter writer = new OutputStreamWriter(connection.getOutputStream());
		//writer.println(...);

		JsonWriter jw;

		try {
			jw = new JsonWriter(writer);

			jw.beginObject(); // {
			jw.name(JSONModel._FROM).value(newJsonModel.getFrom()); 
			jw.name(JSONModel._TO).value(newJsonModel.getTo());
			jw.name(JSONModel._CONTENT_TYPE).value(newJsonModel.getContentType()); 
			jw.name(JSONModel._BODY).value(newJsonModel.getBody()); 
			jw.name(JSONModel._DATE).value(newJsonModel.getDate());
			jw.name(JSONModel._USAGE_TYPE).value(newJsonModel.getUsage_type());

			jw.endObject(); // }
			jw.close();
			writer.close();
			
			System.out.println("Done ");

		} catch (IOException e) {
			System.out.println(e + ": Error in JsonWriter");
		}
		
		//System.out.println(connection.getResponseCode());
		
		try{
			String strServerResponse = "";

			BufferedReader inStream = null;
			inStream = new BufferedReader(new InputStreamReader(connection.getInputStream()));

			System.out.println("Server says: ");
			while ((strServerResponse = inStream.readLine()) != null)
			{
				System.out.println(strServerResponse);
			} // end while

			inStream.close(); 
		}catch(Exception e){
			
			/*String strServerResponse = "";
			
			BufferedReader inStream = null;
			inStream = new BufferedReader(new InputStreamReader(connection.getErrorStream()));

			System.out.println("Server says: ");
			while ((strServerResponse = inStream.readLine()) != null)
			{
				System.out.println(strServerResponse);
			} // end while

			inStream.close(); */
			
			e.printStackTrace();
		}

		//close the connection, set all objects to null
		connection.disconnect();
		connection = null;


	}
}
