<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="http://cdn.bootstrap.com/bootstrap/css/bootstrap.3.3.4.min.css">
    <link rel="stylesheet" href="./css/base.css">
    <link rel="stylesheet" href="./css/jquery-kq-nav-left.css">
    <script src="https://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
</head>

<body>
		<% String adminuser=(String)session.getAttribute("adminuser");
		if(adminuser==null){
			%>请先登录,3s后进入登录页面
			<% response.setHeader("refresh","3,URL=login.jsp");
		}%>
    <ul class="nav-left-container">
        <li>
            <!-- li的class为active表示点击选中 -->
            <a href="#">
                <!-- aria-hidden字符串。可选值为true和false,true表示元素隐藏(不可见)，false表示元素可见。 -->
                <span class="glyphicon glyphicon-home f12" aria-hidden="true"></span>
                <span>用户管理</span>
                <span class="glyphicon glyphicon-menu-right f12 fr" aria-hidden="true"></span>
            </a>
            <ul class="nav-left-container-small">
                <!-- aria-expanded表示展开状态。默认为undefined, 表示当前展开状态未知。其它可选值：true表示元素是展开的；false表示元素不是展开的。 -->
                <li>
                    <a class="J_menuItem" href="userlist.jsp">用户列表</a>
                </li>
                <li>
                    <a class="J_menuItem" href="user_add.jsp">添加用户</a>
                </li>
            </ul>
        </li>
        <li>
            <a href="#">
                <span class="glyphicon glyphicon-calendar f12" aria-hidden="true"></span>
                <span>大学管理</span>
                <span class="glyphicon glyphicon-menu-right f12 fr" aria-hidden="true"></span>
            </a>

            <ul class="nav-left-container-small">
                <li>
                    <a class="J_menuItem" href="collegelist.jsp">大学列表</a>
                </li>
                <li>
                    <a class="J_menuItem" href="college_add.jsp">添加大学</a>
                </li>
            </ul>
        </li>
        <li>
            <a href="#">
                <span class="glyphicon glyphicon-edit f12" aria-hidden="true"></span>
                <span>专业管理</span>
                <span class="glyphicon glyphicon-menu-right f12 fr" aria-hidden="true"></span>
            </a>
            <ul class="nav-left-container-small">
                <li>
                    <a class="J_menuItem" href="majorlist.jsp">专业列表</a>
                </li>
                <li>
                    <a class="J_menuItem" href="major_add.jsp">添加专业</a>
                </li>
            </ul>
        </li>
        <li>
            <a href="#">
                <span class="glyphicon glyphicon-duplicate f12" aria-hidden="true"></span>
                <span>文章管理</span>
                <span class="glyphicon glyphicon-menu-right f12 fr" aria-hidden="true"></span>
            </a>
            <ul class="nav-left-container-small">
                <li>
                    <a class="J_menuItem" href="essaylist.jsp">文章列表</a>
                </li>
                <li>
                    <a class="J_menuItem" href="essay_add.jsp">添加文章</a>
                </li>
            </ul>
        </li>
        <li>
            <a href="#">
                <span class="glyphicon glyphicon-hourglass" aria-hidden="true"></span>
                <span>更多操作</span>
                <span class="glyphicon glyphicon-menu-right f12 fr" aria-hidden="true"></span>
            </a>
            <ul class="nav-left-container-small">
                <li>
                    <a class="J_menuItem" href="logout.jsp">退出登录</a>
                </li>
                <li>
                    <a class="J_menuItem" href="../index.jsp">回到前台</a>
                </li>
            </ul>
        </li>
    </ul>
    <script>
        $('.nav-left-container').on('click', 'li', function () {
            $(this).find('.glyphicon-menu-right').removeClass('glyphicon-menu-right').addClass('glyphicon-menu-down');
            $(this).addClass('active').children('.nav-left-container-small').slideDown()

            $(this).siblings().removeClass('active').children('.nav-left-container-small').slideUp()
            $(this).siblings().find('.glyphicon-menu-down').removeClass('glyphicon-menu-down').addClass('glyphicon-menu-right ');
        })
    </script>
</body>

</html>