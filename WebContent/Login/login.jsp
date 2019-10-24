<%@ page language="java" contentType="text/html; charset=GB18030" import="user_bean.*"
    pageEncoding="GB18030"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>用户登录</title>
</head>
<body>
	<%
		//接受传回的参数
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		//查询数据库中是否有该用户,并且用户名和密码是否匹配
		User user = new User();
		User_Dao userDao = new User_Dao();
		user.setUsername(username);
		user.setPassword(password);
		String Sql_Password = userDao.findUser(username);
		if(Sql_Password.equals("false")){
			%>
			<script>
				alert("用户不存在！请注册");
				window.history.go(-1);
			</script>
			<%
		}else if(Sql_Password.equals(password)){%>
		<script>
			var username = <%=username %>;
			alert("登录成功！");
			window.location.href = "../main.jsp?username=" + username;
		</script> 
		<%
		
		}else{
			%>
			<script>
				alert("密码错误，请重新登录！");
				window.history.go(-1);
			</script>
			<%
		}
	%>
	
</body>
</html>