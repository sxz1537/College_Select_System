<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entity.College_inf"%>
<%@ page import="dao.CollegeDAO"%>
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
		<div class="center">
		
		<div style="margin-left: 100px ;margin-right: 100px">
			<table class="table table-striped" id="store">
				<thead>
					<tr>
						<th>大学ID</th>
						<th>名称</th>
						<th>录取分数线</th>
						<th>省份</th>
					</tr>
				</thead>
				<%
					CollegeDAO colldao = new CollegeDAO();
					int grade=Integer.parseInt(request.getParameter("grade"));
					String location=request.getParameter("location");
					ArrayList<College_inf> list = colldao.getCollege_infByGrade(grade);
					if (list != null && list.size() > 0) {
						for (int i = 0; i < list.size(); i++) {

							College_inf collf = list.get(i);
				%>
				<tbody>
					<tr>
						<td><%=collf.getCollege_id()%></td>
						<td><a href="college_details.jsp?college_id=<%=collf.getCollege_id()%>"><%=collf.getCollege_name()%></a></td>
						<td><%=collf.getCollege_grade()%></td>
						<td><%=collf.getCollege_location()%></td>
					</tr>
					<%
						}	
					}
					else{
						%>
							没有符合条件的结果，请重新查询<a href="choose_college.jsp">点击这里返回</a>
						<% 
					}
					%>
				</tbody>
			</table>

	</div>






		</div>
	</div>
	<div id="index_footer">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>

</body>
</html>