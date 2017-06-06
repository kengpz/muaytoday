<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../BS/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="../BS/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<form class="form-inline" method="POST">
			<div class="form-group">
				<label for="email">Stadium : </label>
				<input type="hidden" class="form-control" id="action" name="action" value="insert" /> 
				<input type="text" class="form-control" id="sname" name="sname">
			</div>
			<button type="submit" class="btn btn-default" style="margin-left: 15px;" id="add">Submit</button>
		</form>
	</div>

</body>
<script>
	$(document).ready(function() {
		$("#add").click(
			function() {
				$.ajax({
					url: '../service/stadium.jsp',
					data: { action:"insert",sname: $('#sname').val() },
					type: 'POST',
					success: function() { alert("Stadium added"); },
					error: function(event) { alert("Error : " + event); }
				});
			});
	});
</script>
</html>