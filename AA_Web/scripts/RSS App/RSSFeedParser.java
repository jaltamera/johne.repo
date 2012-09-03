
import java.io.ByteArrayInputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;

import javax.xml.stream.XMLEventReader;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.events.XMLEvent;

import java.sql.Connection;
import java.sql.CallableStatement;

import java.util.Calendar;

public class RSSFeedParser {
	static final String TITLE = "title";
	static final String DESCRIPTION = "description";
	static final String CHANNEL = "channel";
	static final String LANGUAGE = "language";
	static final String COPYRIGHT = "copyright";
	static final String LINK = "link";
	static final String AUTHOR = "author";
	static final String ITEM = "item";
	static final String PUB_DATE = "pubDate";
	static final String GUID = "guid";
	
	private ConnectionManager conMgr;
	private Connection con;
	private CallableStatement cs;

	private String query = "";

	URL url = null;

	public RSSFeedParser(String feedUrl) {
		try {
			this.url = new URL(feedUrl);
			ConnectionManager conMgr = ConnectionManager.getConnectionMgrInstance();
			con = conMgr.getConnection();
			System.out.println("Connected...");
		} catch (MalformedURLException e) {
			throw new RuntimeException(e);
		} catch(Exception e){
			System.out.println("Could not connect to DB \n" + e.getMessage());
		}
	}

	@SuppressWarnings("null")
	public Feed readFeed() {
		Feed feed = null;
		boolean checker = false;
		int ctr = 0;
		try {

			boolean isFeedHeader = true;
			// Set header values intial to the empty string
			String description = "";
			String title = "";
			String link = "";
			String language = "";
			String copyright = "";
			String author = "";
			String pubdate = "";
			String guid = "0";
			
			String main_road = "";
			String exit_road = "";
			String bound = "";
			//String flow = "";
			//String guid = "";
			//String pubdate = "";
			

			//First create a new XMLInputFactory
			//XMLInputFactory inputFactory = XMLInputFactory.newInstance();
			// Setup a new eventReader
			//InputStream in = read();
			//XMLEventReader eventReader = inputFactory.createXMLEventReader(in);
			// Read the XML document
	
			XMLInputFactory inputFactory = null;
			XMLEventReader eventReader = null;
			
			try{
			
			InputStream in = read();
			BufferedReader br = new BufferedReader(new InputStreamReader(in));
			
			StringBuffer xml = new StringBuffer();
			String xmlContent = "";
			
			while((xmlContent = br.readLine()) != null ){
				xml.append(xmlContent);
			}
				
			    byte[] byteArray = xml.toString().replaceAll("&#241;", "N").replaceAll("&#39;","''").getBytes("ASCII");
				//
								
				ByteArrayInputStream inputStream = new ByteArrayInputStream(byteArray);
			    inputFactory = XMLInputFactory.newInstance();
			    eventReader = inputFactory.createXMLEventReader(inputStream, "ASCII");
			    
			    inputStream.close();
			    br.close();
			    in.close();			    
			    
			}catch(Exception e){
				e.printStackTrace();
			}
			
			
			while (eventReader.hasNext()) {
				
				XMLEvent event = eventReader.nextEvent();

				if (event.isStartElement()) {
					if (event.asStartElement().getName().getLocalPart() == (ITEM)) {
						if (isFeedHeader) {
							isFeedHeader = false;
							feed = new Feed(title, link, description, language,
									copyright, pubdate);
						}
						event = eventReader.nextEvent();
						continue;
					}

					if (event.asStartElement().getName().getLocalPart() == (TITLE)) {
						event = eventReader.nextEvent();
						title = event.asCharacters().getData();
						String title_[] = title.split("-");
						
//						if(title_.length == 3){
//							checker = true;
//							main_road = title_[0];
//							exit_road = title_[1];
//							bound = title_[2];
//						}else
//							checker = false;
						
						if(title_.length < 3){
							checker = false;
						}
						else if(title_.length >= 3){
							checker = true;
							exit_road = "";
							main_road = title_[0].replaceAll("[^0-9a-zA-Z]+", " ").trim();
							
							for(int x = 1 ; x < title_.length - 1; x++){
								exit_road += title_[x].replaceAll("[^0-9a-zA-Z]+", " ").trim();
								
								if(x == title_.length - 2)break;
								exit_road += " ";
							}
													
							bound = title_[title_.length-1];
						}
			
						continue;
					}
					if (event.asStartElement().getName().getLocalPart() == (DESCRIPTION)) {
						event = eventReader.nextEvent();
						try{
							description = event.asCharacters().getData();
						}catch(Exception e){
							description = "null";
						}
						
						//System.out.println(description);
						continue;
					}	
					if (event.asStartElement().getName().getLocalPart() == (LINK)) {
						event = eventReader.nextEvent();
						try{
							link = event.asCharacters().getData();
						}catch(Exception e){
							link = "null";
						}
						
						//System.out.println(link);
						continue;
					}
						
					if (event.asStartElement().getName().getLocalPart() == (GUID)) {
						event = eventReader.nextEvent();
						try{
							guid = event.asCharacters().getData();
						}catch(Exception e){
							guid = "null";
						}
						//System.out.println(guid);
						continue;
					}
					if (event.asStartElement().getName().getLocalPart() == (LANGUAGE)) {
						event = eventReader.nextEvent();
						try{
							language = event.asCharacters().getData();
						}catch(Exception e){
							language = "null";
						}
						//System.out.println(language);
						continue;
					}
					if (event.asStartElement().getName().getLocalPart() == (AUTHOR)) {
						event = eventReader.nextEvent();
						try{
							author = event.asCharacters().getData();
						}catch(Exception e){
							author = "null";
						}
						//System.out.println(author);
						continue;
					}
					if (event.asStartElement().getName().getLocalPart() == (PUB_DATE)) {
						event = eventReader.nextEvent();
						try{
							pubdate = event.asCharacters().getData();
						}catch(Exception e){
							pubdate = "null";
						}
						//System.out.println(pubdate);
						continue;
					}
					if (event.asStartElement().getName().getLocalPart() == (COPYRIGHT)) {
						event = eventReader.nextEvent();
						try{
							copyright = event.asCharacters().getData();
						}catch(Exception e){
							copyright = "null";
						}
						//System.out.println(copyright);
						continue;
					}
				} else if (event.isEndElement()) {
					if (event.asEndElement().getName().getLocalPart() == (ITEM)) {
						FeedMessage message = new FeedMessage();
						message.setAuthor(author);
						message.setDescription(description);
						message.setGuid(guid);
						message.setLink(link);
						message.setTitle(title);
						message.setPubDate(pubdate);
						feed.getMessages().add(message);
						event = eventReader.nextEvent();
						continue;
					}
				}
				
				/*  insert to db*/
				

				
				if(checker){
					ctr++;					
					cs = con.prepareCall("call proc_updateTable(?,?,?,?,?,?)");
					cs.setString(1, main_road);
					cs.setString(2, exit_road);
					cs.setString(3, bound);
					cs.setString(4, pubdate);
					cs.setString(5, description);
					cs.setInt(6, Integer.parseInt(guid));
					cs.execute();
					cs.close();
				}	
			}
			
			System.out.println(ctr + " lines checked\n" + "Done updating the table..." + Calendar.getInstance().getTime());
		
			
		} catch (XMLStreamException e) {
			throw new RuntimeException(e);
		} catch (Exception e){
			//System.out.println(e);
			e.printStackTrace();
		}

		return feed;

	}

	private InputStream read() {
		try {
			return url.openStream();
		} catch (IOException e) {
			System.out.println("Unable to connect to server...");
			throw new RuntimeException(e);
		}
	}
}