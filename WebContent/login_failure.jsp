<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录失败</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<style type="text/css">
body {
	align-content: center;
	padding: 100px;
}
p{
	color: red;
}
</style>
</head>
<body>
	<p>登录失败，请检查用户名密码，2s后重新登录</p>
	<%
	response.setHeader("refresh","2,URL=login.jsp");
	%>
</body>
</html>
