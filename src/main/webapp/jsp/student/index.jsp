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
<title>listAll page</title>

<link rel="stylesheet" href="css/bootstrap.min.css" />
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script> 

<style type="text/css">
	table{
		width:100%;
		margin:0 auto;
		border-collapse:collapse;
		color:#424242;
		cellspacing:10px;
		cellpadding:12px;}
	thead,td{
		border:2px solid #ccc;
		padding:10px;
		text-align:left;}

	.right{
		position:absolute;
		right:0;
		width:15%;
		margin-left:2%;
		margin-top:1%;
		/* height:100px; 
		background-color:pink;*/
		opacity:1;}
	
	.left{
		/* height:50px; */
		margin-right:15%;
		margin-left:2%;
		margin-top:1%; 
		/*background-color:pink;
		 transparent:50% */}
		 
	.nav{
		list-style:none;
		margin:0;
		font-size:16px;
		/*width:200px;
		height:200px;
		background-color:#999;
		border:1px solid #f40;*/}
	.nav .list-item{
		/* float:left; */
		margin:10px 5px;
		height:40px;
		line-height:30px;
		/* border:1px solid black; */}
	
	a{
		text-decoration:none;}
	
	.nav .list-item a{
		padding:0 10px;
		color:#f40;
		font-weight:bold;
		height:30px;
		display:inline-block;
		border-radius:15px;}
		
	.nav .list-item a:hover{
		color:#fff;
		background-color:#f40;}	 
</style>
<script type="text/javascript">

	$(function(){
		
		$("#saveBtn").click(function(){
			//alert(1111);
			$("#myForm").submit();
		})
		
		//input标签方式链接转 发；
		$("#addBtn").click(function(){
			
			window.location.href="${pageContext.request.contextPath}/jsp/student/add.jsp";
		})
		
		//a标签方式链接转发；
		$("#clickStud").click(function(){
			
			window.location.href="${pageContext.request.contextPath}/jsp/student/add.jsp";
		})
		
		$("#doLogout").click(function(){
			//访问LogoutServlet注销当前登录的用户
			window.location.href="${pageContext.request.contextPath}/user/login.do?method=logoutUser";
		})
		
		//1.清空页面上元素tBody内容 ；
		$("#tBody").html("");
		$.ajax({
			url:"student.do?method=listAll&username=${username}",//2请求路径；
			//data:"random="+Math.random(),	//3参数 
			data:{"p":Math.random()}, //json格式传参给servlet;
			type:"get",	//4请求方式：post/get
			//async:true,	//ajax模式;默认异步；
			dataType:"json", 	//5返回值的类型：text:普通文本：json:json文本
			success:function(data){ 	//6回调函数 data:返回值；		
				//$("#msg").html(data.s2.id+data.s2.name+data.s2.age);
				//json取值方式：
				//alert(data);
				var i=1;
				$(data.sList).each(function(){
					//1每一个json用this来表示；
					$("#tBody").append("<tr><td style='text-align:center;'><input  type='checkbox' style='zoom:150%;' name='mycc' value='"+this.id+"'/></td><td>"
							+(i++)+"</td><td>"+this.id
							+"</td><td>"+this.name
							+"</td><td>"+this.age
							+"</td><td><a href='jsp/student/edit.jsp?username=${username}&id="+this.id
							+"'>修改</a>||<a onclick='return foo();' href='student.do?method=deleteStud&username=${username}&id="+this.id
							+"'>删除</a></td></tr>");
				})
			},
			error:function(){
				alert("请确定服务器是否真的打开了哦！");
			}
		})
		
		//1多条删除操作
		$("#delItems").click(function(){
			
			// 2判断是否至少选择一项 
			var checkedNum = $("input[name='mycc']:checked").length; 
			if(checkedNum == 0) { 
				alert("您一项都没有选哦."); 
				return; 
			}
			if(confirm("确定要删除所选项目？")){
				var arr = new Array();
				$("input[name='mycc']:checked").each(function(i){
					
					arr.push($(this).val());
				});
				
				//console.log(arr);
				//alert("arr:"+arr)
				//将checkbox选中的项通过ajax方式提交并获得反应；
				$.ajax({
					type:"post",
					url:"student.do?method=deleteMultiStuds&username=${username}",
					//将获得的序号数组传递到后台；
					data:{"delItems":arr.toString()},
					dataType:"text",
					success:function(data){
						//alert(data);
						//$("input[name='mycc']:checked").attr("checked",false);
						window.location.reload();
					},
					error:function(){
						alert("PL check service.");
					}
				})
			}
			else{
				//1确定误操作后，将选中的恢复，并重刷下页面！
				$("input[name='mycc']:checked").attr("checked",false);
				window.location.reload();
			}
		})
	})
	
	function foo(){
		if(confirm("不可逆转的行为！确定真的要删除吗？")){
			return true;
		}
		return false;
	}

</script>

</head>
<body >
	
	<h2 align="center" style="color:green;">学生信息管理系统</h2>

	<div class="right">
	<h3 style="display:inline;"> <input type="button" class="btn btn-success" value="点击我离去" id="doLogout" ></h3>
	</div>
	<div class="left">
	<h3>欢迎你：<font style="color:#999;">${username}</font></h3>
	</div>

	
<div class="right" style="right:2%;width:88%;">
	<table >
		<tr >
			<td style="text-align:left;">
			<!--  <button id="addBtn">添加学员</button>&nbsp;&nbsp;
			 Button trigger modal -->
			<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
			 添加学员
			</button>
			
			<button type="button" id="delItems" class="btn btn-danger btn-lg" data-toggle="modal" data-target="" style="margin-left:80%">
			 多条删除
			</button>
			</td>
		</tr>
	</table >
	<table class="table table-hover" style="font-size:18px;">
		<thead>
		<tr>
			<!--  <td><input type="checkbox" id="qx" /></td>-->
			<td>海选</td>
			<td>序号</td>
			<td>编号</td>
			<td>姓名</td>
			<td>年龄</td>
			<td>操作</td>
		</tr>
		</thead>

		<tbody id="tBody"></tbody>
	</table>
</div>

<div class="left" style="margin-right:88%;margin-left:2%;">
	
	<ul class="nav" >
		<li class="list-item"><a id="clickStud" href="javascript:void(0)" >学生信息添加</a></li>
		<li class="list-item"><a id="clickMaterial" href="javascript:void(0)">材料信息添加</a></li>
		<li class="list-item"><a id="clickCourse" href="javascript:void(0)">课程信息添加</a></li>
		<li class="list-item"><a id="clickPart" href="javascript:void(0)">零件信息添加</a></li>
		<li class="list-item"><a id="clickProduct" href="javascript:void(0)">产品信息添加</a></li>
		<li class="list-item"><a id="clickCustom" href="javascript:void(0)">客户信息添加</a></li>
	</ul>	
</div>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">添加学生信息</h4>
      </div>
      <div class="modal-body">
       
      	<form action="student.do?method=addStud" method="post" id="myForm">
		<p>请输入姓名：<input type="text" name="name" id="nameId"/><span id="msg"></span><p>
		<p>请输入年龄：<input type="text" name="age" class="onlyNum" /></p>
		<!--<p><button type="submit" id="submitBtn">提交表单</button></p>
		<p><input type="submit" id="submitBtn" value="提交表单"> </p>-->
		</form>
     
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" id="saveBtn" class="btn btn-primary">保存</button>
      </div>
    </div>
  </div>
</div>


</body>
</html>
