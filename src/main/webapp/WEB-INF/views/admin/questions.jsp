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
<script src="/resources/sweetalert.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="sweetalert2.all.min.js"></script>

<!-- Edit Swal CSS -->
<link rel="stylesheet" href="<c:url value="/resources/editSwal.css" />" />

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
			<div class="field">
			<label>Question's Serial number type</label>
				<div class="checkbox">
					<input type="checkbox" name="status" id="status" checked />
					<label><span class="slText">Add Lecture at the end of the list</span></label>
					<label><span class="slText" style="display:none">Set custom serial number</span></label>
				</div>
				<div class="customSlno" style="display:none">
				<div class="field">
				<spring:bind path="slno">
					<label for="vol">Question's Serial No:&nbsp;
					 <span style="color: #099a35;font-weight: bold;" id="range-add-val"></span>
		  			</label>
					<form:input style="margin-top:0px;" type="range" path="slno" id="addSlno" min="1"></form:input>
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
								<button 
								onClick="editQuestion(${question.slno},${question.qqid},${questions.size()},'${question.question}','${question.option1}','${question.option2}','${question.option3}','${question.option4}','${question.answer}')"
								 type="button" class="ui button teal">Edit Question</button>
							</td>
							<td>
								<form id="form${question.qqid}" method="POST" action="/admin/remove/question/${cid}/${qid}">
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
			   $('#addSlno').val(${questions.size()+1});
			   $('#range-add-val').html(${questions.size()+1});
			   console.log("checked");
			  }
			  else
			  {
			   $('#hidden_status').val('Deactive');
			   $('.slText').toggle();
			   $('.customSlno').toggle();
			   $('#addSlno').val(${questions.size()+1});
			   $('#range-add-val').html(${questions.size()+1});
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
		swal1({
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
			    swal1("Question not added","","error");
			  }
			});
	}
	
	//Open Remove Lecture Modal
	function removeQuestion(qid){
		swal1({
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
			    swal1("Question not deleted","","info");
			  }
			});
	}
	
	//Edit Question
	function editQuestion(slno,qqid,total,question,o1,o2,o3,o4,ans){
		console.log(slno);
		console.log(qqid);
		console.log(total);
		console.log(question);
		console.log(o1);
		console.log(o2);
		console.log(o3);
		console.log(o4);
		console.log(ans);
	Swal.fire({
		  title: 'Edit Question',
		  html: `<form id="editQuestionForm" method="POST" action="/admin/edit/question/${cid}/${qid}">
			  <input type="hidden" id="editQid" name="editQid" value="${qqid}" />
			  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			  
			  <label><span style="font-size:16pt;font-color:red;color: #5170c0;font-weight: bold;">Question<span></label>
			  <input type="text" name="editQuestion" id="editQuestion" value="${question}" class="swal2-input" placeholder="Enter the Question here" required="true">
			  
			  <label><span style="font-size:16pt;font-color:red;color: #5170c0;font-weight: bold;">Option 1</span></label>
			  <input type="text" name="editO1" id="editO1" class="swal2-input" placeholder="Option 1">
			  <label><span style="font-size:16pt;font-color:red;color: #5170c0;font-weight: bold;">Option 2</span></label>
			  <input type="text" name="editO2" id="editO2" class="swal2-input" placeholder="Option 2">
			  <label><span style="font-size:16pt;font-color:red;color: #5170c0;font-weight: bold;">Option 3</span></label>
			  <input type="text" name="editO3" id="editO3" class="swal2-input" placeholder="Option 3">
			  <label><span style="font-size:16pt;font-color:red;color: #5170c0;font-weight: bold;">Option 4</span></label>
			  <input type="text" name="editO4" id="editO4" class="swal2-input" placeholder="Option 4">
			  
			  <label><span style="font-size:16pt;font-color:red;color: #5170c0;font-weight: bold;">Answer</span></label>
			  <br>
			  <div class="ui radio checkbox"><input style="margin-left:4px;margin-top:3px;" type="radio" id="A" name="answer" value="A"><label><span style="margin-right:40px;">Option 1</span></label></div>
			  <div class="ui radio checkbox"><input style="margin-left:1px;margin-top:3px;" type="radio" id="B" name="answer" value="B"><label><span style="margin-right:40px;">Option 2</span></label></div>
			  <div class="ui radio checkbox"><input style="margin-left:1px;margin-top:3px;" type="radio" id="C" name="answer" value="C"><label><span style="margin-right:40px;">Option 3</span></label></div>
			  <div class="ui radio checkbox"><input style="margin-left:1px;margin-top:3px;" type="radio" id="D" name="answer" value="D"><label><span style="margin-right:40px;">Option 4</span></label></div>
			  <br>
			  	  
			  </select>
			  
			  <label><span style="font-size:16pt;font-color:red;color: #5170c0;font-weight: bold;">Serial Number:&nbsp;</span></label>
			  <label for="vol"><span style="font-size:16pt;color: #099a35;font-weight: bold;"><</span>
			  <span style="font-size:16pt;color: #099a35;font-weight: bold;" id="range-val"></span>
			  <span style="font-size:16pt;color: #099a35;font-weight: bold;">></span></label>
			  <br><br>
			  <input type="range" id="vol" name="editSlno" min="1" max="${total}">
			
			  </form>`,
			  confirmButtonText: 'Edit',
			  focusConfirm: false,
			  preConfirm: () => {
			    const editQ = Swal.getPopup().querySelector('#editQuestion').value
			    const editO = Swal.getPopup().querySelector('#editO1').value
			    if (!editQ || !editO) {
			      Swal.showValidationMessage(`Please enter Lecture Name and Url`)
			    }
			    else{
				    document.getElementById("editQuestionForm").submit();
				    Swal.fire("Question edited","","success");
			    }	    
			    //return { login: login, password: password }
			  }
			}).then((result) => {
			  Swal.fire("Question editing canceled","","error");
			})
			document.getElementById("editQuestion").value = question;
			document.getElementById("editO1").value = o1;
			document.getElementById("editO2").value = o2;
			document.getElementById("editO3").value = o3;
			document.getElementById("editO4").value = o4;
			document.getElementById(ans).checked = true;
			
			document.getElementById("editQid").value = qqid;
			document.getElementById("vol").max = total;
			document.getElementById("vol").value = slno;
			document.getElementById("range-val").innerHTML = slno;
			let slider = document.getElementById("vol");
			slider.addEventListener("change", function(v) {
				document.getElementById("range-val").innerHTML = slider.value;
			}, true);
	}
	
	//Add Question Slider
	let addQuestionSlider = document.getElementById("addSlno");
	addQuestionSlider.max=${questions.size()+1};
	addQuestionSlider.value=${questions.size()+1};
	
	document.getElementById("range-add-val").innerHTML = ${questions.size()+1};
		addQuestionSlider.addEventListener("change", function(v) {
			document.getElementById("range-add-val").innerHTML = addQuestionSlider.value;
		}, true);
	
	</script>
</body>
</html>