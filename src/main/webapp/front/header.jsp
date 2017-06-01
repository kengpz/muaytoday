<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="th">
<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="BS/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="BS/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-default navbar-static-top">
		<div class="navbar-header" style="margin-left:150px;">
			<button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav1">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand active" href="index.jsp"><span class="glyphicon glyphicon-home"></span> Muay Report</a>
		</div>
		<div class="collapse navbar-collapse" id="nav1">
			<ul class="nav navbar-nav">
				<li class="nav navbar-nar myClass"><a href="" id="programe">โปรแกรมมวยตู้</a></li>
				<li class="nav navbar-nar myClass1"><a href="" id="rate">เรตมวย</a></li>
			</ul>
		</div>
	</nav>
</body>
<script>
$( ".myClass").mouseover(function(){
    $( ".myClass").css("background-color", "gray");
});
$(".myClass").mouseout(function(){
    $(".myClass").css("background-color", "#f8f8f8");
});
$( ".myClass1").mouseover(function(){
    $( ".myClass1").css("background-color", "gray");
});
$(".myClass1").mouseout(function(){
    $(".myClass1").css("background-color", "#f8f8f8");
});
</script>
</html>