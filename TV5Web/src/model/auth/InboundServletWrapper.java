package model.auth;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class InboundServletWrapper extends HttpServletRequestWrapper {

	private final String body;

	public InboundServletWrapper(HttpServletRequest request) throws IOException {
		
		super(request);
		
		StringBuilder stringBuilder = new StringBuilder();
		BufferedReader bufferedReader = null;
		
		try {
			InputStream inputStream = request.getInputStream();
			if (inputStream != null) {
				bufferedReader = new BufferedReader(new InputStreamReader(inputStream, request.getCharacterEncoding()));
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
	
    @Override
    public String getParameter(String paramName)
    {            
        return super.getParameter(paramName);
    }

    @Override
    public String[] getParameterValues(String paramName)
    {           
        return super.getParameterValues(paramName);
    }

    @Override
    public Map getParameterMap()
    {
        Map<Object, Object> parameterMap=new HashMap<Object, Object>();
        Map originalParameterMap=super.getParameterMap();

        for(Object o:originalParameterMap.entrySet())
        {
            Map.Entry<Object, Object>pairs=(Entry<Object, Object>) o;
            parameterMap.put(pairs.getKey(), pairs.getValue());
        }
        return parameterMap;  //Returning a modifiable ParameterMap.
    }
    
    @Override
    public String getMethod(){
    	return super.getMethod();
    }
    
    @Override
    public String getRequestURI(){
    	return super.getRequestURI();
    }
    
    public String getDate(){
    	return super.getHeader("Date");
    }
    
    @Override
    public String getContentType(){
    	return super.getContentType();
    }
    
    @Override
    public int getContentLength(){
    	return super.getContentLength();
    }
}
