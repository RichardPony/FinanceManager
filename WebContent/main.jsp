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
	String TimeStart = request.getParameter("TimeStart");
	String TimeEnd = request.getParameter("TimeEnd");
	Finance_Dao fin = new Finance_Dao();
	List<Finance> finList=new ArrayList<Finance>();
	String username = request.getParameter("username");
	String detail = request.getParameter("detail");
	String index = "main.jsp?username=" + username;
	List<String> Sum = new ArrayList<String>();
	String Sum_in,Sum_out;
	
	if(TimeStart!=null&&TimeEnd!=null){
		finList = fin.Query(username, TimeStart, TimeEnd);
		Sum = fin.QuerySum(username, TimeStart, TimeEnd);
		Sum_in = Sum.get(0);
		Sum_out = Sum.get(1);
	}
	else{
		finList = fin.QueryAll(username);
		Sum = fin.QuerySum(username, null, null);
		Sum_in = Sum.get(0);
		Sum_out = Sum.get(1);
		//System.out.print(Sum);
	}
%>
<nav class="navbar navbar-expand-md bg-primary navbar-dark" style="margin-top:0px;">
  <ul class="navbar-nav">
    <li class="nav-item active">
      <a class="nav-link" href=<%=index %>>Finance Manager</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href=<%=index %>>首页</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#" data-toggle="modal" data-target="#myModal" onclick="editInfo(obj)">添加财务信息</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">统计财务信息</a>
    </li>
    <li class="nav-item float-right">	
      <a class="nav-link" href="index.jsp">注册</a>
    </li>
  </ul>
</nav>

<div class="jumbotron jumbotron-fluid" style="margin-top:0px;">
  <div class="container">
    <h1>财务管理系统</h1> 
    <p>Powered By RichardPony，BISTU</p>
  </div>
</div>

<div style="text-align:center; margin:-20px 0 10px 0">
	<table class="table table-hover">
		<tr>
			<td>总额统计:</td>
			<td>支出总额:<%=Sum_out %></td>
			<td>收入总额:<%=Sum_in %></td>
			<td></td>
		</tr>
		<tr>
			<td><input type="text" class="form-control" placeholder="起始时间" id='TimeStart' style="width:70%;float:left;"></td>
			<td><input type="text" class="form-control" placeholder="结束时间" id='TimeEnd'style="width:70%;float:left;"></td>
			<td>
				<button class="btn btn-primary btn-lg" onclick="Query()">
					查询财务信息
				</button>
			</td>
			<td>
				<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
					新增财务信息
				</button>
			</td>
		</tr>
		
	</table>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">  
    <!--用于插入的模态框-->
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
			        <option>支出</option>
			        <option>收入</option>
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
		      <input type="text" class="form-control" placeholder="Number" id="number" oninput = "value=value.replace(/[^\d]/g,'')">
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
                <button type="button" class="btn btn-primary" onclick="add()" data-dismiss="modal">提交更改</button>  
            </div>   
        </div>  
        <!-- /.modal-content -->  
    </div>  
    <!-- /.modal -->  
</div>  
<!-- 模态框（Modal）end -->

<div class="modal fade" id="ChangeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">  
    <!--用于修改的模态框-->
    <div class="modal-dialog">  
        <div class="modal-content">
			<div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>  
            </div>
            <div style="text-align:center;">
            	<h4 class="modal-title" id="changeModalLabel">修改信息</h4> 
            </div>
            <div class="modal-body">  
            <!-- 用于修改数据的输入框组 -->
            <input id="Label-ID" style="opacity:0"></input>
             <!-- 类型 -->
		     <div class="input-group mb-3">
		      <div class="input-group-prepend">
		        <span class="input-group-text">类型</span>
		      </div>     
		      	 <select class="form-control" id="ChangeType">
			        <option>支出</option>
			        <option>收入</option>
			     </select>
             </div>
		     <!-- 备注 -->
		     <div class="input-group mb-3">
		      <div class="input-group-prepend">
		        <span class="input-group-text">备注</span>
		      </div>
		      <input type="text" class="form-control" placeholder="Comments" id="ChangeComments">
		     </div>
		     <!-- 数额 -->
		     <div class="input-group mb-3">
		      <div class="input-group-prepend">
		        <span class="input-group-text">数额</span>
		      </div>
		      <input type="text" class="form-control" placeholder="Number" id="ChangeNumber" oninput = "value=value.replace(/[^\d]/g,'')">
		     </div>
		     <!-- 时间 -->
		     <div class="input-group mb-3">
		      <div class="input-group-prepend">
		        <span class="input-group-text">时间</span>
		      </div>
		      <input type="text" class="form-control" placeholder="Time" id='ChangeDatetime'>
		     </div>
            </div>  
            <div class="modal-footer">  
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>  
                <button type="button" class="btn btn-primary" onclick="change()" data-dismiss="modal">提交更改</button>  
            </div>   
        </div>  
        <!-- /.modal-content -->  
    </div>  
    <!-- /.modal -->  
</div>  
<!-- 模态框（Modal）end -->

<div id="table">
	<div style="text-align:center;">
	用户共有
	    <font size="5" color="red"> <%=finList.size()%></font>条财务数据
	</div>
    <table class="table table-hover">
         <tr bgcolor="CCCCCC" align="center">
             <td>用户名</td> <td>类型</td><td>备注</td><td>数额</td> <td>时间</td><td>操作</td>
         </tr>
         
    <%int len=finList.size();
    for(int i=0;i<finList.size();i++){
        %>   <tr align="center">
                <td><%= finList.get(i).getUsername() %></td>
                <td><%= finList.get(i).getType() %></td>
                <td><%= finList.get(i).getComments() %></td>
               	 <td><%= finList.get(i).getNumber() %></td>
                <td><%= finList.get(i).getTime() %></td>
                <td>
	                <button type="button" class="btn btn-outline-info" data-id=<%= finList.get(i).getId() %> data-toggle="modal" data-target="#ChangeModal" onclick="changeID('<%=finList.get(i).getId()%>')">修改</button>
	                <button type="button" class="btn btn-outline-danger" onclick="del('<%= finList.get(i).getId() %>')">删除</button>
               	</td>
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
    $(function () {
        $("#changetime").datetimepicker({
             format: 'YYYY-MM-DD',
             locale: moment.locale('zh-cn')
        });
    }); 
    $(function () {
        $("#TimeStart").datetimepicker({
             format: 'YYYY-MM-DD',
             locale: moment.locale('zh-cn')
        });
    }); 
    $(function () {
        $("#TimeEnd").datetimepicker({
             format: 'YYYY-MM-DD',
             locale: moment.locale('zh-cn')
        });
    }); 
    $(function () {
        $("#ChangeDatetime").datetimepicker({
             format: 'YYYY-MM-DD',
             locale: moment.locale('zh-cn')
        });
    });
    function del(data){
    	window.location.href="DeleteController?username=" + <%=request.getParameter("username")%> + "&id="+data;
    }
    function changeID(data){
    	document.getElementById("Label-ID").value=data
    	console.log(data)
    }
    
    //处理添加操作  
    function add() {  
        //获取模态框数据  
        var type = document.getElementById("type").value;
        var comments = document.getElementById("comments").value;
        var number = document.getElementById("number").value;
        var time = document.getElementById("datetime").value;
        var username = <%=request.getParameter("username")%>;
        alert(time);
		if(number==""){
			alert("数额不能为空");
			return;
		}
		else{
			var url = encodeURI("AddInfoController?type="+type+"&comments="+comments+"&number="+number+"&time="+time+"&username="+username);
			window.location.href = url;
		}
		
    }
    function change(){
    	var type = document.getElementById("ChangeType").value;
        var comments = document.getElementById("ChangeComments").value;
        var number = document.getElementById("ChangeNumber").value;
        var time = document.getElementById("ChangeDatetime").value;
        var username = <%=request.getParameter("username")%>;
        var id = document.getElementById("Label-ID").value;
        alert(time);
        if(number==""){
			alert("数额不能为空");
			return;
		}else{
			alert("Jump TO Change");
			var url2 = encodeURI("Change?type="+type+"&comments="+comments+"&number="+number+"&time="+time+"&username="+username+"&id="+id);
			window.location.href = url2;
		}
        
    }
    
    var res ='<%=request.getParameter("res")%>';
    if(res=='success'){
     alert("操作成功");
     window.location.href="main.jsp?username="+ <%=request.getParameter("username")%>;
    }
    function Query(){
    	var TimeStart = document.getElementById("TimeStart").value;
    	var TimeEnd = document.getElementById("TimeEnd").value;
    	window.location.href = "main.jsp?username="+<%=request.getParameter("username")%>+"&TimeStart="+TimeStart+"&TimeEnd="+TimeEnd;
    }
</script>
</html>