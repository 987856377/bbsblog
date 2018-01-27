package com.section.Interface;

import java.util.List;

import com.section.demo.Reply;

public interface ReplyInf {
	
	public Boolean addReply(Reply reply);
	
	public Boolean deleteOneReplyByRid(int uid,int tid,int rid);
	
	public Boolean deleteAllReplyByTid(int tid);
	
	public Boolean deleteAllReplyByUid(int uid);
	
	public List<Reply> listAllReplyByDate(int tid);
	
	public List<Reply> listAllReplyByUid(int uid);
	
}
