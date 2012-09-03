

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionManager {

	Connection con;

	private static ConnectionManager comMgr = null;

	private ConnectionManager(){

		try{

			Class.forName("sybase.jdbc.sqlanywhere.IDriver").newInstance();     

			con = DriverManager.getConnection("jdbc:sqlanywhere:uid=DBA;pwd=sql;DSN=mmda");
            

		}catch(Exception e){
	
			e.printStackTrace();

		}

	}

	public static synchronized ConnectionManager getConnectionMgrInstance()

	{

		if (comMgr == null)

			comMgr = new ConnectionManager();

		return comMgr;

	}

	public Connection getConnection(){

		return con;

	}
}