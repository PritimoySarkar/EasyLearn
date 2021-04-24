<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="resource/modal-video.min.css">
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="resource/modal-video.js"></script>
<title>EasyLearn | All Courses</title>

</head>
<body
	style="background-image: url('/resources/images/bg.jpg'); background-blend-mode: luminosity">
	<div style="text-align: center; background-color: #86ca96">
		<h1
			style="background-color: white; color: #007bff; font-family: 'Brush Script MT', cursive; font-size: 60pt">Welcome
			to EasyLearn</h1>
		<h2
			style="font-family: Comic Sans MS, serif; color: #053971; font-size: 30pt">${cname}
			course for beginners</h2>
	</div>

	<div>
		<div class="container">
			<table class="table table-primary"
				style="border-radius: 30px 30px 30px">
				<thead>
					<tr class="bg-success">
						<th scope="col">Sl No.</th>
						<th scope="col">Chapters</th>
						<th>Play Options</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="lecture" items="${lectures}">
						<tr style="padding: 10px">
							<td scope="col"><h4>${lecture.slno}</h4></td>
							<td scope="col"><h5>${lecture.lname}</h5></td>
							<td>
								<!-- Button trigger modal -->
								<button type="button" class="btn btn-primary"
									data-toggle="modal"
									data-target="#exampleModalCenter${lecture.slno}">Play
									Video</button> <!-- Modal -->
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
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td><h4>Q.</h4></td>
						<td><h4>Quiz for ${cname} Course</h4></td>
						<td>
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#quizModal">Start Quiz</button> 
								
								<!-- Modal -->
							<div class="modal fade" id="quizModal"
								tabindex="-1" role="dialog"
								aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered"
									role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLongTitle" style="color:blue">Are You Sure?</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<h1 style="color:green">Do you want to start the Quiz?</h1>
										</div>
										<div class="modal-footer">
										<button type="button" onClick="window.location='/course/${quiz.qid}/quiz'" class="btn btn-primary">
										Yes
										</button>
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">No</button>
											
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<script>
		document.getElementById('b1').onclick = function() {

			//swal("Here's a message!");
		};
		//swal("Hello world!");
	</script>
</body>
</html>