<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="shortcut icon" type="image/x-icon" href="/resources/images/favicon.ico"/>

<title>Scorecard | Easy Learn</title>
<link rel="stylesheet"
	href="<c:url value="/resources/semantic-ui/semantic.min.css" />" />

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></script>
<script type="text/javascript" >
   function preventBack(){window.history.forward();}
    setTimeout("preventBack()", 0);
    window.onunload=function(){null};
</script>
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<div class="ui container">
		<h1 class="ui header centered" style="margin-top: 110px">Scorecard</h1>
		<div class="ui divider"></div>
		<div class="ui grid centered">
			<div class="column ten wide computer only">
				<c:choose>
					<c:when test="${status.equals('Passed')}">
						<div class="ui visible green message">
							<h3>Congratulations, you have passed the test!</h3>
							<h4>Your Score: ${score}</h4>
						</div>
					</c:when>
					<c:otherwise>
						<div class="ui visible red message">
							<h3>You've not passed the test! Try taking the test again.</h3>
							<h4>Your Score: ${score}</h4>
						</div>
					</c:otherwise>
				</c:choose>
				<br /> <a class="ui button teal" href="/enrolledcourses"> <i
					class="angle left icon"></i>Back to Course
				</a>
			</div>
			<div class="column twelve wide tablet only">
				<c:choose>
					<c:when test="${status.equals('Passed')}">
						<div class="ui visible green message">
							<h3>Congratulations, you have passed the test!</h3>
							<h4>Your Score: ${score}</h4>
						</div>
					</c:when>
					<c:otherwise>
						<div class="ui visible red message">
							<h3>You've not passed the test! Try taking the test again.</h3>
							<h4>Your Score: ${score}</h4>
						</div>
					</c:otherwise>
				</c:choose>
				<br /> <br /> <a class="ui button teal" href="/enrolledcourses"> <i
					class="angle left icon"></i>Back to Course
				</a>
			</div>
			<div class="column sixteen wide mobile only">
				<c:choose>
					<c:when test="${status.equals('Passed')}">
						<div class="ui visible green message">
							<h3>Congratulations, you have passed the test!</h3>
							<h4>Your Score: ${score}</h4>
						</div>
					</c:when>
					<c:otherwise>
						<div class="ui visible red message">
							<h3>You've not passed the test! Try taking the test again.</h3>
							<h4>Your Score: ${score}</h4>
						</div>
					</c:otherwise>
				</c:choose>
				<br /> <br /> <a class="ui button teal" href="/enrolledcourses"> <i
					class="angle left icon"></i>Back to Course
				</a>
			</div>
		</div>
	</div>
	<script>
    window.onload = function() {
        history.replaceState("", "", "/the/result/page");
    }
</script>
</body>
</html>