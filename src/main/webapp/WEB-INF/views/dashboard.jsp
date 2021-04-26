<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EasyLearn | Profile Dashboard</title>
<link rel="stylesheet"
	href="<c:url value="/resources/semantic-ui/semantic.min.css" />">
<style>
.home-bg {
	opacity: 0.2;
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
	<img class="home-bg" src="resources/images/home-bg.jpg" alt="" />
	<div class="ui container">

		<!-- <h1 id="easy-learn" class="ui header">Easy Learn</h1> -->
		<jsp:include page="navbar.jsp" />
		<h2 class="ui header" style="margin-top: 110px">User Profile</h2>
		<div class="ui divider"></div>
		<div class="ui grid computer only">
			<h1>User ID: ${userId }</h1>
			<div class="ui centered card">
				<div class="image">
					<img src="resources/images/profile.png">
				</div>
				<div class="content">
					<a class="header">${pageContext.request.userPrincipal.name}</a>
				</div>
			</div>
			<c:forEach var="course" items="${courses}">
				<div class="column five wide">
					<div class="ui card">
						<div class="image">
							<img
								src="https://cdn.pixabay.com/photo/2016/03/26/13/09/workspace-1280538_1280.jpg"
								alt="course image">
						</div>
						<div class="content">
							<div class="header">${course.cname}</div>
							<div class="description">${course.description}</div>
						</div>
						<div class="extra content">
							<a href="/lectures/${course.cid}/${course.cname}"
								class="ui button teal">Explore</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="ui grid mobile only">
			<c:forEach var="course" items="${courses}">
				<div class="column eight wide">
					<div class="ui card">
						<div class="image">
							<img
								src="https://cdn.pixabay.com/photo/2016/03/26/13/09/workspace-1280538_1280.jpg"
								alt="course image">
						</div>
						<div class="content">
							<div class="header">${course.cname}</div>
							<div class="description">${course.description}</div>
						</div>
						<div class="extra content">
							<button class="ui button teal">Explore</button>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="ui grid tablet only">
			<c:forEach var="course" items="${courses}">
				<div class="column eight wide">
					<div class="ui card">
						<div class="image">
							<img
								src="https://cdn.pixabay.com/photo/2016/03/26/13/09/workspace-1280538_1280.jpg"
								alt="course image">
						</div>
						<div class="content">
							<div class="header">${course.cname}</div>
							<div class="description">${course.description}</div>
						</div>
						<div class="extra content">
							<button class="ui button teal">Explore</button>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>