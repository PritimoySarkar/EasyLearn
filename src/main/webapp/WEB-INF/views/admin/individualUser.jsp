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
function loadProgress(cname,ucid,count){
	var dataPts=[];
	if(count.Completed>0) dataPts.push({y:count.Completed,label:"Completed"});
	if(count.Progress>0) dataPts.push({y:count.Progress,label:"In Progress"});
	if(count.Review>0) dataPts.push({y:count.Review,label:"Marked for Review"});
	if(count.Unexplored>0) dataPts.push({y:count.Unexplored,label:"Unexplored"});
	var chart = new CanvasJS.Chart("chartContainer_"+ucid, {
		animationEnabled: true,
		title:{
			text: cname+" course progress"
		},
		data: [{
			type: "doughnut",
			startAngle: 60,
			//innerRadius: 60,
			indexLabelFontSize: 17,
			indexLabel: "{label} - #percent%",
			toolTipContent: "<b>{label}:</b> {y} (#percent%)",
			dataPoints: dataPts
		}]
	});
	chart.render();
}

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
.canvasjs-chart-credit {
	display: none;
}
</style>
</head>
<body>
	<jsp:include page="../navbar/adminNavbar.jsp" />
	<div class="ui container">
		<h1 class="ui header centered" style="margin-top: 110px">Profile</h1>
		<div class="ui divider"></div>
		<div class="ui grid centered">
			<div class="column two wide computer only"
				style="text-align: center;">

				<div>
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
					
					<h2 class="header">${pageContext.request.userPrincipal.name}</h2>
				</div>
			</div>

			<div style="text-align:center;" class="column sixteen wide center">
				<!-- Button trigger modal -->
				<button type="button" class="btn ui medium button teal" data-toggle="modal"
					data-target="#exampleModalLong">Show overall status</button>

				<!-- Modal -->
				<div class="modal fade" id="exampleModalLong" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLongTitle"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLongTitle">Overall Performance</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
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
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>

			<c:forEach var="cs" items="${coursescore}">
				<div id="status-div_${cs.ucid}" class="column sixteen wide">
					<div class="cname_div" style="display: none;">${cs.cname}</div>
					<div class="ucid_div" style="display: none;">${cs.ucid}</div>
					<h4 id="divider_${cs.ucid}" class="ui horizontal divider header">
						<i class="bar chart icon"></i>Performance Analysis
					</h4>
					<div id="chartContainer_${cs.ucid}"
						style="height: 370px; width: 100%;"></div>
					<div id="courseScoreChart${cs.ucid}"
						style="height: 370px; width: 100%;"></div>
					<script>
				function getProgress(){
					$.ajax({method:"GET", url:"http://localhost:8080/user/progress/"+${cs.ucid}})
						.done(function(responseJson){
							console.log(responseJson)
							loadProgress("${cs.cname}",${cs.ucid},responseJson);
						})
						.fail(function(){
							console.log("failed");
						})
						.always(function(){
							console.log("always");
							
						});
					}
					getProgress();
					
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
				</div>
			</c:forEach>
			
			<br /> <br />
		</div>
	</div>
	<script>	
	//Showing course depending on search result
	var ids = document.getElementsByClassName("ucid_div");
	var names = document.getElementsByClassName("cname_div");	
	$('#search').on("input", function(){
		var search = $('#search').val();
		console.log(search);
		for (let i = 0; i < names.length; i++) {
	        if(names[i].innerHTML.toLowerCase().includes(search.toLowerCase())){
	        	$('#status-div_'+ids[i].innerHTML).css("display","block");
	        }
	        else{
	        	$('#status-div_'+ids[i].innerHTML).css("display","none");
	        }
	    }
	});
	</script>
</body>
</html>