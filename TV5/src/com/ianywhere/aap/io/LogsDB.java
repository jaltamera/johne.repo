package com.ianywhere.aap.io;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.dejima.utils.log.LogManager;
import com.interaksyon.formatter.SMSFormatter;

@Deprecated
public class LogsDB
{

    Connection con;
    Statement stm;
    protected static final LogManager logger = new LogManager(
			SMSFormatter.class);

    public LogsDB(){
      
    }

    public void insert(String trans_type, String trans_input, Date trans_date, String trans_flag){
       
    	try{
                DateFormat dfm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 
                int flag = 0;
                // this is the date and time
                //String command = iA.getMainCommand().getTag();      // this is the transaction type
                //String msg = (String)iA.getInputString();                   // this is the input string
                //Change [COLUMNS] and [VALUES]
                String query = "INSERT INTO tbl_stat(trans_type, trans_date, trans_flag, trans_input) VALUES('" + trans_type + "', '"+dfm.format(trans_date)+"', '"+trans_flag+"', '"+trans_input+"')";
                con = getConnection();
                stm = con.createStatement();
                flag = stm.executeUpdate(query);
                logger.info(query);
                con.close();
              
                logger.info("flag = " + flag + "\ntrans_type = " + trans_type + "\ntrans_date = " + trans_date + "\ntrans_flag = " + trans_flag + "\ntrans_input = " + trans_input  );
        }catch(Exception e){
                logger.info("connection failed insert method: " + e.toString());
            
        }
      
    }

    public Connection getConnection(){
        //ODBC Connection
    	try{
        Driver d = (Driver)Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();    // insert the driver name
        con = DriverManager.getConnection("jdbc:sqlserver://172.16.100.14:1433;databaseName=SMSDB;user=sybase;password=sybase123");           // insert the connection string
        
    	}catch(Exception e){
        	logger.info("get connection to failed : "+e.toString());
        }
    	return con;
    }

}



