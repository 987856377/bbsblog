package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.dao.registerDao;
import com.user.demo.User;

@SuppressWarnings("serial")
public class RegisterServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		User user = null;
		Boolean flag = false;
		response.setCharacterEncoding("GBK");
		request.setCharacterEncoding("GBK");
		//获取提交到的用户名密码
		String username = request.getParameter("username");
		String password = request.getParameter("password2");
		
		//验证用户名是否存在
		registerDao register = new registerDao();
		user = register.validate(username);
		
		if(user!=null){		//用户已被注册
			request.getRequestDispatcher("/registerDemo/registerFailed.jsp").forward(request, response);
		}else{		//注册新用户
			
			flag = register.complete(username, password);
			if(flag == true){
				request.getSession().setAttribute("user", username);
				request.getRequestDispatcher("/registerDemo/registerSuccess.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("/registerDemo/registerFailed.jsp").forward(request, response);
			}
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
