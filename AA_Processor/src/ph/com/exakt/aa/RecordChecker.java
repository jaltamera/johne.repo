package ph.com.exakt.aa;

import java.util.Timer;

import ph.com.exakt.sql.JDCConnectionDriver;

public class RecordChecker {
	
	static{
		
		try{
			new JDCConnectionDriver(
					"sybase.jdbc.sqlanywhere.IDriver", 
					"jdbc:sqlanywhere:eng=mmda",
					"dba", "sql");
		}catch(Exception e){
			System.out.println("InboundServlet error # 5: " + e);
		}
	}
	
	public static void main(String args[]){
		Timer timer = new Timer();
		timer.scheduleAtFixedRate(new RecordTask(), 0, 1000);
	}
}
