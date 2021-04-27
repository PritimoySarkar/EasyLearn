<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="resources/images/favicon.ico"/>
<meta charset="ISO-8859-1">

<title>Profile | EasyLearn</title>
<link rel="stylesheet"
	href="<c:url value="/resources/semantic-ui/semantic.min.css" />" />

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></script>

</head>
<body>
	<jsp:include page="navbar.jsp" />
	<div class="ui container">
		<h1 class="ui header centered" style="margin-top: 110px">Dashboard</h1>
		<div class="ui divider"></div>
		<div class="ui grid centered">
			<div class="column ten wide computer only">
				<div class="ui centered card">
					<div class="image">
						<img src="resources/images/profile.png">
					</div>
					<div class="content">
						<a class="header">${pageContext.request.userPrincipal.name}</a>
					</div>
				</div>

				
			</div>

			<table class="ui celled table" style="font-size:16pt;">
				<thead>
					<tr>
						<th>Course</th>
						<th>Status</th>
						<th>Score</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="cs" items="${coursescore}">
						<c:choose>
							<c:when test="${cs.status.equals('Passed') }">
								<tr class="positive">
									<td>${cs.cname }</td>
									<td>${cs.status }</td>
									<td>${cs.score }&nbsp;%</td>
								</tr>
							</c:when>
							<c:when test="${cs.status.equals('Failed') }">
								<tr class="negative">
									<td>${cs.cname }</td>
									<td>${cs.status }</td>
									<td>${cs.score }&nbsp;%</td>
								</tr>
							</c:when>
							<c:when test="${cs.status.equals('Enrolled') }">
								<tr class="disabled">
									<td>${cs.cname }</td>
									<td>Assessment not attempted</td>
									<td>No Score to show</td>
								</tr>
							</c:when>
						</c:choose>

					</c:forEach>
				</tbody>
			</table>
			<br /> <br /> <a class="ui button teal" href="/enrolledcourses">
					<i class="angle left icon"></i>Enrolled Courses
				</a>
		</div>
	</div>
</body>
</html>