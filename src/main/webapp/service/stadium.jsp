<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="today.muay.program.json.JsonObjectMapper"%>
<%@page import="today.muay.program.dao.StadiumDao"%>
<%@page import="today.muay.program.factory.ApplicationContextFactory"%>
<%
	StadiumDao stadiumDao = (StadiumDao) ApplicationContextFactory.getInstance().getBean("stadiumDao");
	String action = request.getParameter("action");
	String sname = request.getParameter("sname");

	String json = null;
	if(action.equals("insert")){
		Number result = stadiumDao.insert(sname);
		json = JsonObjectMapper.getInstance().writeValueAsString(result);
	}
%>
<%out.clear();%><%=json%>