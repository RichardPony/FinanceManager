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
<!-- ����ѡ���������� -->
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
      <a class="nav-link" href=<%=index %>>��ҳ</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#" data-toggle="modal" data-target="#myModal" onclick="editInfo(obj)">��Ӳ�����Ϣ</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">ͳ�Ʋ�����Ϣ</a>
    </li>
    <li class="nav-item float-right">	
      <a class="nav-link" href="index.jsp">ע��</a>
    </li>
  </ul>
</nav>

<div class="jumbotron jumbotron-fluid" style="margin-top:0px;">
  <div class="container">
    <h1>�������ϵͳ</h1> 
    <p>Powered By RichardPony��BISTU</p>
  </div>
</div>

<div style="text-align:center; margin:-20px 0 10px 0">
	<table class="table table-hover">
		<tr>
			<td>�ܶ�ͳ��:</td>
			<td>֧���ܶ�:<%=Sum_out %></td>
			<td>�����ܶ�:<%=Sum_in %></td>
			<td></td>
		</tr>
		<tr>
			<td><input type="text" class="form-control" placeholder="��ʼʱ��" id='TimeStart' style="width:70%;float:left;"></td>
			<td><input type="text" class="form-control" placeholder="����ʱ��" id='TimeEnd'style="width:70%;float:left;"></td>
			<td>
				<button class="btn btn-primary btn-lg" onclick="Query()">
					��ѯ������Ϣ
				</button>
			</td>
			<td>
				<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
					����������Ϣ
				</button>
			</td>
		</tr>
		
	</table>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">  
    <!--���ڲ����ģ̬��-->
    <div class="modal-dialog">  
        <div class="modal-content">
			<div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">��</button>  
            </div>
            <div style="text-align:center;">
            	<h4 class="modal-title" id="myModalLabel">������Ϣ</h4> 
            </div>
            <div class="modal-body">  
            <!-- ����������ݵ�������� -->
             <!-- ���� -->
		     <div class="input-group mb-3">
		      <div class="input-group-prepend">
		        <span class="input-group-text">����</span>
		      </div>     
		      	 <select class="form-control" id="type">
			        <option>֧��</option>
			        <option>����</option>
			     </select>
             </div>
		     <!-- ��ע -->
		     <div class="input-group mb-3">
		      <div class="input-group-prepend">
		        <span class="input-group-text">��ע</span>
		      </div>
		      <input type="text" class="form-control" placeholder="Comments" id="comments">
		     </div>
		     <!-- ���� -->
		     <div class="input-group mb-3">
		      <div class="input-group-prepend">
		        <span class="input-group-text">����</span>
		      </div>
		      <input type="text" class="form-control" placeholder="Number" id="number" oninput = "value=value.replace(/[^\d]/g,'')">
		     </div>
		     <!-- ʱ�� -->
		     <div class="input-group mb-3">
		      <div class="input-group-prepend">
		        <span class="input-group-text">ʱ��</span>
		      </div>
		      <input type="text" class="form-control" placeholder="Time" id='datetime'>
		     </div>
            </div>  
            <div class="modal-footer">  
                <button type="button" class="btn btn-default" data-dismiss="modal">�ر�</button>  
                <button type="button" class="btn btn-primary" onclick="add()" data-dismiss="modal">�ύ����</button>  
            </div>   
        </div>  
        <!-- /.modal-content -->  
    </div>  
    <!-- /.modal -->  
</div>  
<!-- ģ̬��Modal��end -->

<div class="modal fade" id="ChangeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">  
    <!--�����޸ĵ�ģ̬��-->
    <div class="modal-dialog">  
        <div class="modal-content">
			<div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">��</button>  
            </div>
            <div style="text-align:center;">
            	<h4 class="modal-title" id="changeModalLabel">�޸���Ϣ</h4> 
            </div>
            <div class="modal-body">  
            <!-- �����޸����ݵ�������� -->
            <input id="Label-ID" style="opacity:0"></input>
             <!-- ���� -->
		     <div class="input-group mb-3">
		      <div class="input-group-prepend">
		        <span class="input-group-text">����</span>
		      </div>     
		      	 <select class="form-control" id="ChangeType">
			        <option>֧��</option>
			        <option>����</option>
			     </select>
             </div>
		     <!-- ��ע -->
		     <div class="input-group mb-3">
		      <div class="input-group-prepend">
		        <span class="input-group-text">��ע</span>
		      </div>
		      <input type="text" class="form-control" placeholder="Comments" id="ChangeComments">
		     </div>
		     <!-- ���� -->
		     <div class="input-group mb-3">
		      <div class="input-group-prepend">
		        <span class="input-group-text">����</span>
		      </div>
		      <input type="text" class="form-control" placeholder="Number" id="ChangeNumber" oninput = "value=value.replace(/[^\d]/g,'')">
		     </div>
		     <!-- ʱ�� -->
		     <div class="input-group mb-3">
		      <div class="input-group-prepend">
		        <span class="input-group-text">ʱ��</span>
		      </div>
		      <input type="text" class="form-control" placeholder="Time" id='ChangeDatetime'>
		     </div>
            </div>  
            <div class="modal-footer">  
                <button type="button" class="btn btn-default" data-dismiss="modal">�ر�</button>  
                <button type="button" class="btn btn-primary" onclick="change()" data-dismiss="modal">�ύ����</button>  
            </div>   
        </div>  
        <!-- /.modal-content -->  
    </div>  
    <!-- /.modal -->  
</div>  
<!-- ģ̬��Modal��end -->

<div id="table">
	<div style="text-align:center;">
	�û�����
	    <font size="5" color="red"> <%=finList.size()%></font>����������
	</div>
    <table class="table table-hover">
         <tr bgcolor="CCCCCC" align="center">
             <td>�û���</td> <td>����</td><td>��ע</td><td>����</td> <td>ʱ��</td><td>����</td>
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
	                <button type="button" class="btn btn-outline-info" data-id=<%= finList.get(i).getId() %> data-toggle="modal" data-target="#ChangeModal" onclick="changeID('<%=finList.get(i).getId()%>')">�޸�</button>
	                <button type="button" class="btn btn-outline-danger" onclick="del('<%= finList.get(i).getId() %>')">ɾ��</button>
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
    
    //������Ӳ���  
    function add() {  
        //��ȡģ̬������  
        var type = document.getElementById("type").value;
        var comments = document.getElementById("comments").value;
        var number = document.getElementById("number").value;
        var time = document.getElementById("datetime").value;
        var username = <%=request.getParameter("username")%>;
        alert(time);
		if(number==""){
			alert("�����Ϊ��");
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
			alert("�����Ϊ��");
			return;
		}else{
			alert("Jump TO Change");
			var url2 = encodeURI("Change?type="+type+"&comments="+comments+"&number="+number+"&time="+time+"&username="+username+"&id="+id);
			window.location.href = url2;
		}
        
    }
    
    var res ='<%=request.getParameter("res")%>';
    if(res=='success'){
     alert("�����ɹ�");
     window.location.href="main.jsp?username="+ <%=request.getParameter("username")%>;
    }
    function Query(){
    	var TimeStart = document.getElementById("TimeStart").value;
    	var TimeEnd = document.getElementById("TimeEnd").value;
    	window.location.href = "main.jsp?username="+<%=request.getParameter("username")%>+"&TimeStart="+TimeStart+"&TimeEnd="+TimeEnd;
    }
</script>
</html>