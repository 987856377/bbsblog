package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.dao.LoginDao;
import com.user.demo.User;		
@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("GBK");
		request.setCharacterEncoding("GBK");
		//获取用户名密码
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String choose = request.getParameter("choose");
		String checkcode = request.getParameter("checkcode");
		
		String savecode = (String)request.getSession().getAttribute("Check_Code");
		
		LoginDao userDao = new LoginDao();
		User user = null;
		//将查询到的结果返回给 User
		if(choose.equals("管理员")){
			request.getSession().setAttribute("role", "manager");
			user = userDao.mnglogin(username, password);
		}
		
		else if(choose.equals("普通用户")){
			request.getSession().setAttribute("role", "employee");
			user = userDao.login(username, password);
		}
		
		if(user!=null&&checkcode.equals(savecode)){
			// 实现用户自动登录
			Cookie cookie = new Cookie("autologin",username+"-"+password);
			cookie.setMaxAge(60*60*24*31);
			cookie.setPath(request.getContextPath());
			response.addCookie(cookie);
			
			request.getSession().setAttribute("user", username);
			request.getRequestDispatcher("/loginDemo/loginSuccess.jsp").forward(request, response);
		}
		else if(!checkcode.equals(savecode)){
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
			out.println("<HTML>");
			out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
			out.println("  <BODY>");
			out.print("    <br><br><br><br> ");
			out.println("  <CENTER>");
			out.println("<H2>验证码错误</H2>");
			response.setHeader("refresh", "1;url=/bbsblog/loginDemo/login.jsp");
			out.println("  <CENTER>");
			out.println("  </BODY>");
			out.println("</HTML>");
			out.flush();
			out.close();
			
		}
		else{
			request.getRequestDispatcher("/loginDemo/loginFailed.jsp").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
