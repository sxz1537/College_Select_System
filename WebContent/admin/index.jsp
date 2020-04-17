<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


				<div>
	<div class="container">
		<div class="row" >
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-primary">
					<div class="panel-body">
						<form action="CheckLogin.jsp" method="POST" name="loginForm">
							<div class="form-group">
								<label for="name" style="margin-top: 5px;" >用户名</label> <input type="text"
									class="form-control" name="name" placeholder="请输入用户名">
							</div>
							<div class="form-group">
								<label for="" style="margin-top: 5px;" >密码</label> <input type="password"
									class="form-control" name="pwd" placeholder="请输入密码">
							</div>
							<button type="submit" class="btn btn-success" style="margin-top: 5px;" 
								onclick="return checkForm()">登录</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>



</body>
</html>