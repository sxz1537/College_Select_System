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
<title>后台管理</title>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body  style=background:url(../images/htp.jpg)> <%=htmlData%>
<div class="goods_add">
		<form name="example" action="college_do.jsp?action=add" method="post">
			<table class="table table-condensed"> 
				<tr>
					<td>学校名称</td>
					<td><input class="form-control" style="width:400px;" type="text" name="cname" ></td>
				</tr>
				<tr>
					<td>学校分数</td>
					<td><input class="form-control" style="width:400px;" type="text" name="cgrade" ></td>
				</tr>
				<tr>
					<td>学校省份</td>
					<td><input class="form-control" style="width:400px;" type="text" name="clocation"  ></td>
				</tr>
				<tr>
					<td>学校描述</td>
					<td>
					<td><input class="form-control" style="width:400px;" type="text" name="cdesc"  ></td>
				</tr>
				
				<tr>
					<td></td>
					<td>
					<input class="btn btn-default"	 type="submit" 		value="添加">
					<input class="btn btn-default" 	 type="reset" 		value="重置">
					<input class="btn btn-default"	 type="button"		onclick="javascript:window.location.href='collegelist.jsp';" value="返回" />
					</td>
				</tr>

			</table>


		</form>

	</div>
</body>
</html>

