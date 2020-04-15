<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
注册成功,3s后进入登录页面
<%
	response.setHeader("refresh","3,URL=login.jsp");
%>
</body>
</html>