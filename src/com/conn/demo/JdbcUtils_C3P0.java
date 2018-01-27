package com.conn.demo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.mchange.v2.c3p0.ComboPooledDataSource;

public class JdbcUtils_C3P0 {
	private static ComboPooledDataSource ds = null;
	
	static{		
		try {
//			使用自定义配置
//			ds = new ComboPooledDataSource();
//
//			ds.setDriverClass("com.mysql.jdbc.Driver");
//			ds.setJdbcUrl("jdbc:mysql://localhost:3306/test?useSSL=false&useUnicode=true&characterEncoding=utf-8");
//			ds.setUser("root");
//			ds.setPassword("root");
//			ds.setInitialPoolSize(10);
//			ds.setMaxPoolSize(20);
//			ds.setMinPoolSize(5);
//
//			调用c3p0-config.xml中默认配置
//			ds = new ComboPooledDataSource();
//			
//			调用自定义的MySQL中的配置
			ds = new ComboPooledDataSource("MySQL");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static Connection getConnection() throws SQLException{
		return ds.getConnection();
	}
	
	public static void release(Connection conn,PreparedStatement state,ResultSet result){
		try {
			result.close();
			state.close();
			 
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
