<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ page import="com.section.dao.*" import="com.section.demo.*"%>
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
  						<a href="/bbsblog/sectionDemo/mytopics.jsp">我的帖子</a>
  					</c:otherwise>
  					
  				</c:choose> 				
  			</h4>
    		<table id="topic" border="1">
    
    	<thead><tr><th>用户</th><th>主题</th><th>内容</th><th>日期</th><th> 回  复 </th><th>回复列表</th><c:if test="${role eq 'manager'}"><th>删除</th></c:if></tr></thead>
    	<% 
			List<Topic> list = new TopicDao().listAllTopicsByDate();
    	%>
    	<c:forEach var="topic" items="<%=list %>">
    		<tr>
    		
    			<td>${topic.username }</td><td>${topic.tittle }</td><td>${topic.content }</td><td>${topic.tdate }</td>
				
    			<td>
    				<h5>
    					<c:choose>
  							<c:when test="${empty user }">
  								<a href="/bbsblog/loginDemo/login.jsp"> 回  复 </a>
  							</c:when>
  						
  							<c:otherwise>
  								<c:url var="transform1" value="http://localhost/bbsblog/sectionDemo/response.jsp">
  										<c:param name="ptid1" value="${topic.tid }" ></c:param>
  									</c:url>
  									<a href="${transform1 }"> 回  复 </a>
  							</c:otherwise>
  						
  						</c:choose>  					
  					</h5>  					
  				</td> 
  				
  				<td>
  					<h5>
  						<c:choose>
  							<c:when test="${empty user }">
  								<a href="/bbsblog/loginDemo/login.jsp"> 查 看 回 帖 </a>
  							</c:when>
  							
  							<c:otherwise>
  								<c:url var="transform2" value="http://localhost/bbsblog/sectionDemo/responseList.jsp">
  									<c:param name="ptid2" value="${topic.tid }" ></c:param>
  								</c:url>
  								<a href="${transform2 }"> 查 看回 帖 </a>
  							</c:otherwise>  							
  						</c:choose> 						
  					</h5>  					
  				</td> 
  				
  				<c:if test="${role eq 'manager' }">
  					<td>
  						<h5>  							
  							<c:url var="transform3" value="http://localhost/bbsblog/servlet/DeleteTopicServlet">
  								<c:param name="ptid3" value="${topic.tid }" ></c:param>
  							</c:url>
  							<a href="${transform3 }">删除</a>  										
  						</h5>  					
  					</td> 
  				</c:if>
  				   		
    		</tr>    		
    	</c:forEach>
    </table>
    
   </center>
    
  </body>
</html>
