<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录案例</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/style_center.css">
</head>
<body>
	<div id="index_top">
	<jsp:include page="jsp_index/top.jsp"></jsp:include>
	</div>
	<div class="center">
	<div>
	<div class="container">
		<div class="row" style="margin-top: 30px">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-primary">
					<div class="panel-body">
						<form action="CheckLogin.jsp" method="POST" name="loginForm">
							<div class="form-group">
								<label for="name">用户名</label> <input type="text"
									class="form-control" name="name" placeholder="请输入用户名">
							</div>
							<div class="form-group">
								<label for="">密码</label> <input type="password"
									class="form-control" name="pwd" placeholder="请输入密码">
							</div>
							<button type="submit" class="btn btn-success"
								onclick="return checkForm()">登录</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	
	<div id="index_footer">
	<jsp:include page="jsp_index/footer.jsp"></jsp:include>
	</div>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous">
	
</script>
<script type="text/javascript">
	function checkForm() {
		var name = loginForm.name.value;
		var pwd = loginForm.pwd.value;
		//alert(name + pwd);
		if (name == "" || name == null) {
			alert("请输入用户名");
			loginForm.name.focus();
			return false;
		} else if (pwd == "" || pwd == null) {
			alert("请输入密码");
			loginForm.pwd.focus();
			return false;
		}
		return true;
	}
</script>
</html>