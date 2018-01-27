<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    <title>Login Failed</title>
    <style type="text/css">
    	body{
    		background-image:url(/bbsblog/image/white.jpg);
    	}
    
    </style>
  </head>
  
  <body>
    <center>
    	<br><br><br> 登陆失败<br><br><br>
    	Error,Something Wrong ! ! !<br>
    	Please Check for your ID or Password ! ! !<br>
    	请检查您的用户名或密码 ! ! !<br><br><br>
    	页面将在三秒后跳转会登录页面,或者
    	<%response.setHeader("refresh", "3;URL=/bbsblog/loginDemo/login.jsp"); %>
    	<a href = "/bbsblog/loginDemo/login.jsp">点击返回</a>
    </center>
  </body>
</html>
