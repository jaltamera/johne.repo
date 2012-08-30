package ph.com.exakt.servlet;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletInputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

/*
 * @author Johne
 * 
 */

public class InboundServletRequestWrapper extends HttpServletRequestWrapper {

	private final String body;

	public InboundServletRequestWrapper(HttpServletRequest request) throws IOException {
		super(request);
		StringBuilder stringBuilder = new StringBuilder();
		BufferedReader bufferedReader = null;
		try {
			InputStream inputStream = request.getInputStream();
			if (inputStream != null) {
				bufferedReader = new BufferedReader(new InputStreamReader(inputStream/*, request.getCharacterEncoding()*/));
				char[] charBuffer = new char[128];
				int bytesRead = -1;
				while ((bytesRead = bufferedReader.read(charBuffer)) > 0) {
					stringBuilder.append(charBuffer, 0, bytesRead);
				}
			} else {
				stringBuilder.append("");
			}
		} catch (IOException ex) {
			throw ex;
		} finally {
			if (bufferedReader != null) {
				try {
					bufferedReader.close();
				} catch (IOException ex) {
					throw ex;
				}
			}
		}
		body = stringBuilder.toString();
	}

	@Override
	public ServletInputStream getInputStream() throws IOException {
		final ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(body.getBytes());
		ServletInputStream servletInputStream = new ServletInputStream() {
			public int read() throws IOException {
				return byteArrayInputStream.read();
			}
		};
		return servletInputStream;
	}

	@Override
	public BufferedReader getReader() throws IOException {
		return new BufferedReader(new InputStreamReader(this.getInputStream()));
	}

	public String getBody() {
		return this.body;
	}

	public String getHeader(String name) {
		//get the request object and cast it
		HttpServletRequest request = (HttpServletRequest)getRequest();

		return request.getHeader(name);
	}

	public Enumeration getHeaderNames() {
		//create an enumeration of the request headers
		//additionally, add the "username" request header

		//create a list
		List list = new ArrayList();

		//loop over request headers from wrapped request object
		HttpServletRequest request = (HttpServletRequest)getRequest();
		Enumeration e = request.getHeaderNames();
		while(e.hasMoreElements()) {
			//add the names of the request headers into the list
			String n = (String)e.nextElement();
			list.add(n);
		}

		//create an enumeration from the list and return
		Enumeration en = Collections.enumeration(list);
		return en;
	}


}