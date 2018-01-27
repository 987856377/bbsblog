<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ page import="com.section.dao.*" import="com.section.demo.*"%>
 <% 
	pageContext.setAttribute("name","zhangsan");
	request.setAttribute("age", 16); 
	session.setAttribute("sex", "男");
	application.setAttribute("weight", 180);

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'testEL.jsp' starting page</title>

  </head>
  
  <body>
    This is my JSP page. <br>
    ${pageScope.name }
    ${requestScope.age }
    ${sessionScope.sex }
    ${applicationScope.weight}
    ${sessionScope.user }<br>
    ${pageScope.name }
    ${requestScope.age }
    ${sessionScope.sex }
    ${applicationScope.weight}
    ${sessionScope.user }<br>
    
    <c:out value="hello world"></c:out><br>
    
    <!-- 输出默认值  value值不存在输出default值 或者标签里的值-->
    <!-- http://localhost/bbsblog/sectionDemo/main1.jsp?username=frank  测试 -->
    <c:out value="${param.username }" default="NULL"></c:out>
    <c:out value="${param.username }" >NULL</c:out><br>
    
    <!-- 输出默认值  value值不存在输出NULL,存在不输出NULL -->
    <c:out value="${sessionScope.user }"> NULL</c:out><br>
    
    <c:set value="1" var="visitCount" property="visitCount"/>
    <c:if test="${visitCount eq 1 }">
    	true;
    </c:if><br>
    
    <c:choose>
    	<c:when test="${empty param.username }">
    		unknown user
    	</c:when>
    	<c:when test="${param.username eq 'frank'}">
    		manager;
    	</c:when>
    	<c:otherwise>
    		employee
    	</c:otherwise>
    </c:choose><br><br>
 	
 	<% String[] names={"zhangsan","lisi","wangwu"}; %>
 	
 	<c:forEach var="name" items="<%=names %>">
 		${name }<br>
 	</c:forEach><br>
 	
 	<% 
 		Map userMap = new HashMap(); 
 		userMap.put("zhangsan", "123");
 		userMap.put("lisi", "456");
 		userMap.put("wangwu", "789");
 	
 	%>
    <c:forEach var="user" items="<%=userMap %>">
    	用户名:${user.key }  密码:${user.value }<br>
    </c:forEach>
    
    <c:url var="transform" value="http://localhost/bbsblog/sectionDemo/responseList.jsp">
  		<c:param name="name" value="zhangsan" ></c:param>
  	</c:url>
  	<a href="${transform }">查看回帖</a>
       
  </body>
</html>
