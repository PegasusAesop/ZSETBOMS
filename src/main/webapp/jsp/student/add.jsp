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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>add page</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	
	$(function(){
		
		$("#submitBtn").click(function(){
			$("#myForm").submit();
		})
		
		
		$("#nameId").blur(function(){
			//1.空字符串时不反应；
			var name=$("#nameId").val();
			if(name==""){
				return;
			}
			//alert(111);
			//2引入ajax请求:验证输入username是否存在服务器中？
			$.ajax({
				
				url:"student.do?method=validateName",
				data:{"name":name,"p":Math.random()},
				success:function(data){
					//alert(data);
					$("#msg").html(data);
				},
				dataType:"text",
				error:function(){
					alert("confirm the servce is starting?");
				}
			})
		})

	})
	
	
</script>

</head>
<body >
	
	<h3>我是学生信息添加页--${username}</h3>
	<form action="student.do?method=addStud" method="post" id="myForm">
	<p>请输入姓名：<input type="text" name="name" id="nameId"/><span id="msg"></span><p>
	<p>请输入年龄：<input type="text" name="age" class="onlyNum" /></p>
	<!--<p><button type="submit" id="submitBtn">提交表单</button></p>-->
	<p><input type="submit" id="submitBtn" value="提交"> </p>
	</form>

</body>
</html>























