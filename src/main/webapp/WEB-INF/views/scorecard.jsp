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
	</div>
	<div class="container" style="background-color: white;border-radius:80px">
		<div class="card text-center" style="border-radius:80px;padding: 10px">
			<div class="card-header">Score Card</div>
			<div class="card-body">
				<h5 class="card-title">Quiz Score</h5>
				<h1 class="card-text">Your Score: ${score }</h1>

				<c:choose>
					<c:when test="${status.equals('Passed')}">
						<div class="row justify-content-center">
							<div class="card" style="width: 18rem;">
								<img class="card-img-top" src="/resources/images/passed.jpg" alt="Card image cap">
								<div class="card-body text-center">
									<h1>Passed</h1>
									<h4 class="card-text">Congratulation you have passed the test</h4>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="row justify-content-center">
							<div class="card" style="width: 18rem;margin: 10px">
								<img class="card-img-top" src="/resources/images/failed.png" alt="Card image cap">
								<div class="card-body text-center">
									<h1>Failed</h1>
									<h4 class="card-text">Sorry but you have to try again</h4>
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>

				<a href="/courses" class="btn btn-primary">All Courses</a>
			</div>
			<div class="card-footer text-muted">Thanks for taking the test</div>
		</div>
	</div>
	<script>
		$(".js-modal-btn").modalVideo();
	</script>
</body>
</html>