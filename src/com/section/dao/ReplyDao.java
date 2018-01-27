package com.section.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.conn.demo.JdbcUtils_C3P0;
import com.section.Interface.ReplyInf;
import com.section.demo.Reply;

public class ReplyDao implements ReplyInf{
	
	Reply reply = null;
	List<Reply> list = null;
	Connection connection = null;
	PreparedStatement state = null;
	ResultSet result = null;
	private String sql = "";
	private Boolean flag = false;
	
	public int getUidBySession(String user){
		int uid=0;
		sql = "select uid from user where username=?";

		try {
			connection = JdbcUtils_C3P0.getConnection();
			state = connection.prepareStatement(sql);
			state.setString(1, user);
			result = state.executeQuery();
			
			if(result.next()){
				uid = result.getInt("uid");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JdbcUtils_C3P0.release(connection, state, result);
		}		
		
		return uid;
	}	
	
	public int getUidByRid(int rid){
		int uid=0;
		sql = "select uid from reply where rid=?";
		
		try {
			connection = JdbcUtils_C3P0.getConnection();
			state = connection.prepareStatement(sql);
			state.setInt(1, rid);
			result = state.executeQuery();
			
			if(result.next()){
				uid = result.getInt("uid");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JdbcUtils_C3P0.release(connection, state, result);
		}	
		
		return uid;
	}
	
	public int getTidByRid(int rid){
		int tid=0;
		sql = "select tid from reply where rid=?";
		
		try {
			connection = JdbcUtils_C3P0.getConnection();
			state = connection.prepareStatement(sql);
			state.setInt(1, rid);
			result = state.executeQuery();
			
			if(result.next()){
				tid = result.getInt("tid");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JdbcUtils_C3P0.release(connection, state, result);
		}	
		
		return tid;
	}
	
	public Boolean addReply(Reply reply){
		sql = "insert into reply(uid,tid,username,rcontent,rdate) values(?,?,?,?,?)";
		
		try {
			connection = JdbcUtils_C3P0.getConnection();
			state = connection.prepareStatement(sql);
			state.setInt(1, reply.getUid());
			state.setInt(2, reply.getTid());
			state.setString(3, reply.getUsername());
			state.setString(4, reply.getContent());
			state.setDate(5, new java.sql.Date(reply.getRdate().getTime()));
			
			flag = state.execute();
			if(flag == false){
				return flag;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JdbcUtils_C3P0.release(connection, state, result);
		}
		
		return flag;
	}
	
	public Boolean deleteOneReplyByRid(int uid,int tid,int rid){
		sql = "delete from reply where uid=? and tid=? and rid=?";
		
		try {
			connection = JdbcUtils_C3P0.getConnection();
			state = connection.prepareStatement(sql);
			state.setInt(1, uid);
			state.setInt(2, tid);
			state.setInt(3, rid);
			flag = state.execute();

			if(flag==false){
				return flag;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JdbcUtils_C3P0.release(connection, state, result);
		}
		return flag;	
	}
	
	public Boolean deleteAllReplyByTid(int tid){
		sql = "delete from reply where tid = ?";
		
		try {
			connection = JdbcUtils_C3P0.getConnection();
			state = connection.prepareStatement(sql);
			state.setInt(1, reply.getTid());
			flag = state.execute();
			
			if(flag==false){
				return flag;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JdbcUtils_C3P0.release(connection, state, result);
		}
		return flag;
	}
	
	public Boolean deleteAllReplyByUid(int uid){
		sql = "delete from reply where uid = ?";
		
		try {
			connection = JdbcUtils_C3P0.getConnection();
			state = connection.prepareStatement(sql);
			state.setInt(1, uid);
			flag = state.execute();
			
			if(flag==false){
				return flag;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JdbcUtils_C3P0.release(connection, state, result);
		}
		return flag;
	}
	
	public List<Reply> listAllReplyByDate(int tid){
		sql = "select * from reply where tid = ? order by rdate desc,rid desc";
		
		try {
			connection = JdbcUtils_C3P0.getConnection();
			state = connection.prepareStatement(sql);
			state.setInt(1, tid);
			result = state.executeQuery();
			list = new ArrayList<Reply>();
			
			while(result.next()){
				reply = new Reply();
				reply.setUid(result.getInt("uid"));
				reply.setTid(tid);
				reply.setRid(result.getInt("rid"));
				reply.setUsername(result.getString("username"));
				reply.setContent(result.getString("rcontent"));
				reply.setRdate(result.getDate("rdate"));
								
				list.add(reply);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JdbcUtils_C3P0.release(connection, state, result);
		}
		return list;
	}
	
	public List<Reply> listAllReplyByUid(int uid){
		sql = "select * from reply where uid = ?";
		
		try {
			connection = JdbcUtils_C3P0.getConnection();
			state = connection.prepareStatement(sql);
			state.setInt(1, uid);
			result = state.executeQuery();
			list = new ArrayList<Reply>();
			
			while(result.next()){
				reply = new Reply();
				reply.setContent(result.getString("rcontent"));
				reply.setRdate(result.getDate("rdate"));
				
				
				list.add(reply);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JdbcUtils_C3P0.release(connection, state, result);
		}
		return list;
	}

}
