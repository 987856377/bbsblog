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
  					</c:otherwise>
  					  					
  				</c:choose>
  				  			
  				<a href="/bbsblog/sectionDemo/main.jsp">����</a><br><br>
  		  				
  			</h4>
    <table border="1">
    
    	<thead><tr><th>�û�</th><th>����</th><th>����</th><c:if test="${role eq 'manager'}"><th>ɾ��</th></c:if></tr></thead>
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
  							<a href="${transform4 }">ɾ��</a>  										
  						</h5>  					
  					</td> 
  				</c:if>
  				
    		</tr>    	
      	</c:forEach>      
    </table>
        
   </center>
    
  </body>
</html>
