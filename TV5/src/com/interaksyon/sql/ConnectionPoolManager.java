package com.interaksyon.sql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*
 * @author : Johne Altamera
 */

public class ConnectionPoolManager {
	
	//Static class instantiation
	static {
		try{
			new JDCConnectionDriver("sybase.jdbc.sqlanywhere.IDriver","jdbc:sqlanywhere:uid=DBA;pwd=sql;eng=mmda");
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
