<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/ccls?useSSL=false";
	String username = "root";
	String password = "123456";
	conn = DriverManager.getConnection(url, username, password);
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String sql = "SELECT *FROM user WHERE name ='" + name + "'AND pwd = '" + pwd + "'";
	ps = conn.prepareStatement(sql);
	rs = ps.executeQuery();
	if (rs.next()) {
		response.sendRedirect("./login_success.jsp");
	}else{
		response.sendRedirect("./login.jsp");
	}
%>