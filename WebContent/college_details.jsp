<%@page import="dao.RelationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entity.College"%>
<%@ page import="entity.Major"%>
<%@ page import="dao.CollegeDAO"%>
<%@ page import="dao.MajorDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>高考志愿填报模拟</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>

<div class=table-responsive">
    <table class="table">
				<thead>
					<tr>
						<th>名称</th>
						<th>录取分数线</th>
						<th>省份</th>
						<th>专业信息</th>
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
						<td><%=collfullinf.getCollege_name()%></td>
						<td><%=collfullinf.getCollege_grade()%></td>
						<td><%=collfullinf.getCollege_location()%></td>
						<td>
							<table class="table text-nowrap">
								<thead>
									<tr>
										<td>专业名称</td><td>专业分数线</td>
									</tr>
								</thead>
								<%
								RelationDAO md=new RelationDAO();
								ArrayList<Major> list = md.getAllMajorByCollegeName(collfullinf.getCollege_name());
								if (list != null && list.size() > 0) 
								{
									for (int i = 0; i < list.size(); i++) {									
										Major ml = list.get(i);
								%>
								<tbody>
									<tr>
										<td><%=ml.getMajor_name() %></td><td><%=ml.getMajor_line() %></td>
									</tr>	
									<%
									}
									}
									%>
								</tbody>
							</table>
						</td>
						
						<td>
						
									<%=collfullinf.getCollege_desc()%>
								
						
						</td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			</div>
</body>
</html>