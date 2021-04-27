<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/resources/images/favicon.ico"/>
<meta charset="ISO-8859-1">

<title>Page not found | EasyLearn</title>
<link rel="stylesheet"
	href="<c:url value="/resources/semantic-ui/semantic.min.css" />" />

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></script>
<style>
.ui.accordion.accordion .title {
	color: black !important;
}

.ui.accordion.accordion .title.active {
	color: teal !important;
}

.column.twelve.wide .assessment-para {
	margin-top: 5px;
	margin-left: 5px;
}
.ui.basic.button.tiny.sub-module-arrow:hover {
	color: teal !important;
}
</style>
</head>
<body>
	<jsp:include page="navbar/navbar.jsp" />
	<div class="ui container">
		<h1 class="ui header centered" style="margin-top: 110px">${cname}</h1>
		<div class="ui divider"></div>
		<div class="ui grid centered">
			
			<div class="ui basic modal" id="quiz-prompt">
				<div class="ui icon header">
					<i class="frown outline icon"></i><h1 style="font-size:30pt"> Looks like the entered url is wrong</h1>
				</div>
				<div class="actions">
					<div onclick="location.href='/dashboard'" class="ui basic inverted button"><h1 style="font-size:20pt">Dashboard</h1></div>
					<div class="ui teal ok inverted button"
						onclick="location.href='/'">
						<h1 style="font-size:20pt">Home<i class="angle right icon"></i></h1>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	<script>
		$('.ui.accordion').accordion();
		//$('.url.example .ui.embed').embed();
		$('.content .ui.embed').embed();
		function openModal() {
			$("#modal${lecture.slno}").modal("show");
		}
		function openQuizPrompt() {
			$("#quiz-prompt").modal({closable:false}).modal("show");
		}
		openQuizPrompt();
	</script>

</body>
</html>