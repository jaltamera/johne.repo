package ph.com.exakt.servlet;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ph.com.exakt.auth.AuthProcessor;
import ph.com.exakt.json.JSONModel;
import ph.com.exakt.json.Reader;
import ph.com.exakt.sql.JDCConnectionDriver;

import com.google.gson.Gson;

/**
 * Servlet implementation class InboundServlet
 */
public class InboundServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 * Initialize the Connection Driver
	 */
	static {
		try{
			new JDCConnectionDriver(
					"sybase.jdbc.sqlanywhere.IDriver", 
					"jdbc:sqlanywhere:eng=mmda",
					"dba", "sql");
		}catch(Exception e){
			System.out.println("InboundServlet error # 5: " + e);
		}
	}


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

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException{

		/*
		 * Wrap the InputStream so we can read it more than once
		 */
		
		Reader reader = null;

		try {
			reader = new Reader(request.getInputStream());
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
			stringToSign = AuthProcessor.getStringToSign(request);
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

		System.out.println("JSON Received: " + json);
		System.out.println("StringToSign: " + stringToSign);
		System.out.println("Signature: " + signature);

		/*
		 * Verify the request
		 */
		boolean valid = false;

		try {
			valid = AuthProcessor.verify(signature, stringToSign);
		} catch (Exception e) {
			System.out.println("InboundServlet error # 4: " + e);
			e.printStackTrace();
		}

		System.out.println("Verification: " + valid + "\n\n");
		
		Connection con = null;
		PreparedStatement pstm = null;
		
		if(valid){
			try {
				
				final String query = "INSERT INTO tbl_inbound(input, number, received_date, flag) VALUES(?,?,?,?)";
				
				con = this.getConnection();
				pstm = con.prepareStatement(query);
				pstm.setString(1, jsonModel.getBody());
				pstm.setString(2, jsonModel.getFrom());
				pstm.setString(3, jsonModel.getDate());
				pstm.setInt(4, 0);
				
			} catch (SQLException e) {
				System.out.println("InboundServlet error # 6: " + e);
			} finally {
				try{
					pstm.close();
					con.close();
				}catch(Exception e){
					System.out.println("InboundServlet error # 7: " + e);
				}
			}
		}

	}

	private Connection getConnection() 
			throws SQLException{
		return DriverManager.getConnection(
				"jdbc:jdc:jdcpool");
	}

}
