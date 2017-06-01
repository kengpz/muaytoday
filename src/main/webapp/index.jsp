<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="th">
<head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="BS/css/bootstrap.min.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="BS/js/bootstrap.min.js"></script>
<title>Muaythai Today</title>
<style>
#exprice {
	height: 60px;
	width: 85px;
}
</style>
</head>
<body>
	<jsp:include page="/front/header.jsp" />
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
				<jsp:include page="/front/programmuay.jsp" />
		</div>
		<div class="col-md-2"></div>

	<div class="separate"></div>
	</div>
</body>
</html>