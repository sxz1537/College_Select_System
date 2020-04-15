<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册</title>
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
                        <form action="CheckRegister.jsp" method="POST" name="registerForm">
                            <div class="form-group">
                                <label for="name">用户名</label> <input type="text"
                                    class="form-control" name="name" placeholder="请输入用户名"
                                    autofocus="autofocus">
                            </div>
                            <div class="form-group">
                                <label for="">密码</label> <input type="password"
                                    class="form-control" name="pwd" placeholder="请输入密码">
                            </div>
                            <div class="form-group">
                                <label for="">重复密码</label> <input type="password"
                                    class="form-control" name="repwd" placeholder="请重复密码">
                            </div>
                            <button type="submit" class="btn btn-primary"
                                onclick="return checkForm()">注册</button>
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
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
    <script type="text/javascript">
        function checkForm() {
            var name = registerForm.name.value;
            var pwd = registerForm.pwd.value;
            var repwd = registerForm.repwd.value;
            //alert(name + pwd + repwd);
            if (name == "" || name == null) {
                alert("请输入用户名");
                registerForm.name.focus();
                return false;
            } else if (pwd == "" || pwd == null) {
                alert("请输入密码");
                registerForm.pwd.focus();
                return false;
            } else if (repwd == "" || repwd == null) {
                alert("请输入重复密码");
                registerForm.repwd.focus();
                return false;
            }else if(pwd!=repwd){
                alert("两次密码输入不一致，请重新输入!");
                registerForm.repwd.focus();
                return false;
            }
            alert('注册成功！');
            return true;
        }
    </script>
</body>
</html>
