<%@ page language="java" import="java.util.*" pageEncoding="gb18030"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    <title>Login Page</title>
    <style type="text/css">
    	body{
    		background-image:url(/bbsblog/image/white.jpg);
    	}
    
    </style>
    <script type="text/javascript">
    	function login(form){
    		if(form.username.value==""){
    			alert("�û�������Ϊ�գ�");
    			return false;
    		}
    		if(form.password.value==""){
    			alert("���벻��Ϊ�գ�");
    			return false;
    		}
    	}
    
    </script>
  </head>
  
  <body>
    <center>  
    	<h1>Login Page</h1><br><br><br>
    	<form action="/bbsblog/servlet/LoginServlet" method="post" onSubmit="return login(this)">
    		<table cellpadding="2" align="center">
    			<tr>
    				<td align="left">�û���:</td>
    				<td><input type="text" name="username"></td>
    			</tr>
    			<tr>
    				<td align="left">����:</td>
    				<td><input type="password" name="password"><br></td>
    			</tr>
    			<tr>
    				<td>
    					<select name="choose">				
  							<option value="��ͨ�û�">��ͨ�û�</option>
  							<option value="����Ա">����Ա</option>
  						</select>
  					</td>
  				</tr>
  				<tr>
    				<td align="left">��֤��:</td>
    				<td><input type="text" name="checkcode"></td>
  					<td><img src="/bbsblog/servlet/CheckCodeServlet"></td>		
    			</tr>
  				<tr>
    				<td><input type="submit" value="��¼"></td>
    				<td><input type="reset" value="����"></td>   			
    				<td><a href = "/bbsblog/registerDemo/register.jsp"> ע��</a></td>
    			</tr>
    		</table>
    	</form>
    </center>
  </body>
</html>
