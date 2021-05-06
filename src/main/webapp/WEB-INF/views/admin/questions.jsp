<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/images/favicon.ico" />
<meta charset="ISO-8859-1">

<title>Profile | EasyLearn</title>
<!-- Sweet Alert CDN -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="sweetalert2.all.min.js"></script>

<!-- Semantic UI -->
<link rel="stylesheet" href="<c:url value="/resources/semantic-ui/semantic.min.css" />" />

<!-- JQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></script>

<!-- Bootstrap Toggle -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<link rel="stylesheet" href="<c:url value="/resources/bootstrapToggle.css" />" />
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />  -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
  <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<style>
.home-bg {
	opacity: 0.1;
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

/* Toggle Button color */
.btn-success{
	background-color: #00b5ad;
    border-color: #00b5ad;
}

.btn-success:hover{
	background-color: teal;
    border-color: teal;
}
</style>
</head>
<body>
	
  
	<jsp:include page="../navbar/adminNavbar.jsp" />
	
	<div class="ui container">
		<h1 class="ui header centered" style="margin-top: 110px">Add new
			Question</h1>

		<form:form class="ui form" modelAttribute="newQuestion" method="POST"
			action="/admin/add/question/${cid}/${qid}">
			<spring:bind path="qid"><form:input type="hidden" path="qid" value="${qid}"></form:input></spring:bind>
			<div class="field">
				<spring:bind path="question">
					<label>Question</label>
					<form:input type="text" path="question" placeholder="Question" required="true"></form:input>
				</spring:bind>
			</div>

			<div class="two fields">
				<div class="field">
					<spring:bind path="option1">
						<label>First Option</label>
						<form:input type="text" path="option1" placeholder="Option 1" required="true"/>
					</spring:bind>
				</div>
				<div class="field">
					<spring:bind path="option2">
						<label>Second Option</label>
						<form:input type="text" path="option2" placeholder="Option 2" required="true"/>
					</spring:bind>
				</div>
			</div>
			<div class="two fields">
				<div class="field">
					<spring:bind path="option3">
						<label>Third Option</label>
						<form:input type="text" path="option3" placeholder="Option 3" />
					</spring:bind>
				</div>
				<div class="field">
					<spring:bind path="option4">
						<label>Fourth Option</label>
						<form:input type="text" path="option4" placeholder="Option 4" />
					</spring:bind>
				</div>
			</div>
			<div class="inline fields">
				<label>Select the correct option?</label>
				<div class="field">
					<div class="ui radio checkbox">
						<form:radiobutton style="margin-left:1px;margin-top:3px;" path="answer" value="A" tabindex="0" required="true"/>
						<label>Option 1</label>
					</div>
				</div>
				<div class="field">
					<div class="ui radio checkbox">
						<form:radiobutton style="margin-left:1px;margin-top:3px;" path="answer" value="B" tabindex="0" />
						<label>Option 2</label>
					</div>
				</div>
				<div class="field">
					<div class="ui radio checkbox">
						<form:radiobutton style="margin-left:1px;margin-top:3px;" path="answer" value="C" tabindex="0"/>
						<label>Option 3</label>
					</div>
				</div>
				<div class="field">
					<div class="ui radio checkbox">
						<form:radiobutton style="margin-left:1px;margin-top:3px;" path="answer" value="D" tabindex="0" />
						<label>Option 4</label>
					</div>
				</div>
			</div>
			<div class="ui segment">
			<div class="three fields">
			<div class="field">
			<label>Question's Serial number type</label>
				<div class="checkbox">
					<input type="checkbox" name="status" id="status" checked />
					<label><span class="slText">Add Lecture at the end of the list</span></label>
					<label><span class="slText" style="display:none">Set custom serial number</span></label>
				</div>
				</div>
				<div class="customSlno" style="display:none">
				<div class="field">
				<spring:bind path="slno">
					<label>Question's Serial No:</label>
					<!-- <form:input type="text" path="slno" placeholder="serial number" required="true"></form:input> -->
					<form:select id="slnoSelect" path="slno" class="ui search dropdown">
						<c:forEach var = "i" begin = "1" end = "${questions.size()}">
         					<form:option value="${i}">${i}</form:option>
      					</c:forEach>
      					<form:option value="${questions.size()+1}" selected="true">At the End (${questions.size()+1})</form:option>
					</form:select>
				</spring:bind>		
				</div>
			</div>
			</div>
			</div>
			<button class="ui teal button" type="button" onClick="addQuestion()">Add Question</button>
			<button id="addQuestionSubmitButton" style="display:none;" class="ui teal button" type="submit">Add Question</button>
		</form:form>
		<div class="ui divider"></div>
		<h1 class="ui header centered" style="margin-top: 110px">All
			Question of ${quizName} Quiz</h1>
		<div class="ui grid centered">
			<div class="column ten wide computer only"></div>

			<table class="ui teal table"
				style="font-size: 12pt; text-align: center">
				<thead>
					<tr>
						<th>Question serial Number</th>
						<th>Question</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="question" items="${questions}">
						<tr>
							<td>${question.slno }</td>
							<td>${question.question }</td>
							<td>
								<form id="form${cs.cid}" method="POST" action="/">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" /> <input type="hidden" name="cid"
										value="${question.qqid }">
									<button type="submit" class="ui button teal">Edit
										Question</button>
								</form>
							</td>
							<td>
								<form id="form${cs.cid}" method="POST" action="/admin/remove/question/${cid}/${qid}">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" /> <input type="hidden" name="qqid"
										value="${question.qqid }">
									<button type="button" class="ui button red" onClick="removeQuestion(${question.qqid})">Delete Question</button>
									<button style="display:none;" id="removeQuestionSubmitButton${question.qqid}" type="submit" class="ui button red">Delete Question</button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br /> <br /> <a class="ui button teal" href="/admin"> <i
				class="angle left icon"></i>Home
			</a>
		</div>
	</div>
	<script>
	$(document).ready(function(){
		const defSl= $('#slnoSelect').val();
		$('#status').bootstrapToggle({
			  on: 'Automatic',
			  off: 'Custom',
			  onstyle: 'success',
			  offstyle: 'primary'
			 });
			  $('#status').change(function(){
			  if($(this).prop('checked'))
			  {
			   $('#hidden_status').val('Active');
			   $('.slText').toggle();
			   $('.customSlno').toggle();
			   $('.ui.search.dropdown');
			   $('#slnoSelect').val(defSl);
			   console.log("checked");
			  }
			  else
			  {
			   $('#hidden_status').val('Deactive');
			   $('.slText').toggle();
			   $('.customSlno').toggle();
			   $('#slnoSelect').val(defSl);
			   console.log("Un-checked");
			  }
			 });
	});
	
	//Code to replace the state of the questions page so user can't refresh the page and resubmit the form so there will be no duplicate entry
	if (window.history.replaceState) {
		window.history.replaceState(null, null, window.location.href);
	}
	
	//Open Add Question Modal
	function addQuestion(){
		swal({
			  title: "Are you sure?",
			  text: "Do you want to add this Question",
			  icon: "info",
			  buttons:{
				  cancel: {
					  text: "No",
					    value: null,
					    visible: true,
					    className: "",
					    closeModal: true
				  },
				  confirm: {
				    text: "Yes, Add Now",
				    value: true,
				    visible: true,
				    className: "",
				    closeModal: true
				  }
			  }
			})
			.then((willDelete) => {
			  if (willDelete) {
				  document.getElementById("addQuestionSubmitButton").click();
			  } else {
			    swal("Question not added","","error");
			  }
			});
	}
	
	//Open Remove Lecture Modal
	function removeQuestion(qid){
		swal({
			  title: "Are you sure?",
			  text: "Do you want to remove this lecture",
			  icon: "error",
			  buttons:{
				  cancel: {
					  text: "No",
					    value: null,
					    visible: true,
					    className: "",
					    closeModal: true
				  },
				  confirm: {
				    text: "Yes, Add Now",
				    value: true,
				    visible: true,
				    className: "",
				    closeModal: true
				  }
			  }
			})
			.then((willDelete) => {
			  if (willDelete) {
				  console.log(qid);
				  document.getElementById("removeQuestionSubmitButton"+qid).click();
			  } else {
			    swal("Question not deleted","","info");
			  }
			});
	}
	
	//Edit Question
	function editQuestion(qid){
	Swal.fire({
		  title: 'Login Form',
		  html: `<input type="text" id="login" class="swal2-input" placeholder="Username">
		  <input type="password" id="password" class="swal2-input" placeholder="Password">`,
		  confirmButtonText: 'Sign in',
		  focusConfirm: false,
		  preConfirm: () => {
		    const login = Swal.getPopup().querySelector('#login').value
		    const password = Swal.getPopup().querySelector('#password').value
		    if (!login || !password) {
		      Swal.showValidationMessage(`Please enter login and password`)
		    }
		    return { login: login, password: password }
		  }
		}).then((result) => {
		  Swal.fire(`
		    Login: ${result.value.login}
		    Password: ${result.value.password}
		  `.trim())
		})
	}
	</script>
</body>
</html>