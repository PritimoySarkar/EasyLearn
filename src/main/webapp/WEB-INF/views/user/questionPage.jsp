<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/images/favicon.ico" />
<meta charset="ISO-8859-1">

<title>EasyLearn | Assessment</title>
<link rel="stylesheet"
	href="<c:url value="/resources/semantic-ui/semantic.min.css" />" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
	integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
	integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></script>

</head>
<body>
	<jsp:include page="../navbar/qPageNavbar.jsp" />
	<div class="ui container">
		<h1 class="ui header centered" style="margin-top: 110px">${cname}
			Assessment</h1>
		<h2 style="text-align: right; font-family: fantasy; color: teal;"
			id="countdown"></h2>

		<div class="ui divider"></div>
		<div class="ui grid centered">
			<div class="column fourteen wide">
				<form class="ui form" action="/course/quiz/scorecard" method="post">
					<input type="hidden" name="aid"
						value="${attempt.aid}" />
					<input type="hidden" id="csrf_token" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<c:forEach var="question" items="${questions}">
						<input class="each-question" type="hidden" name="qid" value="${question.qqid}" id="question-${question.qid}"/>
						<div class="grouped fields">
							<label for="${question.qqid}">${question.slno}).&nbsp;
								${question.question}</label>

							<!-- For questions having less than 4 options like True/False only not empty options will be shown -->
							<c:choose>
								<c:when test="${not empty question.option1}">
									<div class="field">
										<div class="ui radio">
											<label> <input type="radio" class="${question.qqid}-option" name="${question.qqid}"
												value="A" id="${question.qqid}-1" onclick='onChangeAnswer("${aid}","${question.qqid}","A")'>
												&ensp;${question.option1}
											</label>
										</div>
									</div>
								</c:when>
							</c:choose>

							<c:choose>
								<c:when test="${not empty question.option2}">
									<div class="field">
										<div class="ui radio">
											<label> <input type="radio" class="${question.qqid}-option" name="${question.qqid}"
												value="B" id="${question.qqid}-2" onclick='onChangeAnswer("${aid}","${question.qqid}","B")'>
												&ensp;${question.option1})">
												&ensp;${question.option2}
											</label>
										</div>
									</div>
								</c:when>
							</c:choose>

							<c:choose>
								<c:when test="${not empty question.option3}">
									<div class="field">
										<div class="ui radio">
											<label> <input type="radio" class="${question.qqid}-option" name="${question.qqid}"
												value="C" id='${question.qqid}-3' onclick='onChangeAnswer("${aid}","${question.qqid}","C")'>
												&ensp;${question.option3}
											</label>
										</div>
									</div>
								</c:when>
							</c:choose>

							<c:choose>
								<c:when test="${not empty question.option4}">
									<div class="field">
										<div class="ui radio">
											<label> <input type="radio" class="${question.qqid}-option" name="${question.qqid}"
												value="D" id="${question.qqid}-4" onclick='onChangeAnswer("${aid}","${question.qqid}","D")'>
												&ensp;${question.option4}
											</label>
										</div>
									</div>
								</c:when>
							</c:choose>

						</div>
						<br />
					</c:forEach>
					<!--  <button class="ui button teal" data-toggle="modal" data-target="#testSubmitModal" type="button">Submit</button> -->
					<!-- Submit Test Button trigger modal -->
					<button type="button" class="btn ui button teal"
						data-bs-toggle="modal" data-bs-target="#staticBackdrop">
						Submit</button>

					<!--Manually Submit Test Modal -->
					<div class="modal fade" id="staticBackdrop"
						data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
						aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h1 style="font-family: inherit; color: #999999"
										class="modal-title" id="staticBackdropLabel">Are you
										sure?</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<h2 style="font-family: inherit; color: #999999">Do you
										want to submit the test now?</h2>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">No, Not Now</button>
									<button type="submit" class="btn btn-primary">Yes</button>
								</div>
							</div>
						</div>
					</div>

					<!--Warning for very less time remaining-->
					<div class="modal fade" id="warningTest" data-bs-keyboard="false"
						tabindex="-1" aria-labelledby="staticBackdropLabel"
						aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h1 style="font-family: inherit; color: #108bdc"
										class="modal-title" id="staticBackdropLabel">Only 2
										minutes left</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<h2 style="font-family: inherit; color: #108bdc">Hurry up
										and complete your test</h2>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary"
										data-bs-dismiss="modal">Okay</button>
									<button type="submit" class="btn btn-secondary">Submit
										Now</button>
								</div>
							</div>
						</div>
					</div>

					<!--Automatically Submit Test Modal -->
					<div class="modal fade" id="autoSubmitTest"
						data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
						aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h1 style="font-family: inherit; color: #ca3d3d"
										class="modal-title" id="staticBackdropLabel">Time's up</h1>

								</div>
								<div class="modal-body">
									<h2 style="font-family: inherit; color: #ca3d3d">Your Test
										will be submitted now</h2>
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary">Okay</button>
								</div>
							</div>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
	<script>
	function setAnswer(qqid,answer){
		console.log("Question ID: "+qqid);
		console.log("Question's answer: "+answer);
		var id='';
		if(answer=='A') id=qqid+"-1";
		else if(answer=='B') id=qqid+"-2";
		else if(answer=='C') id=qqid+"-3";
		else if(answer=='D') id=qqid+"-4";
		console.log()
		$("#"+id).prop("checked", true);
	}
	</script>
	<c:choose>
		<c:when test="${not empty answersBackup}">
			<c:forEach var="question" items="${answersBackup}">
				<div id="answersBackup-qid">${question.qqid}</div>
				<div id="answersBackup-answer">${question.answer}</div>
				<script>
					var qqid = $('#answersBackup-qid').html();
					var answer = $('#answersBackup-answer').html();
					setAnswer(qqid,answer);
					$('#answersBackup-qid').remove();
					$('#answersBackup-answer').remove();
					//console.log(qqid,answer);
				</script>
			</c:forEach>
		</c:when>
	</c:choose>
	<footer>
		<script>
			//Code to replace the state of the question page so user can't visit coursepage after submitting the test and by going back to the previous page			
			if (window.history.replaceState) {
				window.history.replaceState(null, null, window.location.href);
			}
	
			//A method that can be called only once to restrict time countdown manipulation
			var onceTimer = (function() {
			    var executed = false;
			    return function() {
			        if (!executed) {
			            executed = true;
			            //Code for countdown timer
			            console.log("Quesion count is: "+"${time_in_seconds}");
			            const start = parseInt("${time_in_seconds}");
						function timer() {				
							//if (typeof fired !== 'undefined'){ return;}
							let secs = start;
							
							//Get the element where the timer will be set
							const countDownElemnt = document.getElementById('countdown');

							function updateCountDown() {
								//Calculating Reamaining minutes and seconds
								const minutes = Math.floor(secs / 60);
								let remainingSecs = secs % 60;

								//If remaining time is less than 2 minutes show warning modal
								if (minutes == 1 && remainingSecs == 59) {
									$('#warningTest').modal('show');
									countDownElemnt.style.color = "red";
								}

								//If ramining time is 0 mintes and 0 seconds show not dismissable modal submit test
								if (minutes == 0 && remainingSecs == 0) {
									$('#autoSubmitTest').modal('show');
								}

								//Set the timesr element text to remaining time left
								countDownElemnt.innerHTML = +minutes + " : "
										+ remainingSecs;

								//Decreasing remaining seconds by 1 everytime the function is called
								secs--;
							}
							//calling the function everysecond
							setInterval(updateCountDown, 1000);
						}
						timer();
			        }
			    };
			})();
			
			//Call the onceTimer function
			onceTimer();

			function onChangeAnswer(aid,qqid,answer){
				var toSend = {"${_csrf.parameterName}" : "${_csrf.token}","aid": aid};
				toSend[qqid] = answer;
				$.ajax({url:"http://localhost:8080/user/questions/autosub", data: toSend, method: "POST"})
				.done(function(response){
					console.log("data sent on change");
				})
				.fail(function(){
					console.log("data sending failed");
				});
			}
			
			(function restoreAnswers(){
				if(!"${answersBackup}"==undefined){
					console.log("No Backup found");
				}
				else{
					console.log("${answersBackup}");
					console.log(typeof "${answersBackup}");
					console.log(typeof "${questions}");
				}
			})();
			
			//Warning before leaving page
			window.addEventListener('beforeunload', function (e) {
				  // Cancel the event
				  e.preventDefault(); // If you prevent default behavior in Mozilla Firefox prompt will always be shown
				  // Chrome requires returnValue to be set
				  e.returnValue = '';
				});
		</script>
	</footer>
</body>
</html>