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
<title>Forget Password | EasyLearn</title>
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
		<div class="ui header huge">Forget Password</div>
		<div class="ui divider"></div>
			<form id="otp-form" class="ui form form-signin" action="/submitotp" method="post">
				<input id="encoded-username" type="hidden" name="encodedUsername" class="form-control">
				<input id="encoded-otp" type="hidden" name="encodedOtp" class="form-control">
				<div id="username-field" class="field">
					<label for="username">Search account by Email</label> <input id="username" type="text" autofocus="true"
						placeholder="abc@lms.com" name="username" class="form-control" required="true">
				</div>
				<div class="field">
				<div id="otp-loader" style="display:none;" class="ui active centered inline loader"></div>
				<span style="margin-bottom: 5px;font-size: 12pt;font-weight:600;" id="response-text"></span>
				<span onClick="requestOtp()" style="cursor:pointer;margin-bottom: 5px;font-size: 12pt;font-weight:600;" id="resend_otp-text"></span>
				</div>
				<div id="otp-field" class="field" style= "display:none;">
					<label for="otp">Enter the OTP</label> <input id="input-otp" name="otp" type="text"
						placeholder="******" class="form-control" required="true"/>
				</div>
				<span style="color:#00b5ad;font-weight: bolder">${error}</span><br>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<button id="otp-submit" onClick="requestOtp()" class="ui button teal" type="button"><i class="key icon"></i>Request OTP</button>
				<p>New to EasyLearn? <a href="${contextPath}/registration">Register</a></p>

			</form>
			<script>
				function requestOtp(){
					$('#otp-loader').css("display","block");
					$('#response-text').html("<div class='ui loader'></div> Sending OTP...");
					var username = $('#username').val();
					const toSend = {"${_csrf.parameterName}" : "${_csrf.token}", "username" : username};
					$.ajax({url:"http://localhost:8080/reset", data: toSend, method: "POST"})
					.done(function(response){
						console.log(response);
						if(response.status=="true"){
							console.log(response.encodedOtp);
							$('#otp-loader').css("display","none");
							$("#otp-submit").attr('value','Reset Password');
							$("#otp-submit").html('Reset Password');
							$("#otp-submit").attr('onClick','matchOtp()');
							$('#response-text').css("color","green");
							$('#response-text').html("OTP sent");
							$('#resend_otp-text').css("color","green");
							$('#resend_otp-text').html("Resend OTP");
							$('#username').prop("readonly",true);
							$('#username-field').css("opacity","0.6");
							$('#encoded-username').val(response.encodedUsername);
							$('#encoded-otp').val(response.encodedOtp);
							$('#otp-field').css("display","block");
							
						}
						else{
							$('#otp-loader').css("display","none");
							$('#response-text').css("color","red");
							$('#response-text').html("No user found with this username");
						}
						console.log("requested");
					})
					.fail(function(){
						console.log("request failed");
					});
				}
				
				function matchOtp(){
					var otp = $('#input-otp').val();
					var encodedOtp = $('#encoded-otp').val();
					const toSend = {"${_csrf.parameterName}" : "${_csrf.token}", "otp" : otp, "encodedOtp" : encodedOtp};
					$.ajax({url:"http://localhost:8080/otpmatch", data: toSend, method: "POST"})
					.done(function(response){
						console.log(response);
						if(response){
							console.log("OTP Matched");
							$('#otp-form').submit();
						}
						else{
							$('#response-text').css("color","red");
							$('#response-text').html("OTP didn't matched");
						}
						console.log("requested");
					})
					.fail(function(){
						console.log("request failed");
					});
				}
			</script>
		</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</body>
</html>