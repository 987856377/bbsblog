package com.section.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.section.dao.ReplyDao;

@SuppressWarnings("serial")
public class DeleteReplyServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("GBK");
		request.setCharacterEncoding("GBK");
		
		Boolean flag = false;
		int rid = Integer.parseInt(request.getParameter("prid1"));
		System.out.println(rid);

		ReplyDao rpDao = new ReplyDao();
		int uid = rpDao.getUidByRid(rid);
		System.out.println(uid);
		int tid = rpDao.getTidByRid(rid);
		System.out.println(tid);
		
		flag = rpDao.deleteOneReplyByRid(uid, tid, rid);
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
