<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/images/favicon.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Courses | EasyLearn</title>
<link rel="stylesheet"
	href="<c:url value="/resources/semantic-ui/semantic.min.css" />">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
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

	<img class="home-bg" src="/resources/images/home-bg.jpg" alt="" />
	<div class="ui container">

		<jsp:include page="../navbar/adminNavbar.jsp" />

		<!-- Checking if the not enrolled course list is not empty to print the not enrolled course heading -->
		<h1 class="ui header" style="padding-top:30px;">Admin Home</h1>
		<!-- All Remaining Not Enrolled Courses -->
		<div class="ui divider"></div>
		<div class="ui grid computer only">
			<div class="row">
				<div class="col-sm-4" style="margin-top:20px;margin-bottom:20px;">
					<div onclick="location.href='/admin/courses';" class="card text-white bg-success mb-3"
						style="max-width: 18rem;">
						<div class="card-header" style="cursor:pointer;">Course</div>
						<div class="card-body" style="cursor:pointer;">
							<h5 class="card-title">Add / Remove Course</h5>
							<p class="card-text">Add new course or remove existing courses.</p>
						</div>
					</div>
				</div>
				<div class="col-sm-4" style="margin-top:20px;margin-bottom:20px;">
					<div onclick="location.href='/admin/quizzes';" class="card text-white bg-primary mb-3"
						style="max-width: 18rem;">
						<div class="card-header" style="cursor:pointer;">Quiz</div>
						<div class="card-body" style="cursor:pointer;">
							<h5 class="card-title">Add Quiz</h5>
							<p class="card-text">Add questions to existing Quiz or create quiz to insert questions</p>
						</div>
					</div>
				</div>
				<div class="col-sm-4" style="margin-top:20px;margin-bottom:20px;">
					<div onclick="location.href='/admin/lectures';" class="card text-white bg-secondary mb-3"
						style="max-width: 18rem;">
						<div class="card-header" style="cursor:pointer;">Lecture</div>
						<div class="card-body" style="cursor:pointer;">
							<h5 class="card-title">Add / Edit Lecture</h5>
							<p class="card-text">Add New Lecture or remove existing Lecture form a course.</p>
						</div>
					</div>
				</div>
				<div class="col-sm-4" style="margin-top:20px;margin-bottom:20px;">
					<div class="card text-white bg-info mb-3"
						style="max-width: 18rem;">
						<div class="card-header" style="cursor:pointer;">Add Admin</div>
						<div class="card-body" style="cursor:pointer;">
							<h5 class="card-title">Add new Admin</h5>
							<p class="card-text">Add New admin user to the database.</p>
						</div>
					</div>
				</div>
				<div class="col-sm-4" style="margin-top:20px;margin-bottom:20px;">
					<div class="card text-white bg-dark mb-3"
						style="max-width: 18rem;">
						<div class="card-header" style="cursor:pointer;">Trainers</div>
						<div class="card-body" style="cursor:pointer;">
							<h5 class="card-title">Add / Remove Trainers</h5>
							<p class="card-text">Add new Trainer or remove existing trainers</p>
						</div>
					</div>
				</div>
				<div class="col-sm-4" style="margin-top:20px;margin-bottom:20px;">
					<div class="card text-white bg-danger mb-3"
						style="max-width: 18rem;">
						<div class="card-header" style="cursor:pointer;">User Performance</div>
						<div class="card-body" style="cursor:pointer;">
							<h5 class="card-title">Track users performances</h5>
							<p class="card-text">Track all user's performance according to their enrolled courses</p>
						</div>
					</div>
				</div>
			</div>
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
							<a href="/lectures/${course.cid}/${course.cname}"
								class="ui button teal">Enroll</a>
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
							<a href="/lectures/${course.cid}/${course.cname}"
								class="ui button teal">Enroll</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>