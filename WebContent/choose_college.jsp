<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="entity.College_inf"%>
<%@ page import="dao.College_infDAO" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>高考志愿填报模拟系统</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<body>
	<div id="index_top">
	<jsp:include page="jsp_index/top.jsp"></jsp:include>
	</div>
	
	<%-- 	<% String username=(String)session.getAttribute("loginuser");
		if(username==null){
			 response.sendRedirect("login_failure2.jsp");
		}
		%>  --%>
		<!-- 登录后才可以使用功能 -->
		
	<div id="index_center">
	<div class="center">

<table class="table">
  <thead>
    <tr>
      <th>大学ID</th>
      <th>名称</th>
      <th>录取分数线</th>
      <th>城市</th>
    </tr>
  </thead>
  <!-- 循环部分开始 -->	
  <%
				College_infDAO colldao = new College_infDAO();
				ArrayList<College_inf> list = colldao.getAllCollege_inf();
				if(list!=null&&list.size()>0)
				{
					
				for(int i=0;i<list.size();i++){
					
				College_inf collf=list.get(i);
				%>
  
  
  <tbody>
    <tr>
      <td><%=collf.getCollege_id()%></td>
      <td><%=collf.getCollege_name() %></td>
      <td><%=collf.getCollege_grade() %></td>
      <td><%=collf.getCollege_location() %></td>
    </tr>
    <%
				} 
				}
				%>
  </tbody>
</table>

		
		
		

  		

				
  	        
  	      
			<!-- 循环部分结束 -->
		
		

		</div>
	</div>
<div id="index_footer">
	<jsp:include page="jsp_index/footer.jsp"></jsp:include>
	</div> 

</body>
</html>