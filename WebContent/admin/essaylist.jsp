<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entity.Essay"%>
<%@ page import="dao.EssayDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>后台</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>

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
		<button class="btn btn-link"><a href="essay_add.jsp">添加</a></button>
		<button class="btn btn-link"><a href="index.jsp">返回</a></button>
			<table class="table table-striped" id="store">
				<thead>
					<tr>
						<th>文章ID</th>
						<th>文章标题</th>
						<th>文章链接</th>
						<th> </th>
						<th> </th>
					</tr>
				</thead>
				<!-- 循环部分开始 -->
				<%
				EssayDAO ed = new EssayDAO();
				ArrayList<Essay> list = ed.getAllEssay();
				if (list != null && list.size() > 0) {

					for (int i = 0; i < list.size(); i++) {
						int k=i+1;
						Essay es = list.get(i);
				%>
				<tbody>
					<tr>
						<td><%=k%></td>
						<td><%=es.getEssay_title()%></td>
						<td><a href="<%=es.getEssay_link()%>" target="_blank">点击跳转</a></td>
						<td class="btn btn-link"><a href="essay_do.jsp?action=del&gid=<%=es.getEssay_id()%>">删除</a></td>
						<td class="btn btn-link"><a href="essay_upd.jsp?action=udp&gid=<%=es.getEssay_id()%>">修改</a></td>
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