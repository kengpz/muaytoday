<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="today.muay.program.dao.ProgramDao"%>
<%@page import="today.muay.program.json.JsonObjectMapper"%>
<%@page import="today.muay.program.request.BufferedReaderRequest"%>
<%@page import="today.muay.program.factory.ApplicationContextFactory"%>
<%
	ProgramDao programDao = (ProgramDao) ApplicationContextFactory.getInstance().getBean("programDao");
	String action = request.getParameter("action");
	Map params = BufferedReaderRequest.getRequestMap(request);
	String program_id = request.getParameter("programid");

	String json = null;
	if(action.equals("insert")){
		Number result = programDao.insert(params);
		json = JsonObjectMapper.getInstance().writeValueAsString(result);
	}else if (action.equals("delete")) {
		int id = Integer.parseInt(program_id);
		Number result = programDao.delete(id);
		json = JsonObjectMapper.getInstance().writeValueAsString(result);
	}
%>
<%out.clear();%><%=json%>