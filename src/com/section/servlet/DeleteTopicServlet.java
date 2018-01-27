package com.section.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.section.dao.TopicDao;

@SuppressWarnings("serial")
public class DeleteTopicServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setCharacterEncoding("GBK");
		request.setCharacterEncoding("GBK");
		
		Boolean flag = false;
		int tid = Integer.parseInt(request.getParameter("ptid3"));

		TopicDao tpDao = new TopicDao();
		int uid = tpDao.getUidByTid(tid);

		flag = tpDao.deleteTopic(uid,tid);		
		if(flag==false){
			request.getRequestDispatcher("/sectionDemo/main.jsp").forward(request, response);
		}
		else{
			request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request,response);

	}

}
