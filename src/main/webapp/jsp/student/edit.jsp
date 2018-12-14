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
<title>edit page</title>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	
	$(function(){
		
		edit();
		
		function edit(){
			var id="${param.id}";
			
			$.ajax({
				
				url:"student.do?method=editStud&username=${username}",
				data:{"id":id,"p":Math.random()},
				dataType:"json",
				async:false,
				success:function(data){
					
					//alert(data);
					$("#idId").val(data.id);
					$("#nameId").val(data.name);
					$("#ageId").val(data.age);
				},
				error:function(){	
					alert("PLS CHECK SERVICE...");
				}
			})
		}
		//1验证name是否库中存在？
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
				async:true,
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
		
		
		$("#submitBtn").click(function(){
		
			$("#myForm").submit();
		})
	
	})
</script>
</head>
<body >
	
	<h3>我是学生信息修改页</h3>
	<form action="student.do?method=updateStud&username=${username }" method="post" id="myForm">
		<p><input type="hidden" name="id" id="idId" /></p>
		<p>请编辑姓名：<input type="text" name="name" id="nameId" /><span id="msg"></span><p>
		<p>请编辑年龄：<input type="text" name="age" id="ageId" /> </p>
		
		<p><button type="button" id="submitBtn">提交表单</button> </p>
		
	</form>
	
</body>
</html>























