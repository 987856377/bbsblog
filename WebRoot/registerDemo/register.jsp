<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    <title>My JSP 'register.jsp' starting page</title>
    <style type="text/css">
    	body{
    		background-image:url(/bbsblog/image/white.jpg);
    	}
    
    </style>
	<script type="text/javascript">
    	function register(form){
    		if(form.username.value==""){
    			alert("�û�������Ϊ�գ�");
    			return false;
    		}
    		if(form.password1.value==""){
    			alert("���벻��Ϊ�գ�");
    			return false;
    		}
    		if(form.password2.value==""){
    			alert("���벻��Ϊ�գ�");
    			return false;
    		}
    		if(form.password1.value!=form.password2.value){
    			alert("�������벻һ�£���ȷ������");
    			return false;
    		}
    	}
    
    </script>
  </head>
  
  <body>
    <center>  
    	<h1>Register Page</h1><br><br><br>
    	<form action="/bbsblog/servlet/RegisterServlet" method="post" onSubmit="return register(this)">
    		<table cellpadding="2" align="center">
    			<tr>
    				<td>�û���:</td>
    				<td><input type="text" name="username"></td>
    			</tr>
    			<tr>
    				<td>����:</td>
    				<td><input type="password" name="password1"></td>
    			</tr>
    			<tr>
    				<td>�ٴ���������:</td>
    				<td><input type="password" name="password2"></td>
    			</tr>
    			<tr>
    				<td><input type="submit" value="ע��"></td>
    				<td><input type="reset" value="����"></td>
    			</tr>
    		</table>
    	</form>
    </center>
  </body>
</html>
