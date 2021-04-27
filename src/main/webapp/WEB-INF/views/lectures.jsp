<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/images/favicon.ico" />
<meta charset="ISO-8859-1">

<title>${cname} | EasyLearn</title>
<link rel="stylesheet"
	href="<c:url value="/resources/semantic-ui/semantic.min.css" />" />
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></script>
<style>
.ui.accordion.accordion .title {
	color: black !important;
}

.ui.accordion.accordion .title.active {
	color: teal !important;
}

.column.twelve.wide .assessment-para {
	margin-top: 5px;
	margin-left: 5px;
}

.ui.basic.button.tiny.sub-module-arrow:hover {
	color: teal !important;
}
</style>
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<div style="position: initial; margin: auto auto"
		class="ui basic modal" id="quiz-prompt">
		<div class="ui icon header">
			<i class="exclamation icon"></i> Do you want to start the test?
		</div>
		<div class="actions">
			<div class="ui red basic cancel inverted button">Cancel</div>

			<div class="ui teal ok inverted button"
				onclick="document.getElementById('startTestForm').submit();">
				<form id="startTestForm" method="POST"
					action="/course/${quiz.qid}/quiz">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<div class="ui">
						Start<i class="angle right icon"></i>
					</div>
				</form>
			</div>

		</div>
	</div>

	<div class="ui container">
		<h1 class="ui header centered" style="margin-top: 110px">${cname}</h1>
		<div class="ui divider"></div>
		<div class="ui grid centered">
			<div class="column fourteen wide">
				<div class="ui styled accordion" style="margin: auto">

					<c:forEach var="lecture" items="${lectures}">
						<div class="ui small modal" id="modal${lecture.slno}">
							<div class="ui header">${lecture.lname}</div>
							<div class="content"></div>
						</div>
						<div class="title">
							<i class="dropdown icon"></i> Module${lecture.slno}:
							${lecture.lname}
						</div>

						<div class="content">
							<div class="transition hidden ui grid">
								<div class="column thirteen wide">${lecture.lname}</div>
								<div class="column three wide">

									<!-- Button trigger modal -->
									<button type="button"
										class="ui basic button tiny sub-module-arrow"
										data-toggle="modal"
										data-target="#exampleModalCenter${lecture.slno}">
										<i class="arrow right icon " style="margin-right: 4px;"></i>
									</button>
									<!-- Modal -->
									<div class="modal fade" id="exampleModalCenter${lecture.slno }"
										tabindex="-1" role="dialog"
										aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered modal-lg"
											role="document">
											<div class="modal-content" style="height: 700px">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLongTitle">${lecture.lname}</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<iframe allowFullScreen="true" width="100%" height="100%"
														src="https://www.youtube.com/embed/${lecture.url }"></iframe>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">Close</button>
													<button type="button" class="btn btn-primary">Save
														changes</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
			</div>

			<div class="column fourteen wide mobile only">
				<div class="ui grid">
					<div class="column nine wide"></div>
					<div class="column seven wide">
						<button class="ui button fluid teal" onclick="openQuizPrompt()">
							Assessment <i class="arrow right icon"></i>
						</button>
					</div>
				</div>
			</div>
			<div class="column thirteen wide tablet only">
				<div class="ui grid">
					<div class="column eleven wide"></div>
					<div class="column five wide">
						<button class="ui button fluid teal" onclick="openQuizPrompt()">
							Assessment <i class="arrow right icon"></i>
						</button>
					</div>
				</div>
			</div>
			<div class="column nine wide computer only">
				<div class="ui grid">
					<div class="column eleven wide"></div>
					<div class="column five wide">
						<button class="ui button fluid teal" onclick="openQuizPrompt()">
							Assessment <i class="arrow right icon"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('.ui.accordion').accordion();
		//$('.url.example .ui.embed').embed();
		$('.content .ui.embed').embed();
		function openModal() {
			$("#modal${lecture.slno}").modal("show");
		}
		function openQuizPrompt() {
			$("#quiz-prompt").modal("show");
		}

		//Code to replace the state of the question page so user can't visit come back to lecture page from questionpage using back button to access previous page
		if (window.history.replaceState) {
			window.history.replaceState(null, null, window.location.href);
		}
	</script>
</body>
</html>