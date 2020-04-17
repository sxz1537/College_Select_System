<%@page import="dao.CollegeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
CollegeDAO dao=new CollegeDAO();
String action=request.getParameter("action");
   if("del".equals(action)){
	   //是删除吗？
	  int gid=Integer.parseInt(request.getParameter("gid"));
	  dao.delCollege(gid);//
 	  }else if("add".equals(action)||"upd".equals(action)){
	%>
	<jsp:useBean id="coll" class="entity.College"></jsp:useBean>
	<jsp:setProperty property="*" name="coll"/>
	
	<% 
	
	String collName=coll.getCollege_name();
	if(collName==null){
		collName="";
		}
	coll.setCollege_name(new String(collName.getBytes("iso-8859-1") ,"utf-8"));
	
	coll.setCollege_grade(Integer.parseInt(request.getParameter("collGrade")));
	
	String collLocation=coll.getCollege_location();
	if(collLocation==null){
		collLocation="";
	}
	coll.setCollege_desc(
			new String(collLocation.getBytes("iso-8859-1"),"utf-8")
			);
	
	String collDesc=coll.getCollege_desc();
	if(collDesc==null){
		collDesc="";
	}
	coll.setCollege_desc(
			new String(collDesc.getBytes("iso-8859-1"),"utf-8")
			);
	
	if("add".equals(action)){
		dao.addCollege(coll);
	}else{
		dao.updateCollege(coll);
	}
   
   }
    response.sendRedirect("collegelist.jsp"); 
%>
