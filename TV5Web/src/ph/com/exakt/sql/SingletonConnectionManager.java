package ph.com.exakt.sql;

import java.sql.Connection;
import java.sql.DriverManager;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

public class SingletonConnectionManager {
	Connection con;

	private static Logger logger = LogManager.getLogger(SingletonConnectionManager.class);

	private static SingletonConnectionManager comMgr = null;

	private SingletonConnectionManager(){

		try{

			Class.forName("sybase.jdbc.sqlanywhere.IDriver").newInstance();     

			con = DriverManager.getConnection("jdbc:sqlanywhere:uid=DBA;pwd=sql;eng=mmda");


		}catch(Exception e){

			logger.error("Error loading jdbc driver: " + e);

		}

	}

	public static synchronized SingletonConnectionManager getConnectionMgrInstance()

	{

		if (comMgr == null)

			comMgr = new SingletonConnectionManager();

		return comMgr;

	}

	public Connection getConnection(){

		return con;

	}

	public Object clone() throws CloneNotSupportedException {
		throw new CloneNotSupportedException();
	}
}
