<%
	if(session.getAttribute("user") == null){
		request.setAttribute("status", "Please Login Before Access the Dashboard.");
		RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
		rd.include(request, response);
	}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Sidebar 05</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="admin/css/style.css">
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
	
	<link rel="stylesheet" href="compose/css/ionicons.min.css">
	<link rel="stylesheet" href="compose/css/style.css">
	<style>
		body{
		  animation: true,
		  autohide: true,
		  delay: 500
		}
		
	</style>
</head>
<body>
	<!-- model starts here -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close d-flex align-items-center justify-content-center" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true" class="ion-ios-close"></span>
	        </button>
	      </div>
	      <div class="modal-body p-4 py-5 p-md-5">
	      	<h3 class="text-center mb-3">Compose New Email.</h3>
	      	
	      	<form action="SendEmail" class="signup-form" method="post">
	      		<div class="form-group mb-2">
	      			<label for="name">To.</label>
	      			<input type="text" class="form-control" placeholder="John Doe" name="emailTo" required>
	      		</div>
	      		<div class="form-group mb-2">
	      			<label for="emailSubject">Subject.</label>
	      			<input type="text" class="form-control" placeholder="johndoe@gmail.com" name="emailSubject" required>
	      		</div>
            <div class="form-group mb-2">
            	<label for="emailMessage">Message.</label>
              	<textarea rows="5" cols="10" class="form-control" name="emailMessage" required></textarea>
            </div>
            <div class="form-group mb-2">
            	<button type="submit" class="form-control btn btn-primary rounded submit px-3">Send Email</button>
            </div>
            
          </form>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- model ends here -->
	
	<!-- status model starts here -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close d-flex align-items-center justify-content-center" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true" class="ion-ios-close"></span>
	        </button>
	      </div>
	      <div class="modal-body p-4 py-5 p-md-5">
	      	<h3 class="text-center mb-3">Compose New Email.</h3>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- status model ends here -->

	<div class="wrapper d-flex align-items-stretch">
		<%@include file="header/admin_header.jsp" %>
        <!-- Page Content  -->
		<div id="content" class="p-4 p-md-5 pt-5">
			<%
				if(request.getParameter("status") != null){
			%>
				<!-- status model starts here -->
				<div class="alert alert-success" role="alert">
				  <a href="#" class="close" data-dismiss="alert" aria-label="close">X</a>
				  	<% out.print(request.getParameter("status")); %>
				</div>
				<!-- status model ends here -->
			<%
				}
			%>
		
			<h2 class="mb-4">Sidebar #05</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
		</div>
	</div>
	
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="admin/js/popper.js"></script>
    <script src="admin/js/jquery.min.js"></script>
    <script src="admin/js/bootstrap.min.js"></script>
    <script src="admin/js/main.js"></script>
    <script src="compose/js/main.js"></script>
</body>
</html>