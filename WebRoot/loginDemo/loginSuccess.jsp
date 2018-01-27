<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
	String user = (String)session.getAttribute("user");
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    <title>Login Success</title>
    <style type="text/css">
    	body{
    		background-image:url(/bbsblog/image/white.jpg);
    	}
    
    </style>
  </head>
  
  <body>
    <center>
    	<br><br><br>用户  <c:out value="${user }"></c:out> 登陆成功 ! ! !<br><br><br>
    	Congratulations,Login Successfully ! ! !<br><br><br>
    	页面将在三秒后跳转,或者
    	<%response.setHeader("refresh", "3;URL=/bbsblog"); %>
    	<a href = "/bbsblog">Click Here</a><br>
    	
    </center>
  </body>
</html>
