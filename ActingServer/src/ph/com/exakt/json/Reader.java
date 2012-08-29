package ph.com.exakt.json;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;

import com.google.gson.stream.JsonReader;

public class Reader {
	
	private BufferedReader br;
	
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
			  
			  if (attribute.equals("from")) {
				
				newJsonModel.setFrom(reader.nextString());
		 
			  } else if (attribute.equals("to")) {
				  	
				newJsonModel.setTo(reader.nextString());

			  } else if (attribute.equals("content_type")) {
		 
				newJsonModel.setContentType(reader.nextString());
		 
			  }else if (attribute.equals("body")) {
		 
				newJsonModel.setBody(reader.nextString());
		 
			  }else if (attribute.equals("date")) {
		 
				newJsonModel.setDate(reader.nextString());
		 
			  } else {
				reader.skipValue(); //avoid some unhandle events
			  }
			}
						
			reader.endObject();
			reader.close();

		 } catch (FileNotFoundException e) {
			e.printStackTrace();
		 } catch (IOException e) {
			e.printStackTrace();
		 }
		
		 return newJsonModel;
	}
	
}
