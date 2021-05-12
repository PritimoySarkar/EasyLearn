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
<link rel="stylesheet" href="<c:url value="/resources/semantic-ui/semantic.min.css" />" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></script>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />  -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
  <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
  <link rel="stylesheet" href="<c:url value="/resources/bootstrapToggle.css" />" />

<!-- Sweet Alert 2 CDN -->
<script src="/resources/sweetalert.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="sweetalert2.all.min.js"></script>

<!-- Edit Swal CSS -->
<link rel="stylesheet" href="<c:url value="/resources/editSwal.css" />" />
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
			lecture</h1>

		<form:form id="addLectureForm" class="ui form" modelAttribute="newLecture" method="POST"
			action="/admin/add/lecture">
			<div class="field">
				<spring:bind path="cid">
					<form:input type="hidden" path="cid" value="${cid}"></form:input>
				</spring:bind>
				<spring:bind path="lname">
					<label>Lecture Name</label>
					<form:input type="text" path="lname"
						placeholder="Name of the Lecture" required="true"></form:input>
				</spring:bind>
			</div>
			<div class="field">
				<spring:bind path="url">
					<label>Lecture URL</label>
					<form:input type="text" path="url" placeholder="URL of the video" required="true"></form:input>
				</spring:bind>
			</div>
			<div class="ui segment">
			<div class="field">
			<label>Lecture's Serial number type</label>
				<div class="checkbox">
					<input type="checkbox" name="status" id="status" checked />
					<label><span class="slText">Add Lecture at the end of the list</span></label>
					<label><span class="slText" style="display:none">Set custom serial number</span></label>
				</div>
				</div>
				<div class="customSlno" style="display:none">
				<div class="field">
				<spring:bind path="slno">
					<label for="addSlno">Lecture's Serial No:&nbsp;					
		  			<span style="color: #099a35;font-weight: bold;" id="range-add-val"></span>
		  			</label>
					<form:input style="margin-top:0px;" type="range" path="slno" id="addSlno" min="1"></form:input>
				</spring:bind>		
				</div>
			</div>
			</div>
			<button class="ui teal button" type="button" onClick="addLecture()">Add Course</button>
			<button id="addLectureSubmitButton" style="display:none" class="ui teal button" type="submit">Add Course</button>
		</form:form>

		<div class="ui divider"></div>
		<h1 class="ui header centered" style="margin-top: 110px">All
			lectures of ${courseName} Course</h1>
		<div class="ui grid centered">
			<div class="column ten wide computer only"></div>

			<table class="ui teal table"
				style="font-size: 16pt; text-align: center">
				<thead>
					<tr>
						<th>Lecture serial Number</th>
						<th>Lecture Name</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="lec" items="${lectures}">
						<tr>
							<td>${lec.slno }</td>
							<td>${lec.lname }</td>
							<td>
								<button id="editLectureButton${lec.lid}" onClick="editLecture(${lec.slno},${lec.lid},${lectures.size()},'${lec.lname}','${lec.url}')" type="button" class="ui button teal">Edit Lecture </button>
							</td>
							<td>
								<form id="deleteForm${lec.lid}" method="POST"
									action="/admin/remove/lecture/${cid}/${lec.lid}">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
									<input type="hidden" name="lid" value="${lec.lid }">
									<input type="hidden" name="slno" value="${lec.slno }">
									<button onClick="removeLecture(${lec.lid})" type="button" class="ui button red">Delete
										Lecture</button>
									<button style="display:none" id="removeLectureSubmitButton${lec.lid}" type="submit" class="ui button red">Delete
										Lecture</button>
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
			   $('#addSlno').val(${lectures.size()+1});
			   $('#range-add-val').html(${lectures.size()+1});
			   console.log("checked");
			  }
			  else
			  {
			   $('#hidden_status').val('Deactive');
			   $('.slText').toggle();
			   $('.customSlno').toggle();
			   $('#addSlno').val(${lectures.size()+1});
			   $('#range-add-val').html(${lectures.size()+1});
			   console.log("Un-checked");
			  }
			 });
	});
	
	//Code to replace the state of the questions page so user can't refresh the page and resubmit the form so there will be no duplicate entry
	if (window.history.replaceState) {
		window.history.replaceState(null, null, window.location.href);
	}
	
	//Open Add Lecture Modal
	function addLecture(){
		swal1({
			  title: "Are you sure?",
			  text: "Do you want to add this lecture",
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
				  document.getElementById("addLectureSubmitButton").click();
			  } else {
			    swal1("Lecture not added","","error");
			  }
			});
	}
	
	//Open Remove Lecture Modal
	function removeLecture(lid){
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
				  console.log(lid);
				  document.getElementById("removeLectureSubmitButton"+lid).click();
			  } else {
			    swal1("Lecture not deleted","","info");
			  }
			});
	}
	
	//Edit Question
	function editLecture(slno,lid,total,lname,lurl){
	Swal.fire({
		  title: 'Edit Lecture',
		  html: `<form id="editLectureForm" method="POST" action="/admin/edit/lecture/${cid}">
		  <input type="hidden" id="editLid" name="editLid" value="${lid}" />
		  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		  
		  <label><span style="font-size:16pt;font-color:red;color: #5170c0;font-weight: bold;">Lecture\'s Name<span></label>
		  <input type="text" name="editName" id="editName" value='${lname}' class="swal2-input" placeholder="Your Lecture's Name" required="true">
		  
		  <label><span style="font-size:16pt;font-color:red;color: #5170c0;font-weight: bold;">Lecture\'s URL</span></label>
		  <input type="text" name="editUrl" id="editUrl" class="swal2-input" placeholder="your Lecture's URL">
		  
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
		    const editName = Swal.getPopup().querySelector('#editName').value
		    const editUrl = Swal.getPopup().querySelector('#editUrl').value
		    if (!editName || !editUrl) {
		      Swal.showValidationMessage(`Please enter Lecture Name and Url`)
		    }
		    else{
			    document.getElementById("editLectureForm").submit();
			    Swal.fire("Lecture edited","","success");
		    }	    
		    //return { login: login, password: password }
		  }
		}).then((result) => {
		  Swal.fire("Lecture editing canceled","","error");
		})
		document.getElementById("editLid").value = lid;
		document.getElementById("vol").max = total;
		document.getElementById("vol").value = slno;
		document.getElementById("range-val").innerHTML = slno;
		document.getElementById('editName').value=lname;
		document.getElementById('editUrl').value=lurl;
		let slider = document.getElementById("vol");
		slider.addEventListener("change", function(v) {
			document.getElementById("range-val").innerHTML = slider.value;
		}, true);
	}
	
	//Add Lecture Slider
	let addCourseSlider = document.getElementById("addSlno");
	addCourseSlider.max=${lectures.size()+1}
	addCourseSlider.value=${lectures.size()+1}
	document.getElementById("range-add-val").innerHTML = ${lectures.size()+1};
		addCourseSlider.addEventListener("change", function(v) {
			document.getElementById("range-add-val").innerHTML = addCourseSlider.value;
		}, true);

		</script>
</body>
</html>