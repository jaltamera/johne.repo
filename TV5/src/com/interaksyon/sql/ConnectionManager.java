package com.interaksyon.sql;

import java.sql.Connection;
import java.sql.DriverManager;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

public class ConnectionManager {

	private Connection con;
	
	private static Logger logger = LogManager.getLogger(ConnectionManager.class);

	private static ConnectionManager comMgr = null;
	
	private ConnectionManager(){

		try{

			Class.forName("sybase.jdbc.sqlanywhere.IDriver").newInstance();     

			con = DriverManager.getConnection("jdbc:sqlanywhere:uid=DBA;pwd=sql;eng=mmda");
            

		}catch(Exception e){
	
			logger.error("Error loading jdbc driver: " + e);

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