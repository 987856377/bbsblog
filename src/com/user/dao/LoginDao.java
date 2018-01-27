package com.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.conn.demo.JdbcUtils_C3P0;
import com.user.demo.User;;
public class LoginDao {	
	
		User user = null;
		Connection connection = null;
	    PreparedStatement state = null;
	    ResultSet result = null;
	    private String sql ="";
	    
	    public User login(String username, String password){
	    	sql ="select * from user where username=? and password=?";         
	        try {
	        	connection = JdbcUtils_C3P0.getConnection();
	            state = connection.prepareStatement(sql);
	            state.setString(1, username);
	            state.setString(2, password);
	            
	            result = state.executeQuery();
	            //得到数据库的查询结果,一个数据集
	            if(result.next()){    
	            	user = new User();		//在数据库中查询到用户信息，保存在 User 中
	                user.setUsername(result.getString("username"));
	                user.setPassword(result.getString("password"));
	            }

	        } catch (Exception e) {
	            // TODO: handle exception
	            e.printStackTrace();
	        }finally{
	        	JdbcUtils_C3P0.release(connection, state, result);
			}
	        return user;
	    }
	    
	    public User mnglogin(String username, String password){
	    	sql ="select * from manager where mname=? and mpassword=?";         
	        try {
	        	connection = JdbcUtils_C3P0.getConnection();
	            state = connection.prepareStatement(sql);
	            state.setString(1, username);
	            state.setString(2, password);
	            
	            result = state.executeQuery();
	            //得到数据库的查询结果,一个数据集
	            if(result.next()){    
	            	user = new User();		//在数据库中查询到用户信息，保存在 User 中
	                user.setUsername(result.getString("mname"));
	                user.setPassword(result.getString("mpassword"));
	            }
	            
	        } catch (Exception e) {
	            // TODO: handle exception
	            e.printStackTrace();
	        }finally{
	        	JdbcUtils_C3P0.release(connection, state, result);
			}
	        return user;
	    }
}
