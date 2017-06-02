<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="today.muay.program.dao.StadiumDao"%>
<%@page import="today.muay.program.factory.ApplicationContextFactory"%>
<%
	StadiumDao stadiumDao = (StadiumDao) ApplicationContextFactory.getInstance().getBean("stadiumDao");
	String action = request.getParameter("action");
	String sid = request.getParameter("sid");
	String sname = request.getParameter("sname");
	if(action.equals("insert")){
		Number result = stadiumDao.insert(sid, sname);
		if(!result.equals("null") ) {
			out.print("Result = " + result);
		}
		out.print("\nEnd process insert stadium");
	}
%>