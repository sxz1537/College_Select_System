<%@page import="dao.RelationDAO"%>
<%@page import="dao.CollegeDAO"%>
<%@page import="entity.College"%>
<%@page import="dao.MajorDAO"%>
<%@page import="entity.Major"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String htmlData = request.getParameter("description") != null ? request.getParameter("description") : "";
%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理</title>
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
		String adminuser = (String) session.getAttribute("adminuser");
		if (adminuser == null) {
	%>请先登录,3s后进入登录页面
	<%
		response.setHeader("refresh", "3,URL=login.jsp");
		}
	%>
	<%
		College coll = new College();
		CollegeDAO cDao = new CollegeDAO();
		int id = Integer.parseInt(request.getParameter("gid"));
		coll.setCollege_id(cDao.getFullInfById(id).getCollege_id());
		coll.setCollege_grade(cDao.getFullInfById(id).getCollege_grade());
		coll.setCollege_name(cDao.getFullInfById(id).getCollege_name());
		coll.setCollege_desc(cDao.getFullInfById(id).getCollege_desc());
		coll.setCollege_location(cDao.getFullInfById(id).getCollege_location());
	%>
	<form name="example"
		action="college_do.jsp?action=upd&gid=<%=coll.getCollege_id()%>"
		method="post">
		<table class="table table-condensed">
			<thead>
				<tr>
					<th>更新大学信息</th>
				</tr>
			</thead>
			<tr>
				<td>学校名称</td>
				<td><input class="form-control" style="width: 400px;"
					type="text" name="cname" value="<%=coll.getCollege_name()%>"></td>
			</tr>
			<tr>
				<td>学校分数</td>
				<td><input class="form-control" style="width: 400px;"
					type="text" name="cgrade" value="<%=coll.getCollege_grade()%>"></td>
			</tr>
			<tr>
				<td>学校省份</td>
				<td><input class="form-control" style="width: 400px;"
					type="text" name="clocation"
					value="<%=coll.getCollege_location()%>"></td>
			</tr>
			<tr>
				<td>学校描述</td>
				<td><input class="form-control" style="width: 400px;"
					type="text" name="cdesc" value="<%=coll.getCollege_desc()%>"></td>
			</tr>
			<tr>
				<td></td>
				<td><input class="btn btn-default" type="submit" value="修改">
					<input class="btn btn-default" type="reset" value="重置"> <input
					class="btn btn-default" type="button"
					onclick="javascript:window.location.href='collegelist.jsp';"
					value="返回" /></td>
			</tr>
		</table>
	</form>
	<p>专业信息管理</p>
	<%
		RelationDAO md = new RelationDAO();
		ArrayList<Major> list = md.getAllMajorByCollegeName(coll.getCollege_name());
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				Major ml = list.get(i);
	%>
<!-- 	功能 删除专业 -->
	<form name="example1"    
		action="relation_do.jsp?action=delmajor&cname=<%=coll.getCollege_name()%>&mname=<%=ml.getMajor_name()%>"
		method="post">
		<div class="table-responsive">
			<table class="table text-nowrap">
				<tr>
					<td style="width: 200px;"><%=ml.getMajor_name()%></td>
					<td style="width: 200px;"><%=ml.getMajor_line()%></td>
					<td><input  class="btn btn-default" type="submit" value="删除" >
				</tr>
				<%
					}
					}
				%>
			</table>
		</div>
	</form>
<!-- 	功能 添加专业 -->
	<form name="example1"
		action="relation_do.jsp?action=addmajor&cname=<%=coll.getCollege_name()%>"
		method="post">
		<div class="table-responsive">
			<table class="table text-nowrap">
				<tr>
					<td>
					<select style="width: 200px;"name="mname">
							<%
								MajorDAO md2 = new MajorDAO();
								ArrayList<Major> list2 = md2.getAllMajor();
								if (list2 != null && list2.size() > 0) {
									for (int i = 0; i < list2.size(); i++) {
										Major m = list2.get(i);
							%>
							<option><%=m.getMajor_name()%></option>
							<%
								}
								}
							%>
					</select>
					</td>
					<td>
						<input  class="form-control" style="width: 200px;" type="text" name="mline" value="0">
					</td>
					<td>
						<input class="btn btn-default" type="submit" value="添加">
					</td>
				</tr>
			</table>
		</div>
	</form>
<!-- 	功能 修改专业分数线 -->
	<form name="example1"
		action="relation_do.jsp?action=updmajor&cname=<%=coll.getCollege_name()%>"
		method="post">
		<div class="table-responsive">
			<table class="table text-nowrap">
				<tr>
					<td><select style="width: 100px;" name="mname">
							<%
								RelationDAO rd1 = new RelationDAO();
								ArrayList<Major> list3 = rd1.getAllMajorByCollegeName(coll.getCollege_name());
								if (list3 != null && list3.size() > 0) {
									for (int i = 0; i < list3.size(); i++) {
										Major m = list3.get(i);
							%>
							<option><%=m.getMajor_name()%></option>
							<%
								}
								}
							%>
					</select></td>
					<td>
						<input class="form-control" style="width: 100px;" type="text" name="mline" value="0">
					</td>
					<td>
						<input class="btn btn-default" type="submit" value="修改">
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>
