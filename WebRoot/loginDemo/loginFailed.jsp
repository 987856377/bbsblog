<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    <title>Login Failed</title>
    <style type="text/css">
    	body{
    		background-image:url(/bbsblog/image/white.jpg);
    	}
    
    </style>
  </head>
  
  <body>
    <center>
    	<br><br><br> ��½ʧ��<br><br><br>
    	Error,Something Wrong ! ! !<br>
    	Please Check for your ID or Password ! ! !<br>
    	���������û��������� ! ! !<br><br><br>
    	ҳ�潫���������ת���¼ҳ��,����
    	<%response.setHeader("refresh", "3;URL=/bbsblog/loginDemo/login.jsp"); %>
    	<a href = "/bbsblog/loginDemo/login.jsp">�������</a>
    </center>
  </body>
</html>
