<!DOCTYPE html>
<html lang="th">
<head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
</head>
<body>
	<nav class="navbar navbar-default navbar-static-top"
		style="margin-top: 5px; margin-left: 5px; margin-right: 5px;">
		<div class="navbar-header">
			<button class="navbar-toggle collapsed" data-toggle="collapse"
				data-target="#nav1">

				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand active" href="index.jsp"><span
				class="glyphicon glyphicon-home"></span> Muay Report</a>
		</div>
		<div class="collapse navbar-collapse" id="nav1">
			<ul class="nav navbar-nav">

				<li class="nav navbar-nar myClass"><a href="" id="programe">ตารางมวยวันนี้</a>
				</li>
				<li class="nav navbar-nar myClass1"><a href="" id="rate">เรตมวย</a>
				</li>

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