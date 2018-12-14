<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() 
	+ ":" + request.getServerPort() + request.getContextPath() + "/";
%>

<!DOCTYPE html >
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<base href="<%=basePath%>">

<title>login page</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">

	$(function(){
		
		validate("#usernameId","#msg");
		validate("#newusernameId","#newMsg");
		
		$("#saveBtn").click(function(){
			
			var username=$("#newusernameId").val();
			var password=$("#newpasswordId").val();
			var se_password=$("#newsepasswordId").val();
			window.location.href="/ssoLoginCheck_Domain/user?method=ssoUserRegister&username="
					+username+"&password="+password+"&se_password="+se_password;
		})
	})
	
	function validate(fieldId,msg){
			
			$(fieldId).blur(function(){
				//1.空字符串时不反应；
				var username=$(fieldId).val();
				if(username==""){
					return;
				}
				//2引入ajax请求:验证输入username是否存在服务器中？
				$.ajax({
					url:"/ssoLoginCheck_Domain/user?method=ssoUserValidate",
					data:{"username":username,"p":Math.random()},
					success:function(data){
						//alert(data);
						$(msg).html(data);
					},
					dataType:"text",
					error:function(){
						
						alert("confirm the servce is starting!");
					}
				})
			})
		}

</script>

</head>
<body >
	 
<div class="jumbotron">
  <h2 style="width:80%; position:relative;left:30%;"><small>欢迎您</small>&nbsp;我是登录页</h2>
  <div style="width:80%; position:relative;left:30%;">
  	<form action="/ssoLoginCheck_Domain/user?method=ssoUserLogin" method="POST" >
		<p>账号：<input type="text" name="username" id="usernameId"/><span id="msg"></span><p>
		<p>密码：<input type="password" name="password" /></p>
		<p><input type="hidden" name="goToUrl" value="${pageContext.request.contextPath}/jsp/index.jsp" /></p>
		<p><input type="reset" value="重置" class="btn btn-primary btn-lg"/> &nbsp;&nbsp;&nbsp;&nbsp;
		   <button name="register" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">注册</button> &nbsp;&nbsp;&nbsp;&nbsp;
		   <input type="submit" value="提交" class="btn btn-primary btn-lg" /> </p>
	</form>
   </div>
</div>
	
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">添加用户信息</h4>
      </div>
      <div class="modal-body">
       
      	<form action="" method="post" id="myForm">
		<p>请输入用户名：<input type="text" name="username" id="newusernameId"/><span id="newMsg"></span><p>
		<p>&nbsp;&nbsp;&nbsp;请输入密码：<input type="text" name="password" id="newpasswordId" class="onlyNum" /></p>
		<p>再次输入密码：<input type="text" name="se_password" id="newsepasswordId" class="onlyNum" /></p>
		<!--<p><button type="submit" id="submitBtn">提交表单</button></p>
		<p><input type="submit" id="submitBtn" value="提交表单"> </p>-->
		</form>
     
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" id="saveBtn" class="btn btn-primary" >保存</button>
      </div>
    </div>
  </div>
</div>	
	
</body>
</html>