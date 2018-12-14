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
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body >
	 
	 <h3>欢迎来到<span style="color:green;font-size:40px;font-weigth:bold;">ZSETBOMS</span>我是demo.jsp page!</h3>
	
</body>
</html>