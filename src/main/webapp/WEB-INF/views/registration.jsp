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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- Edit Swal CSS -->
<link rel="stylesheet" href="<c:url value="/resources/editSwal.css" />" />
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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
				
				<spring:bind path="firstname">
					<div class="field form-group ${status.error ? 'has-error' : ''}">
						<label>First Name</label> 
						<form:input type="text" path="firstname" class="form-control" placeholder="Username"
                                autofocus="true" id="fname" required="true"></form:input>
                    <form:errors path="firstname" style="color:#00b5ad;font-weight: bolder"></form:errors>
					</div>
				</spring:bind>
				
				<spring:bind path="lastname">
					<div class="field form-group ${status.error ? 'has-error' : ''}">
						<label>Last Name</label> 
						<form:input type="text" path="lastname" class="form-control" placeholder="First Name"></form:input>
                    <form:errors path="lastname" style="color:#00b5ad;font-weight: bolder"></form:errors>
					</div>
				</spring:bind>

				<spring:bind path="username">
					<div id="username-field" class="field form-group ${status.error ? 'has-error' : ''}">
						<label>Email</label> 
						<form:input id="username" type="text" path="username" class="form-control" placeholder="Username"></form:input>
                    <form:errors path="username" style="color:#00b5ad;font-weight: bolder"></form:errors>
					</div>
				</spring:bind>
				
				<spring:bind path="encodedUsername">
					<div class="field form-group ${otp.error ? 'has-error' : ''}"> 
						<form:input type="hidden" id="encodedUsername-userform" path="encodedUsername" class="form-control" required="true"></form:input>
					</div>
				</spring:bind>
				<div id="otp-loader" style="display:none;" class="ui active centered inline loader"></div>
				<span style="font-size: 12pt;font-weight:600;" id="response-text"></span>
				
				<spring:bind path="otp">
					<div class="field form-group ${otp.error ? 'has-error' : ''}"> 
						<form:input type="hidden" id="otp-userform" path="otp" class="form-control"></form:input>
						<button style="margin-top:10px;" id="otp-button" class="ui button teal" type="button" onClick="sendOTP()"><i class="envelope outline icon"></i>Send OTP</button>
						<form:errors path="otp" style="color:#00b5ad;font-weight: bolder"></form:errors>
						<span onClick="sendOTP()" style="cursor:pointer;margin-bottom: 5px;font-size: 12pt;font-weight:600;" id="resend_otp-text"></span>
					</div>
				</spring:bind>
				<spring:bind path="encodedOtp">
					<div class="${otp.error ? 'has-error' : ''}"> 
						<form:input type="hidden" id="encodedOtp-userform" path="encodedOtp" class="form-control" required="true"></form:input>
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
				<button id="register-button" class="ui button teal" type="submit"><i class="sign-in icon"></i>Register</button>
				<p>
					Already have an account? <a href="login">Login</a>
				</p>

			</form:form>
		</div>
	</div>
	<script>
	if(document.getElementById('encodedOtp-userform').value=="" || document.getElementById('otp-userform').value==""){
		$('#register-button').css("display","none");
	}
	
	//Ajax request OTP
	function requestOtp(){
		var status=false;
		var username = $('#username').val();
		const toSend = {"${_csrf.parameterName}" : "${_csrf.token}", "username" : username};
		$.ajax({url:"http://localhost:8080/request", async:false, data: toSend, method: "POST"})
		.done(function(response){
			//console.log(response);
			if(response.status=="true"){
				//console.log(response.encodedOtp);
				encodedOtpVal=response.encodedOtp;
				$('#otp-loader').css("display","none");
				$('#response-text').css("color","green");
				$('#response-text').html("OTP sent");
				$('#resend_otp-text').css("color","blue");
				$('#resend_otp-text').html("Resend OTP");
				$('#username').prop("readonly",true);
				$('#username-field').css("opacity","0.6");
				$('#encodedUsername-userform').val(response.encodedUsername);
				$('#encodedOtp-userform').val(response.encodedOtp);
				$('#otp-button').css("display","none");
				$('#register-button').css("display","initial");
				status = true;
			}
			else if(response.status=="invalid"){
				$('#otp-loader').css("display","none");
				$('#response-text').css("color","red");
				$('#response-text').html("Invalid Email ID format");
				status = false;
			}
			else if(response.status=="exist"){
				$('#otp-loader').css("display","none");
				$('#response-text').css("color","red");
				$('#response-text').html("An user with the same email ID already exist");
				status = false;
			}
			console.log("otp requested");
		})
		.fail(function(){
			console.log("request failed");
			status = false;
		});
		return status;
	}
	
	//Open Send OTP Modal
	function sendOTP(){
		var status;
		$('#otp-loader').css("display","block");
		$('#response-text').html("<div class='ui loader'></div> Sending OTP...");
		setTimeout(function(){
			status = requestOtp();
		//var status = requestOtp();
		console.log(status);
		if(status){
			console.log("OTP funcion triggered");
	Swal.fire({
		  title: 'Verify OTP',
		  html: `<form id="editQuestionForm" method="POST" action="/admin/edit/question/${cid}/${qid}">
			  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			  
			  <label><span style="font-size:16pt;font-color:red;color: #5170c0;font-weight: bold;">ENter your OTP here: <span></label>
			  <input type="text" name="otp" id="otp" class="swal2-input" placeholder="Enter the OTP here" required="true">
			  </form>`,
			  confirmButtonText: 'Verify OTP',
			  focusConfirm: false,
			  preConfirm: () => {
			    const otp = Swal.getPopup().querySelector('#otp').value
			    if (!otp) {
			      Swal.showValidationMessage(`Please check your email and enter the OTP`)
			    }
			    else{
				    //document.getElementById("editQuestionForm").submit();
				    const toVerify = {"${_csrf.parameterName}" : "${_csrf.token}", "otp" : otp, "encodedOtp" : encodedOtpVal};
				    $.ajax({url:"http://localhost:8080/otpmatch", async:false, data: toVerify, method: "POST"})
				    .done(function(response){
				    	if(response){
				    		Swal.fire("OTP Verified","","success");
				    	}
				    	else{
				    		Swal.showValidationMessage(`OTP mismatched`)
				    	}
				    });
				    document.getElementById("otp-userform").value = otp;
				    //Swal.fire("VERIFICATION Clicked","","success");
			    }	    
			  }
			}).then((result) => {
			  Swal.fire("OTP Not verified","","error");
			})
		}
		setTimeout(function(){},3000);
		},0);
	}
	</script>
</body>
</html>