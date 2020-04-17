<%@page import="org.apache.tomcat.util.buf.UDecoder"%>
<%@page import="dao.UserDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name"); 
	String pwd =  request.getParameter("pwd"); 
	UserDAO ud=new UserDAO();
	boolean isSuccessReg = ud.UserReg(name, pwd);
	if(isSuccessReg)
	{	
		response.sendRedirect("reg_success.jsp");//重定向到登陆页面
	}
		
	else
	{
		response.sendRedirect("reg_failure.jsp");//重定向到登陆页面
	}
%>