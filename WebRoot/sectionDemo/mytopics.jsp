<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ page import="com.section.dao.*" import="com.section.demo.*"%>
<%
	String user = (String)session.getAttribute("user");

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>我的帖子</title>
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

			
				生活是一门艺术<br>
				<h4><a href="/bbsblog/sectionDemo/main.jsp">返回</a></h4>
    			
    		<br><br><br>
	
    <table id="topic" border="1">
    
    	<thead><tr><th>用户</th><th>主题</th><th>内容</th><th>日期</th><th>回复列表</th><th>删除</th></thead>
    	<% 
    		TopicDao tpDao = new TopicDao();
			List<Topic> list = tpDao.listAllTopicsByUser(tpDao.getUidBySession(user));
    	%>
    	<c:forEach var="topic" items="<%=list %>">
    		<tr>
    		
    			<td>${topic.username }</td><td>${topic.tittle }</td><td>${topic.content }</td><td>${topic.tdate }</td>
				
  				<td>
  					<h5>
  						<c:choose>
  							<c:when test="${empty user }">
  								<a href="/bbsblog/loginDemo/login.jsp"> 查 看 回 帖 </a>
  							</c:when>
  							
  							<c:otherwise>
  								<c:url var="transform5" value="http://localhost/bbsblog/sectionDemo/responseList.jsp">
  									<c:param name="ptid2" value="${topic.tid }" ></c:param>
  								</c:url>
  								<a href="${transform5 }"> 查 看 回 帖 </a>
  							</c:otherwise>  							
  						</c:choose> 						
  					</h5>  					
  				</td>  			
  				
  				<td>
  					<h5>
  						<c:url var="transform6" value="http://localhost/bbsblog/servlet/DeleteMyTopicServlet">
  							<c:param name="ptid3" value="${topic.tid }" ></c:param>
  						</c:url>
  						<a href="${transform6 }"> 删 除 </a>
  					</h5>
  				</td> 		
    		</tr>    		
    	</c:forEach>
    </table>
    
   </center>
  </body>
</html>
