<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.blogging.entities.Message"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<!-- CSS -->

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link href="css/mystyleLogin.css" rel="stylesheet" type="text/css">
<link href="css/mystyle.css" rel="stylesheet" type="text/css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>


.sub {
	background-color: transparent;
	border: 1px solid black;
	padding: 0.5rem 1rem; /* Adjust padding as needed */
	display: inline-block; /* Ensure the container behaves correctly */
	transition: background-color 0.3s, color 0.3s; /* Smooth transition */
	border-radius: 4px; /* Rounded corners for the container */
}

.sub:hover {
	background-color: #7952b3;
	color: white;
}

.sub button {
	background-color: transparent;
	border: none;
	color: inherit; /* Inherit color from parent */
	padding: 0; /* Remove default padding/margins */
	font: inherit; /* Inherit font styling from parent */
	border-radius: 4px; /* Rounded corners for the button */
}

.sub:hover button {
	color: white;
	cursor: pointer;
}

.crd-styl{

background-color:#F5F5F5; 
height:105%; 
border-radius: 10px;

}

</style>
</head>
<body>

	
<nav class="navbar navbar-expand-lg navbar-dark primary-background2">
    <a class="navbar-brand" href="index.jsp"> <span class="fa fa-bolt"></span>Blogging</a>
   

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#"> <span class="fa fa-graduation-cap"></span>Learn with Arsh <span class="sr-only">(current)</span></a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="https://arshnadeem.github.io/myself/"> <span class="fa fa-address-book"></span>Contact</a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a href="Register.jsp" class="nav-link">
                    <span class="fa fa-user-plus"></span>SignUp
                </a>
            </li>
        </ul>
    </div>
</nav>

	<main
		class="d-flex align-items-center "
		style="height: 93.5vh; background-color: #7952b3; margin-top: 0px;">
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-md-3" >
					<div class="card crd-styl">
						<div class="card-header text-center primary-background2" style="border-radius: 10px;">
							<span class="fa fa-2x fa-user-circle"></span>
							<p>Login here</p>
						</div>
						<%
						Message m = (Message) session.getAttribute("msg");
						if (m != null) {
						%>
						<div class="alert <%=m.getCssClass() %>" role="alert">
							<%= m.getContent()  %>
							</div>
						<%
						
						     session.removeAttribute("msg");
						  }
						%>
						<div class="card-body " style="margin-top:5%;">
							<form id="log-form" action="Login" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										name="email" required type="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp">
									<small id="emailHelp" class="form-text text-muted">Your
										email is protected</small>
								</div>
								<div class="form-group" style="margin-top:5%;">
									<label for="exampleInputPassword1">Password</label> <input
										name="password" required type="password" class="form-control"
										id="exampleInputPassword1">
								</div>
								<div class="container " style="margin-top:5%;">
									<div class="row justify-content-center" >
										<div class="col-auto" >
											<div
												class="sub d-flex justify-content-center align-items-center" >
												<button id="submit-btn" type="submit" class="btn btn-sm">Submit</button>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<!-- javascript and jquery -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
		integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"
		crossorigin="anonymous"></script>
	<script src="js/myjs.js" type="text/javascript"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
		type="text/javascript"></script>

</body>
</html>