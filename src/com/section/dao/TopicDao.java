package com.section.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.conn.demo.JdbcUtils_C3P0;
import com.section.Interface.TopicInf;
import com.section.demo.Topic;

public class TopicDao implements TopicInf{
	
	Topic topic = null;
	List<Topic> list = null;
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
	
	public int getUidByTid(int tid){
		int uid=0;
		sql = "select uid from topic where tid=?";
		
		try {
			connection = JdbcUtils_C3P0.getConnection();
			state = connection.prepareStatement(sql);
			state.setInt(1, tid);
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
	
	public Boolean addTopic(Topic topic){
		sql = "insert into topic(uid,username,tittle,tcontent,tdate) values(?,?,?,?,?)";
		
		try {
			connection = JdbcUtils_C3P0.getConnection();
			state = connection.prepareStatement(sql);
			state.setInt(1, topic.getUid());
			state.setString(2, topic.getUsername());
			state.setString(3, topic.getTittle());
			state.setString(4, topic.getContent());
			state.setDate(5,new java.sql.Date(topic.getTdate().getTime()));
			
//			如果第一个结果是 ResultSet 对象，则返回 true；如果第一个结果是更新计数或者没有结果，则返回 false
//			意思就是如果是查询的话返回true，如果是更新或插入的话就返回false了；
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
	
	public Boolean  deleteTopic(int uid,int tid){
		sql = "delete from reply where uid =? and tid=?";

		try {
			connection = JdbcUtils_C3P0.getConnection();
			state = connection.prepareStatement(sql);
			state.setInt(1, uid);
			state.setInt(2, tid);			
			flag = state.execute();
			
			sql = "delete from topic where tid = ?";
			state = connection.prepareStatement(sql);
			state.setInt(1, tid);
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
	
	public List<Topic> listAllTopicsByDate(){
		sql = "select * from topic order by tdate desc,tid desc";

		try {
			connection = JdbcUtils_C3P0.getConnection();
			state = connection.prepareStatement(sql);
			result = state.executeQuery();
			list = new ArrayList<Topic>();
			
			while(result.next()){
				topic = new Topic();
				topic.setTid(result.getInt("uid"));
				topic.setTid(result.getInt("tid"));
				topic.setUsername(result.getString("username"));
				topic.setTittle(result.getString("tittle"));
				topic.setContent(result.getString("tcontent"));
				topic.setTdate(result.getDate("tdate"));
	
				list.add(topic);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JdbcUtils_C3P0.release(connection, state, result);
		}	
		return list;
	}
	
	public List<Topic> listAllTopicsByUser(int uid){
		sql = "select * from topic where uid = ? order by tdate desc";

		try {
			connection = JdbcUtils_C3P0.getConnection();
			state = connection.prepareStatement(sql);
			state.setInt(1, uid);
			result = state.executeQuery();
			list = new ArrayList<Topic>();
			
			while(result.next()){
				topic = new Topic();
				topic.setTid(result.getInt("uid"));
				topic.setTid(result.getInt("tid"));
				topic.setUsername(result.getString("username"));
				topic.setTittle(result.getString("tittle"));
				topic.setContent(result.getString("tcontent"));
				topic.setTdate(result.getDate("tdate"));
								
				list.add(topic);
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
