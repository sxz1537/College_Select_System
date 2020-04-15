<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录成功！</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<body>
登录成功,3s后进入主页
<%
	response.setHeader("refresh","3,URL=index.jsp");
%>
</body>
</html>