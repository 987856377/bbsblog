package com.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.conn.demo.JdbcUtils_C3P0;
import com.user.demo.User;

public class registerDao {
	
	User user = null;
	Connection connection = null;
	PreparedStatement state = null;
	ResultSet result = null;
	private String sql ="";		
	
	public User validate(String username){
		sql = "select * from user where username = ?";
		
		try{
			connection = JdbcUtils_C3P0.getConnection();
			state = connection.prepareStatement(sql);
			state.setString(1, username);
			result = state.executeQuery();
			
			//在数据库中查看将要注册的用户名是否已经存在
			if(result.next()){
				user = new User();
				user.setUsername(result.getString("username"));		//已存在,返回用户名
			}
		}catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }finally{
        	JdbcUtils_C3P0.release(connection, state, result);
		}
		return user;
	}
	
	public Boolean complete(String username,String password){
		
		sql = "insert into user(username,password) values(?,?)";
		
		try {
			connection = JdbcUtils_C3P0.getConnection();
			state = connection.prepareStatement(sql);
			state.setString(1, username);
			state.setString(2, password);
			state.execute();
			return true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JdbcUtils_C3P0.release(connection, state, result);
		}
		return false;
	}
}
