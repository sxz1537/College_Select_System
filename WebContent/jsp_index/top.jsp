<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>  
<link rel="stylesheet" type="text/css" href="css/style_top.css">
<div class="top">
		<div class="t_logo">
		 <div>
			<a href="index.jsp"><img src="img/logo.jpg" alt="logo"></a>
		 </div>
		</div>
		<div class="t_menu">
		 <div>		
			<a href="choose_college.jsp">选学校 </a>
			<a href="choose_specialities.jsp">选专业</a>
			<a href="college_list.jsp">大学排行榜</a>
			<a href="specialities_list.jsp">专业排行榜</a>	
			<a href="essay_read.jsp">高考文章阅读</a>			
		 </div>
		</div>	
		<div class="t_user">
		 <div>
			<% String username=(String)session.getAttribute("loginuser");
		if(username==null){
			%><a href="login.jsp">登录</a>
			<a href="register.jsp">注册</a>
			<% 
		}else{
				%>
			<a href=""><%=username %></a>
			<a href="logout.jsp">退出</a>
				<% 
			}
  			  %>
		 </div>
		</div>	
	
</div>
