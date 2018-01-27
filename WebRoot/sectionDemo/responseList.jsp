<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ page import="com.section.dao.*" import="com.section.demo.*"%>
<%
	String user = (String)session.getAttribute("user");
	int tid = Integer.parseInt(request.getParameter("ptid2"));
	
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
    		<h1>触手  论坛</h1>
    		<pre>
    										<b>世界，触手可及</b>    		
    		</pre>

			
				生活是一门艺术
    		
    		<br>
    		<h4>
    			<c:choose>
  					<c:when test="${empty user }">
  						<a href="/bbsblog/loginDemo/login.jsp">发帖</a><br><br>
  					</c:when>
  					
  					<c:otherwise>
  						<a href="/bbsblog/sectionDemo/publish.jsp">发帖</a><br><br>
  					</c:otherwise>
  					  					
  				</c:choose>
  				  			
  				<a href="/bbsblog/sectionDemo/main.jsp">返回</a><br><br>
  		  				
  			</h4>
    <table border="1">
    
    	<thead><tr><th>用户</th><th>内容</th><th>日期</th><c:if test="${role eq 'manager'}"><th>删除</th></c:if></tr></thead>
    	<% 
			List<Reply> list = new ReplyDao().listAllReplyByDate(tid);
    	%>
    	<c:forEach var="reply" items="<%=list %>">
    		<tr>
    			<td>${reply.username }</td>
    			<td>${reply.content }</td>
    			<td>${reply.rdate }</td>
    			
  				<c:if test="${role eq 'manager' }">
  					<td>
  						<h5>  							
  							<c:url var="transform4" value="http://localhost/bbsblog/servlet/DeleteReplyServlet">
  								<c:param name="prid1" value="${reply.rid }"></c:param>
  							</c:url>
  							<a href="${transform4 }">删除</a>  										
  						</h5>  					
  					</td> 
  				</c:if>
  				
    		</tr>    	
      	</c:forEach>      
    </table>
        
   </center>
    
  </body>
</html>
