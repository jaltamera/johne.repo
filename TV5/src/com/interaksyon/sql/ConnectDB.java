package com.interaksyon.sql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import com.dejima.core.nlp.text.action.FieldActuation;
import com.dejima.utils.log.LogManager;


public class ConnectDB {
	
	private Connection con = null;
	private CallableStatement cstm = null;
	private ResultSet rs = null;
	private PreparedStatement pstm = null;
	private Statement stm = null;
	
	protected static final LogManager logger = new LogManager(ConnectDB.class);
	
	public List executeCustomSQL(String query, List paramList) throws Exception{
			
		List records = new ArrayList();
		
		con = ConnectionPoolManager.getConnection();
		stm = con.createStatement();
		rs = stm.executeQuery(query);
				
		while(rs.next()){
			List record = new ArrayList();
			
			for(int x = 0; x < paramList.size(); x++){
				try{
					record.add(rs.getString(paramList.get(x).toString()));
				}catch(SQLException sqle){
					record.add(rs.getInt(paramList.get(x).toString()));
				}catch(Exception e){
					System.out.print(e);
				}
			}
			
			records.add(record);
			//record.add(rs.getString("road_name"));
			//record.add(rs.getString("flow"));
			//record.add(rs.getString("exit_name"));
			//record.add(rs.getString("bound"));
			//records.add(record);
		}
		
		if(rs != null) rs.close();
		if(stm != null) stm.close();
		if(con != null) con.close();
		
		return records;
	}
	
	public List executeCallStatementQuery(String query, Vector exits)throws Exception{
		
		List records = new ArrayList();
					
			con = ConnectionPoolManager.getConnection();
			
			cstm = con.prepareCall(query);
			
			for(int x = 1; x <= 2; x++){
				cstm.setString(x, ((FieldActuation)exits.get(x-1)).getText().getValue());
			}
			
			rs = cstm.executeQuery();

			while(rs.next()){				
				List record = new ArrayList();
				record.add(rs.getString("road_name"));
				record.add(rs.getString("flow"));
				record.add(rs.getString("exit_name"));
				record.add(rs.getString("bound"));
				records.add(record);
			}
		
		if(rs != null) rs.close();	
		if(cstm != null) cstm.close();
		if(con != null) con.close();
			
		return records;
		
	}
	
	public List getRecords(Vector list, String flow, String bound, Vector road) throws SQLException{
		
		List records = new ArrayList();
		
		con = ConnectionPoolManager.getConnection();
		
		String query = "SELECT t2.road_name, t1.flow, t1.exit_name, t1.bound from tbl_exit t1, tbl_main t2 where"; 
        
		query += " (";
		
		for(int y = 0; y < list.size(); y++){
			query += "t1.exit_name like ?";
			if(y != list.size()-1) query += " or ";
		}
		
		query += " )";
		
		if(!bound.equals(""))
			query += " and t1.bound = '" + bound + "'";
		
		if(!flow.equals(""))
			query += " and t1.flow = '" + flow + "'";
		
		if(road.size() > 0/*!road.equals("")*/){
			query += " and (";
			
			for(int a = 0; a < road.size(); a++){
				query += "t2.road_name like ?";
				if(a != road.size()-1) query += " or ";
			}
			
			query += " )";
		}
		
		query += " and t2.ID = t1.main_id order by t2.road_name desc";
		
		pstm = con.prepareStatement(query);
		
		for(int x = 0; x < list.size(); x++){
			FieldActuation exitFieldActuation = (FieldActuation) list.get(x);
			pstm.setString(x+1, "%"+exitFieldActuation.getText().getValue()+"%");
		}
		
		for(int b = 0; b < road.size(); b++){
			FieldActuation roadFieldActuation = (FieldActuation) road.get(b);
			pstm.setString((b+1)+(list.size()), "%"+roadFieldActuation.getText().getValue()+"%");
		}
		
		rs = pstm.executeQuery();
		
		while(rs.next()){
			List record = new ArrayList();
			record.add(rs.getString("road_name"));
			record.add(rs.getString("flow"));
			record.add(rs.getString("exit_name"));
			record.add(rs.getString("bound"));
			records.add(record);
		}
		
		if(rs != null) rs.close();
		if(pstm != null) stm.close();
		if(con != null) con.close();
		
		return records;
	}
}
