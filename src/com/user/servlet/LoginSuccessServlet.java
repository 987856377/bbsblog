package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class LoginSuccessServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setCharacterEncoding("GBK");
		request.setCharacterEncoding("GBK");
		String user = (String)request.getSession().getAttribute("user");
		String lastAccessTime = null;
		Cookie[] cookies = request.getCookies();
		for(int i=0;cookies!=null&&i<cookies.length;i++){
			if("lastAccess".equals(cookies[i].getName())){
				lastAccessTime = cookies[i].getValue();
				break;
			}
		}
		
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>login success</TITLE></HEAD>");
		out.println("  <BODY>");
		out.println("  	<CENTER>");
		out.println("  	<br><br><br>");
		out.println(user);
		
		out.println("  Congratulations,Login Seccessfully ! ! !<br><br><br>");
		out.println("  <br><br><br>");
		String url = "/bbsblog/";
		out.println("  <a href = '"+url+"'>Click Here</a>");		
		if(lastAccessTime==null){
			response.getWriter().print("您是首次访问本站！");
		}
		else{
			response.getWriter().print("您上次访问本站的时间是"+lastAccessTime);
		}
		out.println("  	</CENTER>");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
		
		String currentTime = new SimpleDateFormat("YYYY-MM-DD hh:mm:ss").format(new Date());
		Cookie cookie = new Cookie("lastAccess",currentTime);
		cookie.setMaxAge(60*60);
		response.addCookie(cookie);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request,response);
	}

}
