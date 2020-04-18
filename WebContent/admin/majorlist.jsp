<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entity.Major"%>
<%@ page import="dao.MajorDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>后台</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">

</head>
<body>
<% String adminuser=(String)session.getAttribute("adminuser");
		if(adminuser==null){
			%>请先登录,3s后进入登录页面
			<% response.setHeader("refresh","3,URL=login.jsp");
		}%>
		<div id="index_center">
		<div class="center">
		<div style="margin-left: 100px ;margin-right: 100px">
		<button class="btn btn-pwd"><a href="major_add.jsp">添加</a></button>
		<button class="btn btn-pwd"><a href="index.jsp">返回</a></button>
			<table class="table table-stripmd" id="store">
				<thead>
					<tr>
						<th>序号</th>
						<th>专业名称</th>
						<th> </th>
						<th> </th>
					</tr>
				</thead>
				<!-- 循环部分开始 -->
				<%
				MajorDAO md = new MajorDAO();
				ArrayList<Major> list = md.getAllMajor();
				if (list != null && list.size() > 0) {

					for (int i = 0; i < list.size(); i++) {
						int k=i+1;
						Major m = list.get(i);
				%>
				<tbody>
					<tr>
						<td><%=k%></td>

						<td><%=m.getMajor_name()%></td>
						<td class="btn btn-pwd"><a href="major_do.jsp?action=del&gid=<%=m.getMajor_name()%>">删除</a></td>
					<%-- 	<td class="btn btn-pwd"><a href="major_upd.jsp?action=udp&gid=<%=m.getMajor_id()%>">修改</a></td> --%>
					</tr>
					<%
						}
						}
					%>
				</tbody>
			</table>

	</div>
	</div>
	</div>
	
</body>
</html>