<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="resources/images/favicon.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration | EasyLearn</title>
<link rel="stylesheet"
	href="<c:url value="/resources/semantic-ui/semantic.min.css" />">
<!-- <link rel="stylesheet" href="semantic.min.css" />-->
</head>
<body>
	<jsp:include page="navbar/loggedOutNavbar.jsp" />
	<div class="ui grid container center aligned">
		<div class="ui segment five wide column " style="margin-top: 60px;">
			<div class="ui header huge">Register</div>
			<div class="ui divider"></div>
			<form:form method="POST" modelAttribute="userForm"
				class="form-signin ui form">

				<spring:bind path="username">
					<div class="field form-group ${status.error ? 'has-error' : ''}">
						<label>Username</label> 
						<form:input type="text" path="username" class="form-control" placeholder="Username"
                                autofocus="true"></form:input>
                    <form:errors path="username" style="color:#00b5ad;font-weight: bolder"></form:errors>
					</div>
				</spring:bind>

				<spring:bind path="password">
					<div class="field form-group ${status.error ? 'has-error' : ''}">
						<label for="email">Password</label> 
						<form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>
						<form:errors path="password" style="color:#00b5ad;font-weight: bolder"></form:errors>
					</div>
				</spring:bind>

				<spring:bind path="passwordConfirm">
					<div class="field form-group ${status.error ? 'has-error' : ''}">
						<label for="password">Confirm Password</label> 
						<form:input type="password" path="passwordConfirm" class="form-control"
                                placeholder="Confirm your password"></form:input>
                                <form:errors path="passwordConfirm" style="color:#00b5ad;font-weight: bolder"></form:errors>
					</div>
				</spring:bind>
				<button class="ui button teal" type="submit"><i class="sign-in icon"></i>Register</button>
				<p>
					Already have an account? <a href="login">Login</a>
				</p>

			</form:form>
		</div>
	</div>
</body>
</html>