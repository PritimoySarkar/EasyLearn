<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
/* body {
  min-height: 2000px;
} */
body>.ui.container {
	margin-top: 6em;
}

.offices {
	color: #fff;
}

.flags a {
	padding: .012em;
}
/* Nav */
.ui.fixed.borderless.menu {
	background-color: teal;
}

.ui .computer.only .item {
	color: #fff;
}

.ui.fixed.borderless.menu .row>a.header.item {
	font-size: 1.4em;
}

.menu-item {
	color: white !important;
	margin-left: 10px;
	margin-right: 10px;
}

.menu-item:hover {
	background-color: #5f9ea0 !important;
	color: #fff !important;
	border-bottom: 2px solid white;
}

.easy-learn, .easy-learn:hover {
	color: white !important;
	background-color: teal !important;
}

/* Mobile */
/* .tablet.mobile.only .header, .ui.icon.button > .icon {
  color: #fff;
} */
</style>
</head>
<body>
	
	<!--User Details  -->
	<c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <!-- 
        <form id="dashboardForm" method="POST" action="/dashboard">
            <input type="hidden" name="username" value="${pageContext.request.userPrincipal.name}"/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
         -->
    </c:if>

	<!--Start: Nav  -->
	<div class="ui fixed borderless menu">

		<div class="ui container grid">

			<!--Start: Desktop Nav-->
			<div class="computer only row">
				<a href="/allcourses" class="header item easy-learn"
					style="font-size: 2rem">Easy Learn</a> 
					<a href="/allcourses"
					class="item menu-item"><i class="book icon"></i>All Courses</a> 
					<a href="/enrolledcourses" class="item menu-item"><i class="clipboard icon"></i>Enrolled Courses</a>
					
				<div class="right item menu-item ui simple dropdown">
							Hello, ${pageContext.request.userPrincipal.name} <i class="dropdown icon"></i>
							<div class="menu">
								<div onclick="window.location.href='/dashboard'" class="item"><i class="user icon"></i><a style="color:black">Profile</a></div>
								<div onclick="logOutFunction()" class="item"><i class="power off icon"></i><a style="color:black">Log Out</a></div>
							</div>
					
					<!-- <a class="ui item active"><i class="power off icon"></i>Log Out</a> -->
				</div>

			</div>
			<!--End: Desktop Nav-->

			<!--Start: Mobile Nav-->
			<div class="tablet mobile only row">
				<a href="/allcourses" class="header item easy-learn">Easy Learn</a>
				<a href="/allcourses" class="item menu-item">All Courses</a> <a
					class="item menu-item">Dashboard</a>
				<!-- <div class="right menu">
        <a class="menu item">
          <div class="ui basic icon toggle button">
            <i class="content icon"></i>
          </div>
        </a>
      </div> -->
			</div>
			<!--End: Mobile Nav-->
		</div>
	</div>
	<script>
	function logOutFunction() {
			document.cookie = "userid=-1"+'; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
		  	document.getElementById("logoutForm").submit();
		}
	</script>
</body>
</html>