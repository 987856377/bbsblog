<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
	String user = (String)session.getAttribute("user");

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>触手论坛</title>
    <style type="text/css">
    	body{
    		background-image:url(/bbsblog/image/white.jpg);
    	}
    
    </style>
  </head>
  
  <body>
  	<h4>
  		<c:choose>
  			<c:when test="${empty user }">
  				<a href = "/bbsblog/loginDemo/login.jsp">登录</a>
  				<a href = "/bbsblog/registerDemo/register.jsp"> 注册</a>
  			</c:when>
  		
  			<c:otherwise>
  				欢迎您: ${user }
  				<c:if test="${role eq 'manager'}">管理员</c:if>
  				<a href="/bbsblog/servlet/UserExitServlet">退出</a>
  			</c:otherwise>  
  				
  	</c:choose> 	
  	</h4>
    	<center>
    		<h1>欢迎来到触手论坛</h1>
    	
    		<a href="/bbsblog/sectionDemo/main.jsp">点击进入</a>
    	
    	</center>
  </body>
</html>
