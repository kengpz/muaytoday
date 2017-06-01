<%@ page language="java" contentType="text/html; charset="utf-8"  pageEncoding="utf-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="today.muay.program.dao.StadiumDao"%>
<%@page import="today.muay.program.factory.ApplicationContextFactory"%>
<%
	StadiumDao stadiumDao = (StadiumDao) ApplicationContextFactory.getInstance().getBean("StadiumDao");
	String action = request.getParameter("action");
	String name = request.getParameter("stadiumname");
	if(action.equals("insert")){
		Number result = stadiumDao.insert(name);
		if(!result.equals("null") ) {
			out.print("Result = " + result);
		}
		out.print("\nEnd process insert stadium");
	}
%>