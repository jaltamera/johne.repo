package ph.com.exakt.servlet;

import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ph.com.exakt.auth.AuthProcessor;
import ph.com.exakt.json.JSONModel;
import ph.com.exakt.json.Reader;

import com.google.gson.Gson;

/**
 * Servlet implementation class InboundServlet
 */
public class InboundServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InboundServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.processRequest(request, response);
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response){

		/*
		 * Wrap the InputStream so we can read it more than once
		 */
		InboundServletRequestWrapper isrw = null;
		Reader reader = null;

		try {
			isrw = new InboundServletRequestWrapper(request);
			reader = new Reader(isrw.getInputStream());
		} catch (IOException e) {
			System.out.println("InboundServlet error # 1: " + e);
		}

		/*
		 * Parse the inputstream to json
		 */
		Gson gson = new Gson();
		JSONModel jsonModel = reader.parse();
		String json = gson.toJson(jsonModel);

		String stringToSign = "";
		try {
			stringToSign = AuthProcessor.getStringToSign(isrw);
		} catch (NoSuchAlgorithmException e) {
			System.out.println("InboundServlet error # 2: " + e);
		} catch (ParseException e) {
			System.out.println("InboundServlet error # 3: " + e);
		}

		/*
		 * Read the AUTHORIZATION header
		 */
		String signature = "";

		String authHeader = request.getHeader("Authorization");
		if (authHeader != null) {
			java.util.StringTokenizer st = new java.util.StringTokenizer(authHeader);
			if (st.hasMoreTokens()) {
				String authType = st.nextToken();

				if (authType.equalsIgnoreCase("MCWS")) {

					String credentials = st.nextToken();

					int p = credentials.indexOf(":");
					if (p != -1) {
						signature = credentials.substring(p+1);
					}
				}
			}
		}

		/*
		 * Verify the request
		 */
		boolean valid = false;
		
		try {
			valid = AuthProcessor.verify(signature, stringToSign);
		} catch (Exception e) {
			System.out.println("InboundServlet error # 4: " + e);
		}
		
		if(valid){
			
		}
	}

}
