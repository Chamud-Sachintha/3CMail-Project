<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
           
           <button type="submit" name="action" class="form-control btn btn-warning rounded submit px-3" value="saveToDraft" onclick="form.action='SaveToDraft';">Save to Drafts</button>
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
<nav id="sidebar">
	<div class="custom-menu">
		<button type="button" id="sidebarCollapse" class="btn btn-primary">
         <i class="fa fa-bars"></i>
         <span class="sr-only">Toggle Menu</span>
     		</button>
    </div>
	<div class="p-4">
		<% 	
           	String k[] = new String(session.getAttribute("user").toString()).split("@");
           	String userName = k[0].substring(0, 1).toUpperCase() + k[0].substring(1,k[0].length()).toLowerCase();
           	
		%>
	  	<h1><a href="index.html" class="logo">3C-Mails <span>Feel Easy and Quick Communication</span></a></h1>
        <ul class="list-unstyled components mb-5">
          <li class="">
            <a href="#" data-toggle="modal" data-target="#exampleModalCenter"><span class="fa fa-plus mr-3"></span> Compose</a>
          </li>
          <li class="">
            <a href="dashboard.jsp"><span class="fa fa-home mr-3"></span> Home</a>
          </li>
          <li>
              <a href="inbox.jsp"><span class="fa fa-user mr-3"></span> Inbox</a>
          </li>
          <li>
             <a href="drafts.jsp"><span class="fa fa-briefcase mr-3"></span> Drafts</a>
          </li>
          <li>
             <a href="sentmails.jsp"><span class="fa fa-sticky-note mr-3"></span> Sent Mails</a>
          </li>
          <li>
             <a href="trash.jsp"><span class="fa fa-suitcase mr-3"></span> Trash</a>
          </li>
          <li>
             <a href="#"><span class="fa fa-cogs mr-3"></span> Services</a>
          </li>
          <li>
             <a href="logout.jsp"><span class="fa fa-paper-plane mr-3"></span> Log Out</a>
          </li>
        </ul>

        <div class="mb-5">
			<h3 class="h6 mb-3"><%=userName %></h3>
			<form action="#" class="subscribe-form">
	            <div class="form-group d-flex">
	            	<div class="icon"><span class="icon-paper-plane"></span></div>
	              <input type="text" class="form-control" placeholder="Enter Email Address">
	            </div>
          	</form>
		</div>

        <div class="footer">
        	<p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
			  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib.com</a>
			  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
     	</div>
  	</div>
</nav>
</body>
</html>