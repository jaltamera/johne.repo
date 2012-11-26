package ph.com.exakt.auth;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.http.HttpServletRequest;

public class HttpRequestObject {
	
	private String method;
	private String requestURI;
	private String date;
	private String contentType;
	private String requestBody;
	
	private int contentLength;
	private BufferedReader br;
	
	public HttpRequestObject(){}
	
	public HttpRequestObject(HttpServletRequest request) throws IOException{
		
		this.br = new BufferedReader(new InputStreamReader(request.getInputStream()));
		
		this.method = request.getMethod();
		this.requestURI = request.getRequestURI();
		this.date = request.getHeader("Date");
		this.contentType = request.getContentType();
		this.contentLength = request.getContentLength();
	}
	
	public HttpRequestObject(String method, String requestURI, String date,
			String contentType, String requestBody, int contentLength) {
		super();
		this.method = method;
		this.requestURI = requestURI;
		this.date = date;
		this.contentType = contentType;
		this.contentLength = contentLength;
		this.requestBody = requestBody;
	}


	public String getMethod() {
		return method;
	}


	public void setMethod(String method) {
		this.method = method;
	}


	public String getRequestURI() {
		return requestURI;
	}


	public void setRequestURI(String requestURI) {
		this.requestURI = requestURI;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	public String getContentType() {
		return contentType;
	}


	public void setContentType(String contentType) {
		this.contentType = contentType;
	}


	public int getContentLength() {
		return contentLength;
	}


	public void setContentLength(int contentLength) {
		this.contentLength = contentLength;
	}
	
	public BufferedReader getBufferedReader() throws IOException{
		
		return this.br;
	}
		
	public void setRequestBody(String requestBody){
		this.requestBody = requestBody;
	}
	
	public String getRequestBody() throws IOException{
		
		StringBuilder stringBuilder = new StringBuilder();
		//BufferedReader bufferedReader = null;
		
		try {
			if (br != null) {
				
				char[] charBuffer = new char[128];
				int bytesRead = -1;
				while ((bytesRead = br.read(charBuffer)) > 0) {
					stringBuilder.append(charBuffer, 0, bytesRead);
				}
			} else {
				stringBuilder.append("");
			}
		} catch (IOException ex) {
			throw ex;
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException ex) {
					throw ex;
				}
			}
		}

		this.requestBody = stringBuilder.toString();
		return requestBody;
	}
	
	
}
