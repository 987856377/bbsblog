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
    			alert("用户名不能为空！");
    			return false;
    		}
    		if(form.password1.value==""){
    			alert("密码不能为空！");
    			return false;
    		}
    		if(form.password2.value==""){
    			alert("密码不能为空！");
    			return false;
    		}
    		if(form.password1.value!=form.password2.value){
    			alert("两次密码不一致，请确认输入");
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
    				<td>用户名:</td>
    				<td><input type="text" name="username"></td>
    			</tr>
    			<tr>
    				<td>密码:</td>
    				<td><input type="password" name="password1"></td>
    			</tr>
    			<tr>
    				<td>再次输入密码:</td>
    				<td><input type="password" name="password2"></td>
    			</tr>
    			<tr>
    				<td><input type="submit" value="注册"></td>
    				<td><input type="reset" value="重置"></td>
    			</tr>
    		</table>
    	</form>
    </center>
  </body>
</html>
