package model.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import model.auth.InboundServletWrapper;

public class ServletFilter implements Filter{

	private FilterConfig filterConfig = null;
	String encoding = "UTF-8";
	
	@Override
	public void init(FilterConfig filterConfig) 
			throws ServletException {
		this.filterConfig = filterConfig;
	}

	@Override
	public void destroy() {
		this.filterConfig = null;
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		if (filterConfig == null)
			return;

		String encoding = selectEncoding(request);
		if (encoding != null)
			request.setCharacterEncoding(encoding);

		Throwable problem = null;

		InboundServletWrapper myRequestWrapper = new InboundServletWrapper((HttpServletRequest) request);

		String body = myRequestWrapper.getBody();
		String clientIP = myRequestWrapper.getRemoteHost();
		int clientPort = request.getRemotePort();
		String uri = myRequestWrapper.getRequestURI();

		/*System.out.println(body);
		System.out.println(clientIP);
		System.out.println(clientPort);
		System.out.println(uri);*/

		chain.doFilter(myRequestWrapper, response);
	}

	protected String selectEncoding(ServletRequest request) {
		return (this.encoding);
	}

}
