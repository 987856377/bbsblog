<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
	String user = (String)session.getAttribute("user");
	
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>����</title>
    <style type="text/css">
    	body{
    		background-image:url(/bbsblog/image/white.jpg);
    	}
    
    </style>
	<script type="text/javascript">
    	function addTopic(form){
    		if(form.tittle.value==""){
    			alert("���ⲻ��Ϊ�գ�");
    			return false;
    		}
    		if(form.content.value==""){
    			alert("���ݲ���Ϊ�գ�");
    			return false;
    		}
    	}
    
    </script>
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
		<h1>����  ��̳</h1><br>
		<h3> ����</h3>
		<a href="/bbsblog/sectionDemo/main.jsp"> ���� </a><br><br>
		<form action="/bbsblog/section/AddTopicServlet" method="post" onSubmit="return addTopic(this)">
			����:<textarea rows="2" cols="60" maxlenth="250" placeholder="����������" name="tittle"></textarea><br><br>����:<br>
			<textarea rows="6" cols="80" maxlenth="250" placeholder="����������" name="content"></textarea><br>
			
			<input type="submit" value="����">
			<input type="reset" value="����">
			
		</form>
	
	</center>
  </body>
</html>
