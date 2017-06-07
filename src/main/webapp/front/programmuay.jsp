<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.joda.time.format.DateTimeFormat"%>
<%@page import="org.joda.time.format.DateTimeFormatter"%>
<%@page import="today.muay.program.json.JsonObjectMapper"%>
<%@page import="today.muay.program.service.RestTemplateService"%>
<%@page import="today.muay.program.factory.ApplicationContextFactory"%>
<%
	RestTemplateService restTemplateService = (RestTemplateService) ApplicationContextFactory.getInstance().getBean("restTemplateService");
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
	Map params = new HashMap();
	List program = restTemplateService.getForList("/service/program.jsp?action=getbydate&dateMatch="+"2017-"+sdf.format(date), params);
	Map head = (Map) program.get(0);
	Calendar now = Calendar.getInstance();
	String[] iday = new String[]{"วันอาทิตย์", "วันจันทร์", "วันอังคาร", "วันพุธ", "วันพฤหัสบดี", "วันศุกร์", "วันเสาร์"};
	String[] imonth = new String[]{"ม.ค.", "ก.พ.", "มี.ย.", "เม.ย.", "พ.ค.", "มิ.ย", "ก.ค.", "ส.ค.", "ก.ย.", "ต.ค.", "พ.ย.", "ธ.ค."};
	int year = now.get(Calendar.YEAR) + 543;
	int month = now.get(Calendar.MONTH) + 1;
	int dayOfMonth = now.get(Calendar.DAY_OF_MONTH);
	String srtDate = iday[now.get(Calendar.DAY_OF_WEEK)] +"  ที่ "+ String.valueOf(dayOfMonth) +"  "+ imonth[month] +"  "+ String.valueOf(year);
	String stadium = String.valueOf(head.get("stadium_name"));
	String campaign = String.valueOf(head.get("campaign_name"));
	String ticket_price = String.valueOf(head.get("ticket_price"));
	String promoter_name = String.valueOf(head.get("promoter_name"));

	String resultHead1 = campaign + " เวทีมวย" + stadium + "  " + srtDate;
	String resultHead2 = " โปรโมเตอร์ \"" + promoter_name + "\" ราคาบัตร " + ticket_price;
	if (resultHead1 != null) {
		resultHead1 = new String(resultHead1.getBytes("ISO-8859-1"), "UTF-8");
	}
	if (resultHead2 != null) {
		resultHead2 = new String(resultHead2.getBytes("ISO-8859-1"), "UTF-8");
	}
%>
<html lang="th">
<head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
	<body>
		<div class="panel panel-primary col-md-*">
			<div class="panel-heading" style="font-size: 30px;padding-right:110px;"><%= resultHead1 %> <%= resultHead2 %></div>
			<table class="table table-responsive">
				<thead>
					<tr class="table-active" style="background-color: #A9A9A9;">
						<th >คู่ที่</th>
						<th>มุมแดง</th>
						<th>มุมน้ำเงิน</th>
						<th>พิกัด</th>
						<th>ทัศนะ</th>
						<th>ผลมวย</th>
						<th>หมายเหตุ</th>
					</tr>
				</thead>
				<tbody>
					<%for(int i = 0; i<program.size(); i++) { 
						Map result = (Map) program.get(i);
					%>
					<tr>
						<th scope="row"><%= result.get("sequence") %></th>
						<td id="redc"><font style="color:red;"><%= result.get("redname") %></font></td>
						<td id="bluec"><font style="color:blue;"><%= result.get("bluename") %></font></td>
						<td><%= result.get("weight") %></td>
						<td><%= result.get("reduce") %></td>
						<td><%= result.get("result") %></td>
						<td><%= result.get("remark") %></td>
					</tr>
					<%} %>
				</tbody>
			</table>
		</div>
	</body>
</html>