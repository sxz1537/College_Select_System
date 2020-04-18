<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>高考志愿填报模拟系统</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div id="index_full">
	<div id="index_top">
	<jsp:include page="top.jsp"></jsp:include>
	</div>
	<div id="index_center">
		<% String username=(String)session.getAttribute("loginuser");
		if(username==null){
			%>请先登录,3s后进入登录页面
			<% response.setHeader("refresh","3,URL=login.jsp");
		}%>
	</div>
	<div id="index_footer">
	<jsp:include page="footer.jsp"></jsp:include>
	</div>
</div>
</body>
</html>