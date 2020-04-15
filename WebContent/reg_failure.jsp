<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
注册失败，请更换用户名重新注册,3s后进入注册页面
<%
	response.setHeader("refresh","3,URL=register.jsp");
%>

</body>
</html>