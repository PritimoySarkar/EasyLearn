<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LMS - Login</title>
<link rel="stylesheet"
	href="<c:url value="/resources/semantic-ui/semantic.min.css" />">
<!-- <link rel="stylesheet" href="semantic.min.css" />-->
</head>
<body>
<jsp:include page="loggedOutNavbar.jsp" />
	<div class="ui grid container center aligned">
		<div class="ui segment five wide column " style="margin-top: 60px;">
		<div class="ui header huge">Login</div>
		<div class="ui divider"></div>
			<form class="ui form" action="processform" method="post">

				<div class="field">
					<label for="email">Email</label> <input type="text"
						placeholder="abc@lms.com" name="email">
				</div>
				<div class="field">
					<label for="password">Password</label> <input type="password"
						placeholder="********" />
				</div>

				<button class="ui button teal" type="submit">Login</button>
				<p>New to EasyLearn? <a href="register">Register</a></p>

			</form>
		</div>
	</div>
</body>
</html>