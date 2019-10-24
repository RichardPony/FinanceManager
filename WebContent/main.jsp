<%@ page language="java" contentType="text/html; charset=GB18030" import="finan_bean.*" import="java.util.*"
    pageEncoding="GB18030"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
//	String username = request.getParameter("username");
//	Finance_Dao fin_detail = new Finance_Dao();
//	Finance finance = new Finance();
//	finance.setUsername(username);
//	finance.setNumber("002");
//	finance.setType("002");
//	finance.setTime(null);
//	finance.setComments("002");
//	fin_detail.add(finance);
	Finance_Dao fin = new Finance_Dao();
	List<Finance> finList=new ArrayList<Finance>();
	finList = fin.QueryAll();
	
%>
<nav class="navbar navbar-expand-sm bg-primary navbar-dark" style="margin-top:20px;">
  <ul class="navbar-nav">
    <li class="nav-item active">
      <a class="nav-link" href="#">Finance Manager</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">首页</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">添加财务信息</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">统计财务信息</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">Disabled</a>
    </li>
    <li class="nav-item navbar-right m'r">	
      <a class="nav-link" href="#">注册</a>
    </li>
  </ul>
</nav>
<div class="jumbotron jumbotron-fluid" style="margin-top:-10px;">
  <div class="container">
    <h1>财务管理系统</h1> 
    <p>Power By RichardPony，BISTU</p>
  </div>
</div>
你要查询的学生数据表中共有
    <font size="5" color="red"> <%=finList.size()%></font>人
    <table border="2" bgcolor= "ccceee" width="650">
         <tr bgcolor="CCCCCC" align="center">
             <td>姓名</td> <td>类型</td><td>数额</td> <td>时间</td><td>备注</td>
         </tr>
    <%int len=finList.size();
    for(int i=0;i<finList.size();i++){
        %>   <tr align="center">
                <td><%= i%></td>
                <td><%= finList.get(i).getUsername() %></td>
                <td><%= finList.get(i).getType() %></td>
                <td><%= finList.get(i).getNumber() %></td>
                <td><%= finList.get(i).getTime() %></td>
                <td><%= finList.get(i).getComments() %></td>
                <%len--; %>
              </tr>            
           <% }%>
         </table>
</body>
</html>