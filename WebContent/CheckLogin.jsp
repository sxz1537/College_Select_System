<%@page import="dao.UserDAO"%>
<%@page import="entity.User"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String name=request.getParameter("name");
String pwd=request.getParameter("pwd");
UserDAO ud=new UserDAO();
Boolean isLogin=ud.CheckUser(name, pwd);
if (isLogin) {
	session.setAttribute("loginuser", name); //设置session
	response.sendRedirect("login_success.jsp");
}else{
	response.sendRedirect("login_failure.jsp");
}
%>