<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
	String user = (String)session.getAttribute("user");

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>������̳</title>
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
  				<a href = "/bbsblog/loginDemo/login.jsp">��¼</a>
  				<a href = "/bbsblog/registerDemo/register.jsp"> ע��</a>
  			</c:when>
  		
  			<c:otherwise>
  				��ӭ��: ${user }
  				<c:if test="${role eq 'manager'}">����Ա</c:if>
  				<a href="/bbsblog/servlet/UserExitServlet">�˳�</a>
  			</c:otherwise>  
  				
  	</c:choose> 	
  	</h4>
    	<center>
    		<h1>��ӭ����������̳</h1>
    	
    		<a href="/bbsblog/sectionDemo/main.jsp">�������</a>
    	
    	</center>
  </body>
</html>
