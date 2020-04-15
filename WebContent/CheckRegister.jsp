<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/ccls?useSSL=false";
	String username = "root";
	String password = "123456";
	Connection conn = DriverManager.getConnection(url, username, password);
	request.setCharacterEncoding("utf-8");//设置编码方式，防止中文乱码
	String name = request.getParameter("name"); 
	String pwd =  request.getParameter("pwd"); 
	String sqlCheck = "select * from user where name = '" + name + "'";
	PreparedStatement pscheck=conn.prepareStatement(sqlCheck);
	ResultSet rs=pscheck.executeQuery();
	if(rs.next())
	{
		pscheck.close();
		response.sendRedirect("reg_failure.jsp");//重定向到登陆页面	
	}
	else{
		String sqlreg = "INSERT user(name,pwd) VALUES(?,?)";
		PreparedStatement psreg=conn.prepareStatement(sqlreg);
		psreg.setString(1, name);
		psreg.setString(2, pwd);
		int row = psreg.executeUpdate();
		response.sendRedirect("reg_success.jsp");//重定向到登陆页面
	}
%>