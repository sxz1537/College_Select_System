<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entity.College_inf"%>
<%@ page import="dao.College_infDAO" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>高考志愿填报模拟系统</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<body>
	<div id="index_top">
		<jsp:include page="jsp_index/top.jsp"></jsp:include>
	</div>
	<div id="index_center">
		<div class="center">

			<table class="table">
				<thead>
					<tr>
						<th>大学ID</th>
						<th>名称</th>
						<th>录取分数线</th>
						<th>城市</th>
					</tr>
				</thead>
				
				<%
					College_infDAO colldao = new College_infDAO();
					College_inf collfullinf = colldao.getFullInfById(Integer.parseInt(request.getParameter("college_id")));
					if (collfullinf != null) {
				%>
				<tbody>
					<tr>
						<td><%=collfullinf.getCollege_id()%></td>
						<td><%=collfullinf.getCollege_name()%></td>
						<td><%=collfullinf.getCollege_grade()%></td>
						<td><%=collfullinf.getCollege_location()%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
	</div>
	<div id="index_footer">
		<jsp:include page="jsp_index/footer.jsp"></jsp:include>
	</div>

</body>
</html>