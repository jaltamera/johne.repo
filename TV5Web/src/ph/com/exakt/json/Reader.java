package ph.com.exakt.json;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.google.gson.stream.JsonReader;

public class Reader {
	
	private BufferedReader br;
	
	private static Logger logger = LogManager.getLogger(Reader.class);
	
	public Reader(BufferedReader br){
		this.br = br;
	}
	
	public JSONModel parse(){
		
		JSONModel newJsonModel = new JSONModel();	
		
		try {
			JsonReader reader = new JsonReader(br);
			reader.setLenient(Boolean.TRUE);
			reader.beginObject();
			
			//StringBuffer sb = new StringBuffer();
			
			while (reader.hasNext()) {
				
			  String attribute = reader.nextName();
			  
			  //sb.append(reader.nextName() + " " + reader.nextString());
			  
			  if (attribute.equals(JSONModel._FROM)) {
				
				newJsonModel.setFrom(reader.nextString());
		 
			  } else if (attribute.equals(JSONModel._TO)) {
				  	
				newJsonModel.setTo(reader.nextString());

			  } else if (attribute.equals(JSONModel._CONTENT_TYPE)) {
		 
				newJsonModel.setContentType(reader.nextString());
		 
			  }else if (attribute.equals(JSONModel._BODY)) {
		 
				newJsonModel.setBody(reader.nextString());
		 
			  }else if (attribute.equals(JSONModel._DATE)) {
		 
				newJsonModel.setDate(reader.nextString());
		 
			  }else if (attribute.equals(JSONModel._ID)) {
					 
					newJsonModel.setId(reader.nextString());
			 
			  }else if (attribute.equals(JSONModel._DELIVERY_RECEIPT_URL)) {
					 
					newJsonModel.setDeliveryReceiptUrl(reader.nextString());
			 
			  }else if (attribute.equals(JSONModel._TELCO)) {
					 
					newJsonModel.setTelco(reader.nextString());
			 
			  }else if (attribute.equals(JSONModel._THREAD)) {
					 
					newJsonModel.setThread(reader.nextString());
			 
			  }else if (attribute.equals(JSONModel._USAGE_TYPE)) {
					 
					newJsonModel.setUsageType(reader.nextString());
			 
			  }else {
				reader.skipValue(); //avoid some unhandle events
			  }
			}
						
			reader.endObject();
			reader.close();

		 } catch (FileNotFoundException e) {
			 logger.error(e);
			e.printStackTrace();
		 } catch (IOException e) {
			 logger.error(e);
			e.printStackTrace();
		 }
		
		 return newJsonModel;
	}
	
}
