<%@page import="entity.User"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		User u = new User();
		UserDAO uDao = new UserDAO();
		String name = (String) session.getAttribute("loginuser");
	%>

	<div style="margin: 200px 200px 400px 400px;">
							<form name="example"
								action="user_do.jsp?action=upd&gid=<%=name%>" method="post">
								<table class="table table-condensud">
									<thead>
										<tr>
											<th>更新用户信息</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>用户名</td>
											<td><%=name%></td>
										</tr>
										<tr>
											<td>用户密码</td>
											<td><input class="form-control" style="width: 400px;"
												type="text" name="upwd" value=""></td>
										</tr>
										<tr>
											<td><input class="btn btn-default" type="submit" value="修改"> 
												<input class="btn btn-default" type="reset" value="重置">
												<a class="btn btn-default" href="user_do.jsp?action=del&gid=<%=name%>">注销</a></td>
										</tr>
									</tbody>
								</table>
							</form>
		</div>





</body>
</html>