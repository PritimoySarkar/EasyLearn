<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="resources/images/favicon.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> All Courses | EasyLearn</title>
<link rel="stylesheet"
	href="<c:url value="/resources/semantic-ui/semantic.min.css" />">
	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
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
	<!-- Auto submitting form to store userid in cookies -->
	<form id="AutoForm" method="POST" action="/saveuser">
            <input type="hidden" name="username" value="${pageContext.request.userPrincipal.name}"/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <script>
        function formAutoSubmit () {
        	var frm = document.getElementById("AutoForm");
        	frm.submit();
        }
        var x = document.cookie.split(';').map(cookie => cookie.split('='))
        .reduce((accumulator , [key,value]) =>
        ({...accumulator, [key.trim()]: decodeURIComponent(value)}),{});
        
        //Check if userid cookie is present or not
        if(typeof x.userid === "undefined"){
        	//If no cookie found the the form is submitted to create cookie
        	window.onload = formAutoSubmit;
        }
        </script>
        
	<img class="home-bg" src="resources/images/home-bg.jpg" alt="" />
	<div class="ui container">

		<jsp:include page="navbar.jsp" />
		
		<!-- Checking if the noenrolledcourse list is not empty to print the not enrolled course heading -->
		<c:choose>
			<c:when test="${not empty notEnrolledCourses}">
				<h2 class="ui header" style="margin-top: 110px">Not enrolled courses</h2>
			</c:when>
		</c:choose>
		<!-- All Remaining Not Enrolled Courses -->
		<div class="ui divider"></div>
		<div class="ui grid computer only">
			<c:forEach var="course" items="${notEnrolledCourses}">
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
							<!-- Button trigger modal -->
								<button type="button" class="ui button teal"
									data-toggle="modal"
									data-target="#exampleModalCenter${course.cid}"><i class="cart plus icon"></i>Enroll</button> 
									
								<!-- Modal -->
								<div class="modal fade" id="exampleModalCenter${course.cid }"
									tabindex="-1" role="dialog"
									aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered"
										role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h1 class="modal-title" id="exampleModalLongTitle">Are you sure?</h1>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<h3>Do you want to Enroll for ${course.cname} Course?</h3>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">No, Not Now</button>
												
												<!-- Sending course id and username to enroll a course for the corresponding user and csrf token for avoiding  -->
												<form id="dashboardForm" method="POST" action="/enroll">
										            <input type="hidden" name="username" value="${pageContext.request.userPrincipal.name}"/>
										            <input type="hidden" name="cid" value="${course.cid}"/>
										            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
										        	<button type="submit" class="btn btn-primary">Yes</button>
										        </form>	
												
											</div>
										</div>
									</div>
								</div>
								
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		
		<!-- Checking if the enrolled course list is not empty to print the enrolled course heading -->
		<c:choose>
			<c:when test="${not empty enrolledCourses}">
				<h2 class="ui header" style="margin-top: 110px">Enrolled Courses</h2>
			</c:when>
		</c:choose>
		<div class="ui divider"></div>
		<div class="ui grid computer only">
			<c:forEach var="course" items="${enrolledCourses}">
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
							<!-- Button trigger modal -->
								<button type="button" class="ui button teal"
									data-toggle="modal"
									data-target="#exampleModalCenter${course.cid}"><i class="lock open icon"></i>Explore</button> 
									
								<!-- Modal -->
								<div class="modal fade" id="exampleModalCenter${course.cid }"
									tabindex="-1" role="dialog"
									aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered"
										role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h1 class="modal-title" id="exampleModalLongTitle">Are you ready?</h1>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<h3>Do you want to explore ${course.cname} Course?</h3>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">No, Not Now</button>
												
												<form id="dashboardForm" method="POST" action="/lectures/${course.cid}/${course.cname}">
										            <input type="hidden" name="username" value="${pageContext.request.userPrincipal.name}"/>
										            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
										        	<button type="submit" class="btn btn-primary">Yes</button>
										        </form>	
												
											</div>
										</div>
									</div>
								</div>
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