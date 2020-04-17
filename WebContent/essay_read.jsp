<%@page import="entity.Essay"%>
<%@page import="dao.EssayDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entity.College"%>
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
						<th>文章ID</th>
						<th>文章标题</th>
						<th>文章链接</th>
						
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
	<div id="index_footer">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>

</body>
</html>