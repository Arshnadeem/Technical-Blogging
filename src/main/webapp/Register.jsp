<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<!-- CSS -->

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css">
<link href="css/Regiter.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.sub {
	background-color: transparent;
	border: 1.5px solid black;
	padding: 0.5rem 1rem; /* Adjust padding as needed */
	display: inline-block; /* Ensure the container behaves correctly */
	transition: background-color 0.3s, color 0.3s; /* Smooth transition */
	border-radius: 4px; /* Rounded corners for the container */
}

.bgcl{
background-color: #7952b3;
padding-bottom: 80px;
 margin-top: 1px; 
 height: 93vh;
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
margin-top: 5vh;
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
                <a href="Login.jsp" class="nav-link">
                    <span class="fa fa-user-circle-o"></span>Login
                </a>
            </li>
            
        </ul>
    </div>
</nav>

	<main class=" bgcl"
		style="padding-bottom: 80px; margin-top: 0px; height: 94vh;">
		<div class="container">
			<div class="row">
				<div class="col-md-8 offset-md-2 ">
					<div class="card crd-styl" style=" background-color:#F5F5F5; border-radius: 10px;">
						<div
							class="card-header text-center text-white" style="background-color:#333; border-radius: 10px;">
							<span class="fa fa-user-plus fa-2x"></span><br> Register
						</div>
						<div class="card-body">
							<form id="reg-form" action="Register" method="post">
								<div class="form-group">
									<label for="exampleInputName1">User name</label> <input
										name="userName" type="text" class="form-control"
										id="exampleInputName1" aria-describedby="nameHelp">
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										name="userEmail" type="email"
										class="form-control form-control-sm" id="exampleInputEmail1"
										aria-describedby="emailHelp"> <small id="emailHelp"
										class="form-text text-muted">Your email is protected</small>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										name="userPassword" type="password"
										class="form-control form-control-sm"
										id="exampleInputPassword1">
								</div>
								<div class="form-group">
									About
									<textarea name="userAbout" class="form-control form-control-sm"
										cols="5" placeholder="Enter something about yourself"></textarea>
								</div>
								<div class="form-group">
									<input type="radio" name="gender" value="Male"> Male <input
										type="radio" name="gender" value="Female"> Female
								</div>
								<div class="form-group form-check">
									<input name="userCheck" type="checkbox"
										class="form-check-input" id="exampleCheck1"> <label
										class="form-check-label" for="exampleCheck1">Terms and
										conditions</label>
								</div>
								<div class="container text-center" id="loader"
									style="display: none;">
									<span class="fa fa-refresh fa-spin fa-3x"></span>

									<h4>Please wait...</h4>
								</div>
								<div class="container">

									<div class="row justify-content-center">
										<div class="col-auto">
											<div
												class="sub d-flex justify-content-center align-items-center">
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


	<!-- javascript -->
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
	<script>
			$(document).ready(function(){
				console.log("loaded.........")
				
				$('#reg-form').on('submit',function(event){
					event.preventDefault();
						
						let form = new FormData(this);
						$('#submit-btn').hide();
						$('#loader').show();
					
					//send this form to RegisterServlet
					$.ajax({
						url: "Register",
						type:'POST',
						data: form,
						success: function(data,textStatus,jqXHR){
							console.log(data)
							$('#submit-btn').show();
							$('#loader').hide();
							
							if(data.trim() === "done"){
								swal("Registered successfully..Click OK to redirect to login page")
								.then((value) => {
								  window.location = "Login.jsp"
								});
							}else{
								swal(data);
							}
							
							
						
						},
						error: function(jqXHR, textStatus, errorThrown){
							console.log(jqXHR)
							$('#submit-btn').show();
							$('#loader').hide();
							
							swal("something went wrong");
						
						},
						processData: false,
						contentType: false
						
					});
					
				});
				
			});
			
	
	</script>
</body>
</html>