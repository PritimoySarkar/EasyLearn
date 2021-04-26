<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
	/* body {
  min-height: 2000px;
} */
body > .ui.container {
  margin-top: 6em;
}
.offices {
  color: #fff;
}
.flags a {
  padding: .012em;
}
/* Nav */
.ui.fixed.borderless.menu {
  background-color: teal;
}

.ui .computer.only .item {
  color: #fff;
}

.ui.fixed.borderless.menu .row > a.header.item {
  font-size: 1.4em;
}


.easy-learn, .easy-learn:hover {
	color: white !important;
	background-color: teal !important;
	
}

</style>
</head>
<body>
	<!--Start: Nav  -->
<div class="ui fixed borderless menu">
  
  <div class="ui container grid">
    
    <!--Start: Desktop Nav-->
    <div class="computer only row">
      <a class="header item easy-learn" style="font-size:2rem">Easy Learn</a>
      
      
      
    </div>
    <!--End: Desktop Nav-->
    
    <!--Start: Mobile Nav-->
    <div class="tablet mobile only row">
      <a class="header item easy-learn">Easy Learn</a>
    </div>
  </div>
</div>
</body>
</html>