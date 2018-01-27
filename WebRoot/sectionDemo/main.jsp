<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ page import="com.section.dao.*" import="com.section.demo.*"%>
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
    		<h1>����  ��̳</h1>
    		<pre>
    										<b>���磬���ֿɼ�</b>    		
    		</pre>

			
				������һ������
    		
    		<br>
    		<h4>
    			<c:choose>
  					<c:when test="${empty user }">
  						<a href="/bbsblog/loginDemo/login.jsp">����</a><br><br>
  					</c:when>
  					
  					<c:otherwise>
  						<a href="/bbsblog/sectionDemo/publish.jsp">����</a><br><br>
  						<a href="/bbsblog/sectionDemo/mytopics.jsp">�ҵ�����</a>
  					</c:otherwise>
  					
  				</c:choose> 				
  			</h4>
    		<table id="topic" border="1">
    
    	<thead><tr><th>�û�</th><th>����</th><th>����</th><th>����</th><th> ��  �� </th><th>�ظ��б�</th><c:if test="${role eq 'manager'}"><th>ɾ��</th></c:if></tr></thead>
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
  								<a href="/bbsblog/loginDemo/login.jsp"> ��  �� </a>
  							</c:when>
  						
  							<c:otherwise>
  								<c:url var="transform1" value="http://localhost/bbsblog/sectionDemo/response.jsp">
  										<c:param name="ptid1" value="${topic.tid }" ></c:param>
  									</c:url>
  									<a href="${transform1 }"> ��  �� </a>
  							</c:otherwise>
  						
  						</c:choose>  					
  					</h5>  					
  				</td> 
  				
  				<td>
  					<h5>
  						<c:choose>
  							<c:when test="${empty user }">
  								<a href="/bbsblog/loginDemo/login.jsp"> �� �� �� �� </a>
  							</c:when>
  							
  							<c:otherwise>
  								<c:url var="transform2" value="http://localhost/bbsblog/sectionDemo/responseList.jsp">
  									<c:param name="ptid2" value="${topic.tid }" ></c:param>
  								</c:url>
  								<a href="${transform2 }"> �� ���� �� </a>
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
  							<a href="${transform3 }">ɾ��</a>  										
  						</h5>  					
  					</td> 
  				</c:if>
  				   		
    		</tr>    		
    	</c:forEach>
    </table>
    
   </center>
    
  </body>
</html>