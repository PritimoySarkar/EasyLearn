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
	href="resources/images/favicon.ico" />
<meta charset="ISO-8859-1">

<title>Profile | EasyLearn</title>
<link rel="stylesheet"
	href="<c:url value="/resources/semantic-ui/semantic.min.css" />" />

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.css"
	rel="stylesheet" />

<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<!-- Sweet Alert 2 CDN -->
<script src="/resources/sweetalert.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<!-- Canvas JS -->
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"> </script>
<script>
//Canvas JS Plot
function loadChart(cname,ucid,ats) {
	console.log("loadCahrt called")
	console.log(ucid);
	var dataPts=[];
	for (var i = 0; i < ats.length; i++){
		console.log(ats[i]);
		var tempObj = {x:i+1,y:parseInt(ats[i].score)};
		dataPts.push(tempObj);
		}
	var chart = new CanvasJS.Chart("courseScoreChart"+ucid, {
		animationEnabled: true,
		theme: "light2",
		title:{
			text: cname+" course performace"
		},
		axisX:{
			  title:"Attempt number",
			  interval: 1,
			  minimum: 0,
			  maximum: 6
		},
		axisY:{
			  title:"Score in percentage",
			  maximum: 100,
			  stripLines: [{
					value: 70,
					label: "Pass Marks",
					color: "green",
			        labelFontColor: "green"
				}]
		},
		dataPointWidth: 60,
		data: [
		{        
			type: "column",
			color: "#69b4ac",
	      	indexLabelFontSize: 16,
			dataPoints: dataPts
		},
		{        
			type: "line",
			color: "blue",
	      	indexLabelFontSize: 16,
			dataPoints: dataPts
		}
		]
	});
	chart.render();

	}
</script>
<style>
.canvasjs-chart-credit{display:none;}
</style>
</head>
<body>
	<jsp:include page="../navbar/navbar.jsp" />
	<div class="ui container">
		<h1 class="ui header centered" style="margin-top: 110px">Dashboard</h1>
		<div class="ui divider"></div>
		<div class="ui grid centered">
			<div class="column two wide computer only"
				style="text-align: center;">

				<div class="ui rotate left reveal">
					<div class="visible content">
						<c:choose>
							<c:when test="${empty user.profilePicture}">
								<img src="/resources/images/profile.png"
									class="ui small bordered circular image">
							</c:when>
							<c:otherwise>
								<img src="/resources/profilePicture/${user.profilePicture}"
									class="ui small bordered circular image">
							</c:otherwise>
						</c:choose>
					</div>
					<div class="hidden content">
						<img onClick="editPicture(${user.id})"
							src="/resources/images/edit.png"
							class="ui small bordered circular image">
					</div>
					<h2 class="header">${pageContext.request.userPrincipal.name}</h2>
				</div>
			</div>
			<c:forEach var="cs" items="${coursescore}">
				<div id="courseScoreChart${cs.ucid}" style="height: 370px; width: 100%;"></div>
				<script>
					function getAttempts(){
					$.ajax({method:"GET", url:"http://localhost:8080/user/attempts/"+${cs.ucid}})
						.done(function(responseJson){
							if(responseJson.length>0){
								loadChart("${cs.cname}",${cs.ucid},responseJson);
							}
							else{
								$('#courseScoreChart'+${cs.ucid}).css('display','none');
							}
						})
						.fail(function(){
							console.log("failed");
						})
						.always(function(){
							console.log("always");
						});
					}
					getAttempts();
				</script>
			</c:forEach>

			<table class="ui celled table" style="font-size: 16pt;">
				<thead>
					<tr>
						<th>Course</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="cs" items="${coursescore}">
						<c:choose>
							<c:when test="${cs.status.equals('Passed') }">
								<tr class="positive">
									<td>${cs.cname }</td>
									<td>${cs.status }</td>
								</tr>
							</c:when>
							<c:when test="${cs.status.equals('Failed') }">
								<tr class="negative">
									<td>${cs.cname }</td>
									<td>${cs.status }</td>
								</tr>
							</c:when>
							<c:when test="${cs.status.equals('Enrolled') }">
								<tr class="disabled">
									<td>${cs.cname }</td>
									<td>Assessment not attempted</td>
								</tr>
							</c:when>
						</c:choose>

					</c:forEach>
				</tbody>
			</table>
			<br /> <br /> <a class="ui button teal" href="/enrolledcourses">
				<i class="angle left icon"></i>Enrolled Courses
			</a>
		</div>
	</div>
	<script>
	//Edit Question
	function editPicture(uid){
		console.log(uid);
	Swal.fire({
		  title: 'Edit Profile Picture',
		  html: `<br><form enctype="multipart/form-data" id="editProfilePicForm" method="POST" action="user/uploadProfilePicture">
		  <input type="hidden" id="editUid" name="editUid"/>
		  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		  
		  <div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text">Upload</span>
		  </div>
		  <div class="custom-file">
		  <label id="changePPLabel" class="custom-file-label" for="filePP">Choose Picture</label>
		    <input accept=".png,.jpg,.jpeg,.PNG,.JPG,.JPEG" onchange="loadFile(event)" name="file" type="file" class="custom-file-input" id="filePP">
		    
		  </div>
		</div>

		  </form>`,
		  confirmButtonText: 'Edit',
		  focusConfirm: false,
		  preConfirm: () => {
		    const editName = Swal.getPopup().querySelector('#filePP').value
		    if (!editName) {
		      Swal.showValidationMessage(`Please enter Lecture Name and Url`)
		    }
		    else{
			    document.getElementById("editProfilePicForm").submit();
			    Swal.fire("Profile picture changed","","success");
		    }	    
		    //return { login: login, password: password }
		  }
		}).then((result) => {
		  Swal.fire("Profile picture not changed","","error");
		})
		document.getElementById('editUid').value=uid;
	}
	
	var loadFile = function(event) {
		var x = document.getElementById('filePP').value;
		x = x.substring(x.lastIndexOf("\\") + 1, x.length);
		document.getElementById('changePPLabel').innerHTML=x;
		console.log(x);
	};
	
	//Code to replace the state of the question page so user can't visit coursepage after submitting the test and by going back to the previous page
	if (window.history.replaceState) {
		window.history.replaceState(null, null, window.location.href);
	}
	
	
	</script>
</body>
</html>