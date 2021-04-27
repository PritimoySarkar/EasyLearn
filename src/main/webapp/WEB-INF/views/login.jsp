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
<title>Login | EasyLearn</title>
<link rel="stylesheet"
	href="<c:url value="/resources/semantic-ui/semantic.min.css" />">
<!-- <link rel="stylesheet" href="semantic.min.css" />-->
</head>
<body>
<script>
var x = document.cookie.split(';').map(cookie => cookie.split('='))
.reduce((accumulator , [key,value]) =>
({...accumulator, [key.trim()]: decodeURIComponent(value)}),{});
console.log(x);
</script>
<jsp:include page="navbar/loggedOutNavbar.jsp" />
	<div class="ui grid container center aligned">
		<div class="ui segment five wide column " style="margin-top: 60px;">
		<div class="ui header huge">Login</div>
		<div class="ui divider"></div>
			<form class="ui form form-signin" action="${contextPath}/login" method="post">

				<div class="field">
					<label for="email">Email</label> <input type="text" autofocus="true"
						placeholder="abc@lms.com" name="username" class="form-control">
				</div>
				<div class="field">
					<label for="password">Password</label> <input name="password" type="password"
						placeholder="********" class="form-control" />
				</div>
				<span style="color:#00b5ad;font-weight: bolder">${error}</span><br>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<button class="ui button teal" type="submit"><i class="lock open icon"></i>Login</button>
				<p>New to EasyLearn? <a href="${contextPath}/registration">Register</a></p>

			</form>
		</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</body>
</html>