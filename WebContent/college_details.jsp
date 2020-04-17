<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entity.College"%>
<%@ page import="dao.CollegeDAO" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>高考志愿填报模拟系统</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>
	<div id="index_top">
		<jsp:include page="top.jsp"></jsp:include>
	</div>
	<div id="index_center">
		<div class="center" style="margin-left: 200px;margin-right: 200px">

			<table id="table" class="table table-striped" style="table-layout: fixed;word-break:break-all;" >
				<thead>
					<tr>
						<th>大学ID</th>
						<th>名称</th>
						<th>录取分数线</th>
						<th>省份</th>
						<th>详细信息</th>
					</tr>
				</thead>
				
				<%
					CollegeDAO colldao = new CollegeDAO();
					College collfullinf = colldao.getFullInfById(Integer.parseInt(request.getParameter("college_id")));
					if (collfullinf != null) {
				%>
				<tbody>
					<tr>
						<td><%=collfullinf.getCollege_id()%></td>
						<td><%=collfullinf.getCollege_name()%></td>
						<td><%=collfullinf.getCollege_grade()%></td>
						<td><%=collfullinf.getCollege_location()%></td>
						<td><%=collfullinf.getCollege_desc()%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
	</div>
	<div id="index_footer">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>

</body>
</html>