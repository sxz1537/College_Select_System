<%@page import="dao.CollegeDAO"%>
<%@page import="entity.College"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	CollegeDAO dao = new CollegeDAO();
	College coll=new College();
	request.setCharacterEncoding("utf-8");
	String action = request.getParameter("action");
	if ("del".equals(action)) //是删除吗？
	{
		int gid = Integer.parseInt(request.getParameter("gid"));
		dao.delCollege(gid);//
		response.sendRedirect("collegelist.jsp");
	} 
 	else if ("upd".equals(action)) {
		String cname=request.getParameter("cname");
		int cgrade=Integer.parseInt(request.getParameter("cgrade"));
		String clocation=request.getParameter("clocation");
		String cdesc=request.getParameter("cdesc");
		int gid = Integer.parseInt(request.getParameter("gid"));
		coll.setCollege_name(cname);
		coll.setCollege_grade(cgrade);
		coll.setCollege_location(clocation);
		coll.setCollege_desc(cdesc);
		coll.setCollege_id(gid);
		dao.updateCollege(coll);
		int id=dao.getCollegeIdByCollegeNane(cname);
		response.sendRedirect("college_upd.jsp?gid="+id);
	}  
	else if ("add".equals(action)){
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
	}
	else if ("addmajor".equals(action)){
		String cname=request.getParameter("cname");
		String mname=request.getParameter("mname");
		int mline=Integer.parseInt(request.getParameter("mline"));
		dao.addMajorToCollege(cname, mname,mline);
		int id=dao.getCollegeIdByCollegeNane(cname);
		response.sendRedirect("college_upd.jsp?gid="+id);
	}
	else if ("delmajor".equals(action)){
		String cname=request.getParameter("cname");
		String mname=request.getParameter("mname");
		dao.delMajorForCollege(cname, mname);
		int id=dao.getCollegeIdByCollegeNane(cname);
		response.sendRedirect("college_upd.jsp?gid="+id);
	}
	
%>
