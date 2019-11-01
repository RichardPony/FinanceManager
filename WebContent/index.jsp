<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>财务管理系统</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container" style="width:70%">
	  <h2 align="center" style="margin-top:40px;">财务管理系统</h2>
	  <form method="post" action = "Login/login.jsp">
	    <div class="form-group"  style="">
	      <label for="email">用户名:</label>
	      <input type="text" name="username" class="form-control" id="username" placeholder="Enter username">
	    </div>
	    <div class="form-group"  style="">
	      <label for="pwd">密码:</label>
	      <input type="password" name="password" class="form-control" id="pwd" placeholder="Enter password">
	    </div>
	    <button type="submit" class="btn btn-primary" style="width:40%;float:left">登录</button>
  		<a href="javascript:void(0);" onclick="register()"><button type="button" class="btn btn-secondary" style="width:40%;float:right">注册</button></a>
	  </form>
	</div>
<script>
function register() {
	var username = document.getElementById("username").value;
	var password = document.getElementById("pwd").value;
	window.location.href='Register?username='+ username +"&password="+password;
	}
</script>
</body>
</html>