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
<title>后台</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<body > 
<% String adminuser=(String)session.getAttribute("adminuser");
		if(adminuser==null){
			%>请先登录,3s后进入登录页面
			<% response.setHeader("refresh","3,URL=login.jsp");
		}%>
<div >
		<form name="addForm" action="major_do.jsp?action=add" method="post">
			<table class="table table-condensmd"> 
				<tr>
					<td>专业名称</td>
					<td><input class="form-control" style="width:400px;" type="text" name="mname" ></td>
				</tr>
	
				<tr>
					<td></td>
					<td>
					<button class="btn btn-default"	 type="submit" 		onclick="return checkForm()" >添加</button>
					<input class="btn btn-default" 	 type="reset" 		value="重置">
					<input class="btn btn-default"	 type="button"		onclick="javascript:window.location.href='majorlist.jsp';" value="返回" />
					</td>
				</tr>

			</table>


		</form>

	</div>
	
	<script type="text/javascript">
        function checkForm() {
            var name = addForm.mname.value;
            var pwd = addForm.upwd.value;
            if (name == "" || name == null) {
                alert("请输入名");
                addForm.name.focus();
                return false;
            } else if (pwd == "" || pwd == null) {
                alert("请输入密码");
                addForm.pwd.focus();
                return false;
            } 
            return true;
        }
    </script>
	
	
	
</body>
</html>

