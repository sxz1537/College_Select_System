<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>高考志愿填报模拟</title>
</head>
<body>
注册成功,1s后进入登录页面
<%
	response.setHeader("refresh","1,URL=login.jsp");
%>
</body>
</html>