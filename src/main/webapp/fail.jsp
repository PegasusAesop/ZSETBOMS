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
<meta http-equiv="refresh" content="3;/ZSETBOMS/index.html"/>
<base href="<%=basePath%>">

<title>login page</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
//*****************1以下为原生javascript*************************	
// 	function countDown(){
// 		window.setInterval("myMath()",1000);
// 	}
// 	function myMath(){
// 		document.getElementById("msg").innerHTML=document.getElementById("msg").innerHTML-1;
// 	}
//*****************2以下为jQuery*************************	

	$(function(){
		
		countDown();
		function countDown(){	
			window.setInterval("myMath()",1000);
		}
	})
	//1.此函数不能放在启动的jQurey方法中；
	function myMath(){	
		$("#msg").html($("#msg").html()-1);
	}

</script>

</head>
<body onload="countDown()">
	 
	<h3 style="margin:1% 2%;color:green;">登录失败，<span id="msg" style="color:#f40;font-size:40px;font-family:arial;">3</span>秒钟后重新进入登录页面！</h3>
	
</body>
</html>