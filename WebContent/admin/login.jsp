<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<body>
	<div style="margin: 0px auto;">
	<div class="container">
		<div class="row" >
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-primary">
					<div class="panel-body">
						<form action="CheckLogin.jsp" method="POST" name="loginForm">
							<div class="form-group">
								<label for="pwd" style="margin-top: 5px;" >用户名</label> <input type="password"
									class="form-control" name="pwd" placeholder="请输入管理员密码">
							</div>
							<button type="submit" class="btn btn-success" style="margin-top: 5px;" >登录</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>



</body>
</html>