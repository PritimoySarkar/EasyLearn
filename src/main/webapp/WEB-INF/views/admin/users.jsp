<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/images/favicon.ico" />
<meta charset="ISO-8859-1">

<title>User Performance | EasyLearn</title>
<link rel="stylesheet"
	href="<c:url value="/resources/semantic-ui/semantic.min.css" />" />

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.css"
	rel="stylesheet" />

<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<!-- Sweet Alert 2 CDN -->
<script src="/resources/sweetalert.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<!-- Canvas JS -->
<script src="https://canvasjs.com/assets/script/canvasjs.min.js">
	
</script>
<style>
.canvasjs-chart-credit {
	display: none;
}
</style>
</head>
<body>
	<jsp:include page="../navbar/adminNavbar.jsp" />
	<div class="ui container">
		<h1 class="ui header centered" style="margin-top: 110px">User's
			Performance</h1>
		<div class="ui divider"></div>
		<div class="ui grid centered">
			<div class="column sixteen wide computer only"
				style="text-align: center;">
				<div class="container">
				<table class="ui celled table table-hover" style="font-size: 16pt;text-align:center;">
					<thead>
						<tr>
							<th style="color:white;" class="bg-dark">Username</th>
							<th style="color:white;" class="bg-info">Total Registered Courses</th>
							<th style="color:white;" class="bg-dark">Total watched Lectures</th>
							<th style="color:white;" class="bg-success">Total Passed Tests</th>
							<th style="color:white;" class="bg-danger">Total Failed Tests</th>
						</tr>
					</thead>
					<tbody style="font-size:20pt;">
						<c:forEach var="user" items="${users}">
						<tr style="cursor:pointer;" onCLick="location.href='/admin/userProfile/${user.id}';">
							<td>${user.username}</td>
							<td class="table-info">${user.courses.size()}</td>
							<td>${user.lectures.size()}</td>
							<td id="passedCount_${user.id}" class="table-success"></td>
							<td id="failedCount_${user.id}" class="table-danger"></td>
						</tr>
						<script>
							function getPassedCount(uid){
								$.ajax({url:"http://localhost:8080/admin/users/passcount/"+uid, method:"GET"})
								.done(function(response){
									$('#passedCount_'+uid).html(response);
								})
							}
							function getFailedCount(uid){
								$.ajax({url:"http://localhost:8080/admin/users/failcount/"+uid, method:"GET"})
								.done(function(response){
									$('#failedCount_'+uid).html(response);
								})
							}
							getPassedCount(${user.id});
							getFailedCount(${user.id});
						</script>
						</c:forEach>
					</tbody>
				</table>
				</div>
			</div>
		</div>
	</div>
	<script>
		//Showing course depending on search result
		var ids = document.getElementsByClassName("ucid_div");
		var names = document.getElementsByClassName("cname_div");
		$('#search').on(
				"input",
				function() {
					var search = $('#search').val();
					console.log(search);
					for (let i = 0; i < names.length; i++) {
						if (names[i].innerHTML.toLowerCase().includes(
								search.toLowerCase())) {
							$('#status-div_' + ids[i].innerHTML).css("display",
									"block");
						} else {
							$('#status-div_' + ids[i].innerHTML).css("display",
									"none");
						}
					}
				});
	</script>
</body>
</html>