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
	Map<String, String> params = new HashMap<String, String>();
	params.put("STADIUM_ID", request.getParameter("stadiumId"));
	params.put("DATE_MATCH", request.getParameter("dateMatch"));
	params.put("CAMPAIGN_NAME", request.getParameter("campaignName"));
	params.put("PROMOTER_NAME", request.getParameter("promoterName"));
	params.put("TICKET_PRICE", request.getParameter("ticketPrice"));

	String json = null;
	if(action.equals("insert")){
		Number result = programDao.insert(params);
		json = JsonObjectMapper.getInstance().writeValueAsString(result);
	}else if (action.equals("delete")) {
		int id = Integer.parseInt(String.valueOf(request.getParameter("programid")));
		Number result = programDao.delete(id);
		json = JsonObjectMapper.getInstance().writeValueAsString(result);
	}else if (action.equals("getbydate")) {
		String date = request.getParameter("dateMatch");
		List result = programDao.getProgramByDate(date);
		json = JsonObjectMapper.getInstance().writeValueAsString(result);
	}else if (action.equals("getbyid")) {
		String id = request.getParameter("programid");
		List result = programDao.getProgramById(id);
		json = JsonObjectMapper.getInstance().writeValueAsString(result);
	}
%>
<%out.clear();%><%=json%>