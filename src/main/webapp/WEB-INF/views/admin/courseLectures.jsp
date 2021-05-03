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
		<h1 class="ui header centered" style="margin-top: 110px">Add new lecture</h1>
		
		<form:form class="ui form" modelAttribute="newLecture" method="POST" action="/admin/add/lecture">
			<div class="field">
				<spring:bind path="cid">
				<form:input type="hidden" path="cid" value="${cid}"></form:input>
				</spring:bind>
				<spring:bind path="lname">
				<label>Lecture Name</label> <form:input type="text" path="lname"
					placeholder="Name of the Lecture"></form:input>
				</spring:bind>
			</div>
			<div class="field">
				<spring:bind path="url">
				<label>Lecture URL</label> <form:input type="text" path="url"
					placeholder="URL of the video"></form:input>
				</spring:bind>
			</div>
			<button class="ui teal button" type="submit">Add Course</button>
		</form:form>
	
		<div class="ui divider"></div>
		<h1 class="ui header centered" style="margin-top: 110px">All
			lectures of ${courseName} Course</h1>
		<div class="ui grid centered">
			<div class="column ten wide computer only"></div>

			<table class="ui teal table" style="font-size: 16pt;text-align:center">
				<thead>
					<tr>
						<th>Lecture serial Number</th>
						<th>Lecture Name</th>
						<th>Edit</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="lec" items="${lectures}">
						<tr>
							<td>${lec.slno }</td>
							<td>${lec.lname }</td>
							<td>
							<form id="form${cs.cid}" method="POST" action="/">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<input type="hidden" name="cid" value="${lec.lid }">
							<button type="submit" class="ui button teal">Edit Lecture</button>
							</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br /> <br /> <a class="ui button teal" href="/admin">
				<i class="angle left icon"></i>Home
			</a>
		</div>
	</div>
</body>
</html>