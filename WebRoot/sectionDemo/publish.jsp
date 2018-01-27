<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
	String user = (String)session.getAttribute("user");
	
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>发帖</title>
    <style type="text/css">
    	body{
    		background-image:url(/bbsblog/image/white.jpg);
    	}
    
    </style>
	<script type="text/javascript">
    	function addTopic(form){
    		if(form.tittle.value==""){
    			alert("标题不能为空！");
    			return false;
    		}
    		if(form.content.value==""){
    			alert("内容不能为空！");
    			return false;
    		}
    	}
    
    </script>
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
		<h1>触手  论坛</h1><br>
		<h3> 发帖</h3>
		<a href="/bbsblog/sectionDemo/main.jsp"> 返回 </a><br><br>
		<form action="/bbsblog/section/AddTopicServlet" method="post" onSubmit="return addTopic(this)">
			主题:<textarea rows="2" cols="60" maxlenth="250" placeholder="请输入主题" name="tittle"></textarea><br><br>内容:<br>
			<textarea rows="6" cols="80" maxlenth="250" placeholder="请输入内容" name="content"></textarea><br>
			
			<input type="submit" value="发表">
			<input type="reset" value="重置">
			
		</form>
	
	</center>
  </body>
</html>
