<%
	if(session.getAttribute("user") != null){
		response.sendRedirect("dashboard.jsp");
	}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

<link rel="stylesheet" href="login/fonts/icomoon/style.css">

<link rel="stylesheet" href="login/css/owl.carousel.min.css">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="login/css/bootstrap.min.css">

<!-- Style -->
<link rel="stylesheet" href="login/css/style.css">

<title>Insert title here</title>
</head>
<body>
	<div class="content">
	    <div class="container">
	      <div class="row">
	        <div class="col-md-6">
	          <img src="login/images/undraw_remotely_2j6y.svg" alt="Image" class="img-fluid">
	        </div>
	        <div class="col-md-6 contents">
	          <div class="row justify-content-center">
	            <div class="col-md-8">
	            	<%
	            		if(request.getAttribute("status") != null){
	            	%>
		         		<!-- status model starts here -->
						<div class="alert alert-danger" role="alert">
						  <a href="#" class="close" data-dismiss="alert" aria-label="close">X</a>
						  	<% out.print(request.getAttribute("status")); %>
						</div>
						<!-- status model ends here -->
					<%
	            		}
					%>
	              <div class="mb-4">
	              <a href="index.jsp">Go Back To the Home Page</a>
	              <h3>Sign In</h3>
	              <p class="mb-4">Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.</p>
	            </div>
	            <form action="LoginUser" method="post">
	              <div class="form-group first">
	                <label for="username">Username</label>
	                <input type="text" class="form-control" name="username">
	
	              </div>
	              <div class="form-group last mb-4">
	                <label for="password">Password</label>
	                <input type="password" class="form-control" name="password">
	                
	              </div>
	              
	              <div class="d-flex mb-5 align-items-center">
	                <label class="control control--checkbox mb-0"><span class="caption">Remember me</span>
	                  <input type="checkbox" checked="checked"/>
	                  <div class="control__indicator"></div>
	                </label>
	                <span class="ml-auto"><a href="#" class="forgot-pass">Forgot Password</a></span> 
	              </div>
	
	              <input type="submit" value="Log In" class="btn btn-block btn-primary">
	
	              <span class="d-block text-left my-4 text-muted">&mdash; Don't Have an Account ?  &nbsp;&nbsp; <a href="register.jsp">Register Here</a> &mdash;</span>
	            </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <script src="login/js/jquery-3.3.1.min.js"></script>
  <script src="login/js/popper.min.js"></script>
  <script src="login/js/bootstrap.min.js"></script>
  <script src="login/js/main.js"></script>
</body>
</html>