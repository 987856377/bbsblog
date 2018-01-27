package com.section.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.section.dao.ReplyDao;
import com.section.demo.Reply;

@SuppressWarnings("serial")
public class AddReplyServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("GBK");
		response.setCharacterEncoding("GBK");
		
		String content = request.getParameter("content");
		String user = (String) request.getSession().getAttribute("user");
		Integer tid = (Integer)request.getSession().getAttribute("tid");
		
		Boolean flag = false;
		Date now = new Date();
		Reply reply = new Reply();
		ReplyDao replyDao = new ReplyDao();
		
		reply.setUid(replyDao.getUidBySession(user));
		reply.setTid(tid);
		reply.setUsername(user);
		reply.setContent(content);
		reply.setRdate(now);
		
		flag = replyDao.addReply(reply);
		if(flag==false){
			request.getRequestDispatcher("/sectionDemo/main.jsp").forward(request, response);
		}
		else{
			request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
		}
		
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);

	}

}
