<%@page import="entity.College"%>
<%@page import="dao.CollegeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
CollegeDAO dao=new CollegeDAO();
College coll=new College();
request.setCharacterEncoding("utf-8");
String cname=request.getParameter("cname");
int cgrade=Integer.parseInt(request.getParameter("cgrade"));
String clocation=request.getParameter("clocation");
String cdesc=request.getParameter("cdesc");
coll.setCollege_name(cname);
coll.setCollege_grade(cgrade);
coll.setCollege_location(clocation);
coll.setCollege_desc(cdesc);
dao.addCollege(coll);
response.sendRedirect("collegelist.jsp"); 
%>
