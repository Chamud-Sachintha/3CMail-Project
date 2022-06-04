<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>RegistrationForm_v10 by Colorlib</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- LINEARICONS -->
<link rel="stylesheet" href="register/fonts/linearicons/style.css">

<!-- STYLE CSS -->
<link rel="stylesheet" href="register/css/style.css">


<!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Source+Sans+Pro:ital,wght@0,300;0,400;0,600;0,700;1,300;1,400;1,600;1,700&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Variables CSS Files. Uncomment your preferred color scheme -->
  <link href="assets/css/variables.css" rel="stylesheet">
  <!-- <link href="assets/css/variables-blue.css" rel="stylesheet"> -->
  <!-- <link href="assets/css/variables-green.css" rel="stylesheet"> -->
  <!-- <link href="assets/css/variables-orange.css" rel="stylesheet"> -->
  <!-- <link href="assets/css/variables-purple.css" rel="stylesheet"> -->
  <!-- <link href="assets/css/variables-red.css" rel="stylesheet"> -->
  <!-- <link href="assets/css/variables-pink.css" rel="stylesheet"> -->

  <!-- Template Main CSS File -->
  <link href="assets/css/main.css" rel="stylesheet">
  
  <style>
  	.reg_btn_cstm{
		border: none;
		width: 100%;
		height: 49px;
		margin-top: 30px;
		cursor: pointer;
		display: flex;
		align-items: center;
		justify-content: center;
		padding: 0;
		background: #99ccff;
		color: #fff;
		text-transform: uppercase;
		font-family: "Muli-SemiBold";
		font-size: 15px;
		letter-spacing: 2px;
		transition: all 0.5s;
		position: relative;
		overflow: hidden;
	}
  </style>

</head>
<body style="overflow-y: hidden;">
	<div class="wrapper">
		<%@include file="header/header.jsp" %>
		<div class="inner">
			<img src="register/images/image-1.png" alt="" class="image-1">
			<form action="RegisterUser" style="margin-top: 10%;" method="post">
				<%
					if(request.getAttribute("status") != null){
						out.print("<h4>" + request.getAttribute("status") + "</h4>");
					}
				%>
				<h3>New Account?</h3>
				<div class="form-holder">
					<input type="text" class="form-control" placeholder="Username" name="username">
				</div>
				<div class="form-holder">
					<input type="text" class="form-control" placeholder="Address" name="address">
				</div>
				<div class="form-holder">
					<input type="text" class="form-control" placeholder="Contact Number" name="contactNumber">
				</div>
				<div class="form-holder">
					<input type="password" class="form-control" placeholder="Password" name="password">
				</div>
				<div class="form-holder">
					<input type="password" class="form-control" placeholder="Confirm Password" name="confPassword">
				</div>
				<div>
					<input type="submit" value="Register" class="reg_btn_cstm">
				</div>
			</form>
			<img src="images/image-2.png" alt="" class="image-2">
		</div>
	
	</div>
	
  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/main.js"></script>
	
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
</body>
</html>