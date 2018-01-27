package com.conn.demo;

import java.sql.*;


public class DBDao {
	private static String Driver = "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://localhost:3306/bbsblog?useSSL=false&useUnicode=true&characterEncoding=utf-8";
	private static String name = "root";
	private static String passwd = "root";
	
	private static Connection connection = null;
	
	public static Connection getConnection(){
		try {
			Class.forName(Driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("连接异常");
		}
		try {
			connection = DriverManager.getConnection(url, name, passwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return connection;
		
	}
	
	public  static void closeConnection(){

        if(connection != null){
            try {
            	connection.close(); // �ر����ݿ�����
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
