package com.section.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.section.dao.TopicDao;
import com.section.demo.Topic;

@SuppressWarnings("serial")
public class AddTopicServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("GBK");
		response.setCharacterEncoding("GBK");
		
		Boolean flag = false;
		String tittle = request.getParameter("tittle");
		String content = request.getParameter("content");
		String user = (String) request.getSession().getAttribute("user");
		
		Date now = new Date();
		Topic topic = new Topic();
		TopicDao tpDao = new TopicDao();
		
		topic.setUid(tpDao.getUidBySession(user));
		topic.setUsername(user);
		topic.setTittle(tittle);
		topic.setContent(content);
		topic.setTdate(now);
		flag = tpDao.addTopic(topic);

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
