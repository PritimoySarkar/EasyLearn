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

.menu-item {
	color: white !important;
	margin-left: 10px;
	margin-right: 10px;
}

.menu-item:hover{
  background-color: #5f9ea0 !important;
  color: #fff !important;
  border-bottom: 2px solid white;
}

.easy-learn, .easy-learn:hover {
	color: white !important;
	background-color: teal !important;
	
}

/* Mobile */
/* .tablet.mobile.only .header, .ui.icon.button > .icon {
  color: #fff;
} */
</style>
</head>
<body>
	<!--Start: Nav  -->
<div class="ui fixed borderless menu">
  
  <div class="ui container grid">
    
    <!--Start: Desktop Nav-->
    <div class="computer only row">
      <a class="header item easy-learn" style="font-size:2rem">Easy Learn</a>
      <a class="item menu-item">All Courses</a>
      <a class="item menu-item">Dashboard</a>
      
      
      
    </div>
    <!--End: Desktop Nav-->
    
    <!--Start: Mobile Nav-->
    <div class="tablet mobile only row">
      <a class="header item easy-learn">Easy Learn</a>
      <a class="item menu-item">All Courses</a>
      <a class="item menu-item">Dashboard</a>
      <!-- <div class="right menu">
        <a class="menu item">
          <div class="ui basic icon toggle button">
            <i class="content icon"></i>
          </div>
        </a>
      </div> -->
    </div>
    <!--End: Mobile Nav-->
  </div>
</div>
</body>
</html>