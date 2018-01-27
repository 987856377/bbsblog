<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
	String user = (String)session.getAttribute("user");

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    <title>My JSP 'registerSeccess.jsp' starting page</title>
	<style type="text/css">
    	body{
    		background-image:url(/bbsblog/image/white.jpg);
    	}
    
    </style>
  </head>
  
  <body>
   
    <center><br><br><br><br>
    	<br><br><br> <%=user %> Register Successfully ! ! ! <br><br><br>
    	Congratulations,you have been registered Successfully ! ! !<br><br><br>
    	页面将在三秒后跳转,或者
    	<%response.setHeader("refresh", "3;URL=/bbsblog"); %>
    	<a href = "/bbsblog">Click Here</a>
    </center>
  </body>
</html>
