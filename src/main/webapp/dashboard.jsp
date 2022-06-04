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
<title>Insert title here</title>
</head>
<body>
	<h1>This is Dashboard.</h1>
</body>
</html>