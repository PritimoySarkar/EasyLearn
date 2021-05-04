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

<title>Profile | EasyLearn</title>
<link rel="stylesheet"
	href="<c:url value="/resources/semantic-ui/semantic.min.css" />" />

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></script>
<style>
.home-bg {
	opacity: 0.1;
	position: absolute;
	width: 100%;
	background-size: cover;
}

#easy-learn {
	color: #181818;
	padding: 20px 20px 20px 0px;
	font-size: 4rem;
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<jsp:include page="../navbar/adminNavbar.jsp" />
	<div class="ui container">
		<h1 class="ui header centered" style="margin-top: 110px">Add new
			Question</h1>

		<form:form class="ui form" modelAttribute="newQuestion" method="POST"
			action="/admin/add/question/${cid}/${qid}">
			<spring:bind path="qid"><form:input type="hidden" path="qid" value="${qid}"></form:input></spring:bind>
			<div class="field">
				<spring:bind path="question">
					<label>Question</label>
					<form:input type="text" path="question" placeholder="Question" required="true"></form:input>
				</spring:bind>
			</div>

			<div class="two fields">
				<div class="field">
					<spring:bind path="option1">
						<label>First Option</label>
						<form:input type="text" path="option1" placeholder="Option 1" required="true"/>
					</spring:bind>
				</div>
				<div class="field">
					<spring:bind path="option2">
						<label>Second Option</label>
						<form:input type="text" path="option2" placeholder="Option 2" required="true"/>
					</spring:bind>
				</div>
			</div>
			<div class="two fields">
				<div class="field">
					<spring:bind path="option3">
						<label>Third Option</label>
						<form:input type="text" path="option3" placeholder="Option 3" />
					</spring:bind>
				</div>
				<div class="field">
					<spring:bind path="option4">
						<label>Fourth Option</label>
						<form:input type="text" path="option4" placeholder="Option 4" />
					</spring:bind>
				</div>
			</div>
			<div class="inline fields">
				<label>Select the correct option?</label>
				<div class="field">
					<div class="ui radio checkbox">
						<form:radiobutton path="answer" value="A" tabindex="0" required="true"/>
						<label>Option 1</label>
					</div>
				</div>
				<div class="field">
					<div class="ui radio checkbox">
						<form:radiobutton path="answer" value="B" tabindex="0" />
						<label>Option 2</label>
					</div>
				</div>
				<div class="field">
					<div class="ui radio checkbox">
						<form:radiobutton path="answer" value="C" tabindex="0"/>
						<label>Option 3</label>
					</div>
				</div>
				<div class="field">
					<div class="ui radio checkbox">
						<form:radiobutton path="answer" value="D" tabindex="0" />
						<label>Option 4</label>
					</div>
				</div>
			</div>
			<button class="ui teal button" type="submit">Add Question</button>
		</form:form>

		<div class="ui divider"></div>
		<h1 class="ui header centered" style="margin-top: 110px">All
			Question of ${quizName} Quiz</h1>
		<div class="ui grid centered">
			<div class="column ten wide computer only"></div>

			<table class="ui teal table"
				style="font-size: 12pt; text-align: center">
				<thead>
					<tr>
						<th>Question serial Number</th>
						<th>Question</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="question" items="${questions}">
						<tr>
							<td>${question.slno }</td>
							<td>${question.question }</td>
							<td>
								<form id="form${cs.cid}" method="POST" action="/">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" /> <input type="hidden" name="cid"
										value="${question.qqid }">
									<button type="submit" class="ui button teal">Edit
										Question</button>
								</form>
							</td>
							<td>
								<form id="form${cs.cid}" method="POST" action="/admin/remove/question/${cid}/${qid}">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" /> <input type="hidden" name="qqid"
										value="${question.qqid }">
									<button type="submit" class="ui button red">Delete Question</button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br /> <br /> <a class="ui button teal" href="/admin"> <i
				class="angle left icon"></i>Home
			</a>
		</div>
	</div>
	<script>
	//Code to replace the state of the questions page so user can't refresh the page and resubmit the form so there will be no duplicate entry
	if (window.history.replaceState) {
		window.history.replaceState(null, null, window.location.href);
	}
	</script>
</body>
</html>