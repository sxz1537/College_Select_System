<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entity.College"%>
<%@ page import="dao.CollegeDAO"%>
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
		<div id="index_center">
		<div class="center">
		<div style="margin-left: 100px ;margin-right: 100px">
		<button class="btn btn-link"><a href="college_add.jsp">添加</a></button>
		<button class="btn btn-link"><a href="index.jsp">返回</a></button>
			<table class="table table-striped" id="store">
				<thead>
					<tr>
						<th>大学ID</th>
						<th>名称</th>
						<th>录取分数线</th>
						<th>省份</th>
						<th> </th>
						<th> </th>
					</tr>
				</thead>
				<!-- 循环部分开始 -->
				<%
					CollegeDAO colldao = new CollegeDAO();
					ArrayList<College> list = colldao.getAllCollege();
					if (list != null && list.size() > 0) {

						for (int i = 0; i < list.size(); i++) {
							int k=i+1;
							College collf = list.get(i);
				%>
				<tbody>
					<tr>
						<td><%=k%></td>
						<td><%=collf.getCollege_name()%></td>
						<td><%=collf.getCollege_grade()%></td>
						<td><%=collf.getCollege_location()%></td>
						<td class="btn btn-link"><a href="college_do.jsp?action=del&gid=<%=collf.getCollege_id()%>">删除</a></td>
						<td class="btn btn-link"><a href="college_upd.jsp?action=udp&gid=<%=collf.getCollege_id()%>">修改</a></td>
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