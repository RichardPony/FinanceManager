<%@ page language="java" contentType="text/html; charset=GB18030" import="finan_bean.*" import="java.util.*"
    pageEncoding="GB2312"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html;charset=GB2312">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- 日期选择器的依赖 -->
<script src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js"></script>  
<link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">  
<script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script> 

<title>Insert title here</title>
</head>
<body>
<%
	Finance_Dao fin = new Finance_Dao();
	List<Finance> finList=new ArrayList<Finance>();
	String username = request.getParameter("username");
	finList = fin.QueryAll(username);
	
%>
<nav class="navbar navbar-expand-md bg-primary navbar-dark fixed-top" style="margin-top:0px;">
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
    <li class="nav-item float-right">	
      <a class="nav-link" href="#">注册</a>
    </li>
  </ul>
</nav>

<div class="jumbotron jumbotron-fluid" style="margin-top:0px;">
  <div class="container">
    <h1>财务管理系统</h1> 
    <p>Powered By RichardPony，BISTU</p>
  </div>
</div>

<div style="text-align:center; margin-top:30px">
	<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" onclick="editInfo(obj)">
		新增财务信息
	</button>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">  
    <div class="modal-dialog">  
        <div class="modal-content">  
			<div class="modal-header">  
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>  
            </div>
            <div style="text-align:center;">
            	<h4 class="modal-title" id="myModalLabel">增加信息</h4> 
            </div>
            <div class="modal-body">  
            <!-- 用于添加数据的输入框组 -->
             <!-- 类型 -->
		     <div class="input-group mb-3">
		      <div class="input-group-prepend">
		        <span class="input-group-text">类型</span>
		      </div>     
		      	 <select class="form-control" id="type">
			        <option>OUT</option>
			        <option>IN</option>
			     </select>
             </div>
		     <!-- 备注 -->
		     <div class="input-group mb-3">
		      <div class="input-group-prepend">
		        <span class="input-group-text">备注</span>
		      </div>
		      <input type="text" class="form-control" placeholder="Comments" id="comments">
		     </div>
		     <!-- 数额 -->
		     <div class="input-group mb-3">
		      <div class="input-group-prepend">
		        <span class="input-group-text">数额</span>
		      </div>
		      <input type="text" class="form-control" placeholder="Number" id="number">
		     </div>
		     <!-- 时间 -->
		     <div class="input-group mb-3">
		      <div class="input-group-prepend">
		        <span class="input-group-text">时间</span>
		      </div>
		      <input type="text" class="form-control" placeholder="Time" id='datetime'>
		     </div>
            </div>  
            <div class="modal-footer">  
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>  
                <button type="button" class="btn btn-primary" onclick="update()" data-dismiss="modal">提交更改</button>  
            </div>   
        </div>  
        <!-- /.modal-content -->  
    </div>  
    <!-- /.modal -->  
</div>  
<!-- 模态框（Modal）end -->
<div>
	<div style="text-align:center;">
	用户共有
	    <font size="5" color="red"> <%=finList.size()%></font>条财务数据
	</div>
    <table class="table table-hover">
         <tr bgcolor="CCCCCC" align="center">
             <td>用户名</td> <td>类型</td><td>备注</td><td>数额</td> <td>时间</td>
         </tr>
         
    <%int len=finList.size();
    for(int i=0;i<finList.size();i++){
        %>   <tr align="center">
                <td><%= finList.get(i).getUsername() %></td>
                <td><%= finList.get(i).getType() %></td>
                <td><%= finList.get(i).getComments() %></td>
                <td><%= finList.get(i).getNumber() %></td>
                <td><%= finList.get(i).getTime() %></td>
                <%len--; %>
              </tr>            
           <% }%>
    </table>
</div>
</body>
<script>
    $(function () {
        $("#datetime").datetimepicker({
             format: 'YYYY-MM-DD',
             locale: moment.locale('zh-cn')
        });
    }); 
    //提交更改  
    function update() {  
        //获取模态框数据  
        var type = document.getElementById("type").value;
        var comments = document.getElementById("comments").value;
        var number = document.getElementById("number").value;
        var time = document.getElementById("datetime").value;
        var username = <%=request.getParameter("username")%>;
		alert(type + comments + number + time + username);
		window.location.href = "AddInfoController?type="+type+"&comments="+comments+"&number="+number+"&time="+time+"&username="+username;
    }
    var res ='<%=request.getParameter("res")%>';
    if(res=='success'){
     alert("数据插入成功");
     window.location.href="main.jsp?username="+ <%=request.getParameter("username")%>;
    }
    
</script>
</html>