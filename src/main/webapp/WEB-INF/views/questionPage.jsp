<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/resources/images/favicon.ico"/>
<meta charset="ISO-8859-1">

<title>EasyLearn | Assessment</title>
<link rel="stylesheet"
	href="<c:url value="/resources/semantic-ui/semantic.min.css" />" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
	integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
	integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></script>

</head>
<body>
	<jsp:include page="navbar/qPageNavbar.jsp" />
	<div class="ui container">
		<h1 class="ui header centered" style="margin-top: 110px">${cname}
			Assessment</h1>
		<div class="ui divider"></div>
		<div class="ui grid centered">
			<div class="column fourteen wide">
				<form class="ui form" action="/quiz/scorecard" method="post">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<c:forEach var="question" items="${questions}">
						<input type="hidden" name="qid" value="${question.qid}" />
						<div class="grouped fields">
							<label for="${question.qqid}">${question.slno}).&nbsp;
								${question.question}</label>
								
						<!-- For questions having less than 4 options like True/False only not empty options will be shown -->
						<c:choose>
    						<c:when test="${not empty question.option1}">
							<div class="field">
								<div class="ui radio">
									<label> <input type="radio" name="${question.qqid}"
										value="A" id="${question.option1}">
										&ensp;${question.option1}
									</label>
								</div>
							</div>
							</c:when>
							</c:choose>
							
							<c:choose>
							<c:when test="${not empty question.option2}">
							<div class="field">
								<div class="ui radio">
									<label> <input type="radio" name="${question.qqid}"
										value="B" id="${question.option1}">
										&ensp;${question.option2}
									</label>
								</div>
							</div>
							</c:when>
							</c:choose>
							
							<c:choose>
							<c:when test="${not empty question.option3}">
							<div class="field">
								<div class="ui radio">
									<label> <input type="radio" name="${question.qqid}"
										value="C" id="${question.option1}">
										&ensp;${question.option3}
									</label>
								</div>
							</div>
							</c:when>
							</c:choose>
							
							<c:choose>
							<c:when test="${not empty question.option4}">
							<div class="field">
								<div class="ui radio">
									<label> <input type="radio" name="${question.qqid}"
										value="D" id="${question.option1}">
										&ensp;${question.option4}
									</label>
								</div>
							</div>
							</c:when>
							</c:choose>
							
						</div>
						<br />
					</c:forEach>
					<!--  <button class="ui button teal" data-toggle="modal" data-target="#testSubmitModal" type="button">Submit</button> -->
					<!-- Button trigger modal -->
					<button type="button" class="btn ui button teal"
						data-bs-toggle="modal" data-bs-target="#staticBackdrop">
						Submit</button>

					<!-- Modal -->
					<div class="modal fade" id="staticBackdrop"
						data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
						aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h1 style="font-family: inherit; color: #999999"
										class="modal-title" id="staticBackdropLabel">Are you
										sure?</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<h2 style="font-family: inherit; color: #999999">Do you
										want to submit the test now?</h2>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">No, Not Now</button>
									<button type="submit" class="btn btn-primary">Yes</button>
								</div>
							</div>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
	<footer>
		<script>
			//Code to replace the state of the question page so user can't visit coursepage after submitting the test and by going back to the previous page
			if (window.history.replaceState) {
				window.history.replaceState(null, null, window.location.href);
			}
		</script>
	</footer>
</body>
</html>