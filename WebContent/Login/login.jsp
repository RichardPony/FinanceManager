<%@ page language="java" contentType="text/html; charset=GB18030" import="user_bean.*"
    pageEncoding="GB18030"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>�û���¼</title>
</head>
<body>
	<%
		//���ܴ��صĲ���
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		//��ѯ���ݿ����Ƿ��и��û�,�����û����������Ƿ�ƥ��
		User user = new User();
		User_Dao userDao = new User_Dao();
		user.setUsername(username);
		user.setPassword(password);
		String Sql_Password = userDao.findUser(username);
		if(Sql_Password.equals("false")){
			%>
			<script>
				alert("�û������ڣ���ע��");
				window.history.go(-1);
			</script>
			<%
		}else if(Sql_Password.equals(password)){%>
		<script>
			var username = <%=username %>;
			alert("��¼�ɹ���");
			window.location.href = "../main.jsp?username=" + username;
		</script> 
		<%
		
		}else{
			%>
			<script>
				alert("������������µ�¼��");
				window.history.go(-1);
			</script>
			<%
		}
	%>
	
</body>
</html>