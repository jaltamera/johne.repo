package aa.exakt.io;

import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Calendar;
import java.util.Date;

import org.apache.http.impl.cookie.DateUtils;

import aa.exakt.AuthProcessor;
import aa.exakt.RequestObject;
import aa.exception.IGException;

/*
 * @author : Johne Altamera
 */

public class IGSender {

	public int send(RequestObject r, String result, LogPrinter printer)throws IGException, Exception{
		
			// this variable of type Date will be used as the Date header and JSON date param
			Date current = Calendar.getInstance().getTime();

			//consist of Base64-Signed String, JSON String and Content Length
			Object[] objectArray = null;

			try{
				AuthProcessor auth = new AuthProcessor(r, result.replaceAll("<br>", "\n"), current);
				objectArray = auth.sign();
			}catch(Exception e){
				printer.print("Error in signing : IGSender");
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

			connection.setRequestProperty("Content-Type", AuthProcessor.CONTENT_TYPE);
			connection.setRequestProperty("Host", "ismsteam.com");
			connection.setRequestProperty("Authorization","MCWS u/4/mmda2:" + objectArray[0]); // CHANGE THE ID
			connection.setRequestProperty("Date", DateUtils.formatDate(DateUtils.parseDate(DateUtils.formatDate(Calendar.getInstance().getTime()))));
			connection.setRequestProperty("Method", "POST");
			connection.setRequestProperty("Content-Length", ((Integer)objectArray[2]).toString());

			connection.connect();

			String json = (String)objectArray[1];

			OutputStreamWriter writer = new OutputStreamWriter(connection.getOutputStream());
			writer.write(json);
			writer.flush();
			writer.close();

			int responseCode = 0;

			responseCode = connection.getResponseCode();

			if(responseCode < 200 || responseCode > 299)
				throw new IGException(responseCode);
				
			//close the connection, set all objects to null
			connection.disconnect();
			connection = null;

			return responseCode;
	}
}
