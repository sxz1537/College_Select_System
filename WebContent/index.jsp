<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>高考志愿填报模拟</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div class="top">
		<div class="t_logo">
		 <div>
			<a href="index.jsp"><img src="img/logo.jpg" alt="logo"></a>
		 </div>
		</div>
		<div class="t_menu">
		 <div>		
			<a href="choose_college.jsp" target="center_iframe">选学校 </a>
			<a href="college_list.jsp" target="center_iframe">大学排行榜</a>
			<a href="essay_read.jsp" target="center_iframe">高考文章阅读</a>			
		 </div>
		</div>	
		<div class="t_user">
		 <div>
			<% String username=(String)session.getAttribute("loginuser");
		if(username==null){
			%><a href="login.jsp" >登录</a>
			<a href="register.jsp" >注册</a>
			<% 
		}else{
				%>
			<a href="user_inf.jsp"><%=username %></a>
			<a href="logout.jsp" >退出</a>
				<% 
			}
  			  %>
		 </div>
		</div>	
</div>
<div class="center">
 	<iframe src="welcome.jsp"  frameborder="0" name="center_iframe" height="100%" width="100%">  
    </iframe>
</div>
<div id="footer">
 	<p>友情链接: <a>高考网</a><a>腾讯教育</a><a>学信网</a></p>
	<p>高考志愿模拟填报系统</p>
</div>



</body>
</html>