package ph.com.exakt.aa;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.TimerTask;

import ph.com.exakt.sql.JDCConnectionDriver;

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
						
						try {
							HttpURLConnection connection = null;
							connection = (HttpURLConnection)new URL("http://localhost/traffic/interface/smsSimulator.jsp").openConnection();
							connection.setDoOutput(true);
							connection.setDoInput(true);

							connection.connect();
							
							DataOutputStream dos = new DataOutputStream(connection.getOutputStream ());
							dos.writeBytes("phone=" + phone + "&input=" + input);
							
							DataInputStream dis = new DataInputStream(connection.getInputStream());
							
							StringBuffer strBuff = new StringBuffer();
							
							try{
								while(true){
									strBuff.append(dis.readChar());
								}
							}catch(Exception e){
								System.out.println("RecordTask error # 2: " + e);
							}
							
							dis.close();
							dos.flush();
							dos.close();
							connection.disconnect();
							
						} catch (IOException e) {
							System.out.println("RecordTask error # 3: " + e);
						}
						
						//TODO update connection
						/*Connection con = null;
						Statement stm = null;
						ResultSet rs = null;
						
						try {
							
							con = this.getConnection();
							stm = con.createStatement();
							rs = stm.executeQuery(query);
							
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}*/
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
