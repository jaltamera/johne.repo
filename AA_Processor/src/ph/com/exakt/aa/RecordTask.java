package ph.com.exakt.aa;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.TimerTask;

public class RecordTask extends TimerTask {

	private static WorkQueue workQueue;

	static{
		workQueue = WorkQueueSingleton.getSingletonObject();
	}

	@Override
	public void run() {

		String query = "SELECT * from tbl_inbound where flag = 0";

		Connection con1 = null;
		Statement stm1 = null;
		ResultSet rs1 = null;

		try {
			con1 = this.getConnection();
			stm1 = con1.createStatement();
			rs1 = stm1.executeQuery(query);

			while(rs1.next()){

				final String input = rs1.getString("input");
				final String phone = rs1.getString("number");
				final int ID = rs1.getInt("ID");

				workQueue.execute(new Runnable(){
					public void run(){

						String result = "";

						try {
							HttpURLConnection connection = null;
							connection = (HttpURLConnection)new URL("http://localhost/traffic/interface/smsSimulator.jsp").openConnection();
							connection.setDoOutput(true);
							connection.setDoInput(true);

							connection.connect();

							DataOutputStream dos = new DataOutputStream(connection.getOutputStream ());
							dos.writeBytes("phone=" + phone + "&input=" + input);

							BufferedReader reader = new BufferedReader(new InputStreamReader(new DataInputStream(connection.getInputStream())));
							StringBuilder strBuilder = new StringBuilder();
							String line = null;

							while ((line = reader.readLine()) != null) {
								strBuilder.append(line);
							}

							result = strBuilder.toString();

							dos.flush();
							dos.close();
							reader.close();
							connection.disconnect();

						} catch (IOException e) { 
							System.out.println("RecordTask error # 3: " + e);
							result = "";
						}

						if(!result.equals("")){

							Connection con2 = null;
							Statement stm2 = null;

							String query = "UPDATE tbl_inbound SET flag = 1 where ID = " + ID;

							try {

								con2 = this.getConnection();
								stm2 = con2.createStatement();
								System.out.println(stm2.executeUpdate(query));

							} catch (SQLException e) {
								System.out.println("RecordTask error # 2: " + e);
							} finally{
								try{
									stm2.close();
									con2.close();
								}catch(Exception e){
								}
							}
						}
					}

					private Connection getConnection() 
							throws SQLException{
						return DriverManager.getConnection(
								"jdbc:jdc:jdcpool");
					}
				});
			}

		} catch (SQLException e1) {
			System.out.println("RecordTask error # 1: " + e1);
		} finally{
			try{
				rs1.close();
				stm1.close();
				con1.close();
			}catch(Exception e){
			}
		}
	}

	private Connection getConnection() 
			throws SQLException{
		return DriverManager.getConnection(
				"jdbc:jdc:jdcpool");
	}
}
