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

<title>index</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	
	//window.location.href="/ssoLoginCheck_Domain/user/check.do";
	
	$(function(){
		
		var m=200;
		var timd=setInterval(function(){
			
			m--;
			
			if(m==0){
				clearInterval(timd);
				
				window.location.href="/ssoLoginCheck_Domain/user?method=ssoUserLoginCheck";
			}
		})
	})
	
</script>

</head>
<body >
	 <div style="position:absolute;top:50%;left:50%;width:50%;height:50%;transform:translate(-50%,-50%);">
		<h3 style="color:pink;">WELCOME TO MY HOME!</h3>
	</div>
</body>
</html>