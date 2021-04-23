<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EasyLearn | Register New User</title>
</head>
<body>
<sf:form method="POST" modelAttribute="user">
	Name: <sf:input path="name"/><sf:errors path="name"/><br>
	Email: <sf:input path="email"/><sf:errors path="email"/><br>
	Password: <sf:input path="password"/><sf:errors path="password"/><br>
	Retype Password: <input name="repass" type="password"/><br>
		
	<input type="Submit" value="Add User">
</sf:form>
</body>
</html>