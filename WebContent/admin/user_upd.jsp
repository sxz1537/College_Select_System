<%@page import="dao.UserDAO"%>
<%@page import="entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
<%
request.setCharacterEncoding("UTF-8");
String htmlData = request.getParameter("description") != null ? request.getParameter("description") : "";

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd 

">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<body >
		<% String adminuser=(String)session.getAttribute("adminuser");
		if(adminuser==null){
			%>请先登录,3s后进入登录页面
			<% response.setHeader("refresh","3,URL=login.jsp");
		}%>
	<%
		User u=new User();
		UserDAO uDao = new UserDAO();
		String name=request.getParameter("gid");
		u.setName(uDao.geteUserByName(name).getName());
		u.setPwd(uDao.geteUserByName(name).getPwd());

	%>
		<form name="example" action="user_do.jsp?action=upd&gid=<%=u.getName() %>" method="post">
			<table class="table table-condensud"> 
				<tr>
					<td>用户名</td>
					<td><input class="form-control" style="width:400px;" type="text" name="uname" value="<%=u.getName() %>" ></td>
				</tr>
				<tr>
					<td>用户密码</td>
					<td><input class="form-control" style="width:400px;" type="text" name="upwd" value="<%=u.getPwd()%>" ></td>
				</tr>


				
				<tr>
					<td></td>
					<td>
					<input class="btn btn-default"	 type="submit" 		value="修改">
					<input class="btn btn-default" 	 type="reset" 		value="重置">
					<input class="btn btn-default"	 type="button"		onclick="javascript:window.location.href='userlist.jsp';" value="返回" />
					</td>
				</tr>

			</table>
		</form>


</body>
</html>

