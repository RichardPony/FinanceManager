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
      <a class="nav-link" href="#">��ҳ</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">��Ӳ�����Ϣ</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">ͳ�Ʋ�����Ϣ</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">Disabled</a>
    </li>
    <li class="nav-item float-right">	
      <a class="nav-link" href="#">ע��</a>
    </li>
  </ul>
</nav>

<div class="jumbotron jumbotron-fluid" style="margin-top:0px;">
  <div class="container">
    <h1>�������ϵͳ</h1> 
    <p>Powered By RichardPony��BISTU</p>
  </div>
</div>

<div style="text-align:center; margin-top:30px">
	<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" onclick="editInfo(obj)">
		����������Ϣ
	</button>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">  
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
			        <option>OUT</option>
			        <option>IN</option>
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
		      <input type="text" class="form-control" placeholder="Number" id="number">
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
                <button type="button" class="btn btn-primary" onclick="update()" data-dismiss="modal">�ύ����</button>  
            </div>   
        </div>  
        <!-- /.modal-content -->  
    </div>  
    <!-- /.modal -->  
</div>  
<!-- ģ̬��Modal��end -->
<div>
	<div style="text-align:center;">
	�û�����
	    <font size="5" color="red"> <%=finList.size()%></font>����������
	</div>
    <table class="table table-hover">
         <tr bgcolor="CCCCCC" align="center">
             <td>�û���</td> <td>����</td><td>��ע</td><td>����</td> <td>ʱ��</td>
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
    //�ύ����  
    function update() {  
        //��ȡģ̬������  
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
     alert("���ݲ���ɹ�");
     window.location.href="main.jsp?username="+ <%=request.getParameter("username")%>;
    }
    
</script>
</html>