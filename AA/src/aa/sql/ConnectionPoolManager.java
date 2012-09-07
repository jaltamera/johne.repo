package aa.sql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionPoolManager {
	//Static class instantiation
	
	static {
		try{
			new aa.sql.JDCConnectionDriver("sybase.jdbc.sqlanywhere.IDriver","jdbc:sqlanywhere:uid=DBA;pwd=sql;eng=mmda");
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public static Connection getConnection() 
			throws SQLException{
		return DriverManager.getConnection(
				"jdbc:jdc:jdcpool");
	}
}
