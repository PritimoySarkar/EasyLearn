<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css"
	href="resource/modal-video.min.css">
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="resource/modal-video.js"></script>
<title>EasyLearn | All Courses</title>
</head>
<body
	style="background-image: url('/resources/images/bg.jpg'); background-blend-mode: multiply">
	<div style="text-align: center; background-color: #03d6ff">
		<h1
			style="background-color: white; color: #007bff; font-family: 'Brush Script MT', cursive; font-size: 60pt">Welcome
			to EasyLearn</h1>
		<hr>
		<h3
			style="font-family: Comic Sans MS, serif; color: #dd662a; font-size: 30pt">Quiz
			Questions</h3>
	</div>
	<div class="container" style="background-color: white;">
		<div class="row" style="margin: 20px">
			<form action="/quiz/scorecard" method="post" style="margin:10px">
				<br>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<c:forEach var="question" items="${questions}">
					<h6>${question.slno})&ensp;${question.question }</h6>
					<input type="hidden" name="qid" value="${question.qid }">
					&emsp;
					<label> 
						<input type="radio"
						id="${question.option1}" name="${question.qqid }"
						value="${question.option1}"> ${question.option1}
					</label>
					<br>
					
					&emsp;
					<label>
					<input type="radio" id="${question.option1}"
						name="${question.qqid }" value="${question.option2}">
					${question.option2}</label>
					<br>
					
					&emsp;
					<label>
					<input type="radio" id="${question.option1}"
						name="${question.qqid }" value="${question.option3}">
					${question.option3}</label>
					<br>
					
					&emsp;
					<label>
					<input type="radio" id="${question.option1}"
						name="${question.qqid }" value="${question.option4}">
					${question.option4}</label>
					<br>
					<br>
				</c:forEach>
				<input type="submit" value="Submit">
			</form>
		</div>
	</div>
	<script>
		$(".js-modal-btn").modalVideo();
	</script>
</body>
</html>