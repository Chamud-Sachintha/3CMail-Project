<%@page import="com.infoseek.bootcamp.service.EmailService"%>
<%@page import="com.infoseek.bootcamp.dto.EmailDTO" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

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
</head>
<body>
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
		
			<h2 class="mb-4">Inbox</h2>
			<div style="padding: 1rem 0;">
    			<table class="table ">
    				<tr>
    					<th>#</th>
    					<th>From</th>
    					<th>Subject</th>
    					<th>Message</th>
    					<th>Actions</th>
    				</tr>
    				
				    <%
					    List<EmailDTO> currentEmails = EmailService.getListOfEmails(session.getAttribute("user").toString()); 
					    for(int i=0; i<currentEmails.size(); i++){
					%>
				        <tr>
				        	<td><%= i %></td>
				            <td><%= currentEmails.get(i).getEmailFrom() %></td>
				            <td><%= currentEmails.get(i).getEmailSubject() %></td>
				            <td><%= currentEmails.get(i).getEmailMessage().substring(0, 30) + " ..." %></td>
				            <td>
				            	<form action="MoveToTrash" method="post">
				            		<input type="hidden" value=<%= currentEmails.get(i).getEmailId() %> name="emailId">
				            		
				            		<button type="submit" class=btn><i class='fa fa-trash'></i></button>
				            		<button type="submit" name="action" value="viewMail" onclick="form.action='ViewMail';" class=btn><i class='fa fa-eye'></i></button>
				            	</form>
				            </td>
				        </tr>
				    <%
				    	}
				    %>
    				
    			</table>
    		</div>
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