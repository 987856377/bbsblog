package com.section.Interface;

import java.util.List;

import com.section.demo.Topic;

public interface TopicInf {
	
	public int getUidBySession(String user);
	
	public int getUidByTid(int tid);	
	
	public Boolean addTopic(Topic topic);
	
	public Boolean  deleteTopic(int uid,int tid);

	public List<Topic> listAllTopicsByDate();
	
	public List<Topic> listAllTopicsByUser(int uid);
	
}
