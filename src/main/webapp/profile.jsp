<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.blogging.entities.User"%>
<%@page errorPage="ErrorPage.jsp"%>
<%@page import="com.blogging.entities.Message"%>
<%@page import="com.blogging.dao.PostDao"%>
<%@page import="com.blogging.helper.ConnectionProvider"%>
<%@page import="com.blogging.entities.Category"%>
<%@ page import="java.util.*"%>



<!-- valiation for checkking if user is login or not-->
<%
User user = (User) session.getAttribute("currentUser");

if (user == null) {
	response.sendRedirect("Login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blogging Profile</title>
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

.custom-modal-header {
	height: 60px; /* Adjust the height as needed */
}
.list-group-item.active {
    background-color: #333 !important;
    border-color: #333 !important;
    
}/* Make navbar static when scrolling */
.nav-abc {
    position: fixed;
    top: 0;
    width: 100%;
    z-index: 1000; /* Ensure it stays on top of other content */
    /* Ensure it has a background color when scrolling */
}
/* Default styles for larger screens (desktop and tablets) */
.profile-bar {
    position: fixed;
    top: 60px; /* Adjust based on navbar height */
    width: 25%; /* Take up 1/3 of the width */
}

/* Styles for mobile devices (screens narrower than 768px) */
@media (max-width: 767.98px) {
    .profile-bar {
        position: relative;
        width: 100%; /* Full width on mobile */
        top: auto;
    }
}
/* Add some padding to the top of the page content to prevent it from being hidden behind the navbar */
body {
    padding-top: 56px; /* Adjust based on the height of your navbar */    
    width: 100%;
    text-align: center;
    background-attachment: fixed; /* Makes the background fixed */
    background-size: cover; /* Ensures the background image covers the entire area */
    background-repeat: no-repeat; /* Prevents the background from repeating */
}

</style>

</head>
<body>
	<!-- Navbar -->
	<nav class=" nav-abc navbar navbar-expand-lg navbar-dark primary-background2">
		<a class="navbar-brand" href="index.jsp"> <span class="fa fa-bolt"></span>Blogging
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#"> <span
						class="fa fa-graduation-cap"></span>Learn with Arsh<span
						class="sr-only">(current)</span></a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-toggle="dropdown" aria-expanded="false"> <span
						class="fa fa-bars"></span> Categories
				</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">Programming in Java</a> <a
							class="dropdown-item" href="#">Full Stack</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Data Structure Using Java</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#"> <span
						class="fa fa-address-book"></span>Contact
				</a></li>
				<li class="nav-item" data-toggle="modal"
					data-target="#add-post-modal"><a class="nav-link" href="#">DoPost
						<span class="fa fa-upload"></span>
				</a></li>

			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a href="#!" class="nav-link "
					data-toggle="modal" data-target="#profile-modal"> <span
						class="fa fa-user-circle"></span><%=user.getName()%></a></li>
				<li class="nav-item"><a href="Logout" class="nav-link "> <span
						class="fa fa-user-plus"></span>Logout
				</a></li>
			</ul>
		</div>
	</nav>

	<!-- end of navbar -->

	<%
	Message m = (Message) session.getAttribute("msg");
	if (m != null) {
	%>
	<div class="alert <%=m.getCssClass()%>" role="alert">
		<%=m.getContent()%>
	</div>
	<%
	session.removeAttribute("msg");
	}
	%>

	<!-- main content -->

<main >
    <div class="container">
        <div class="row mt-4">
            <!-- first col -->
            <div class="col-md-4 ">
                <!-- categories -->
                <div class="list-group profile-bar ">
                    <a href="#" onclick="getPosts(0, this)" class="c-link list-group-item list-group-item-action active"
                        aria-current="true" id="allPosts" style=" border-color: #7952b3;"> All Posts </a>
                    <%
                    PostDao pd = new PostDao(ConnectionProvider.getConnection());
                    ArrayList<Category> list1 = pd.getAllCategories();

                    for (Category cc : list1) {
                    %>
                    <!-- calling getPosts js function below -->
                    <a href="#" onclick="getPosts(<%= cc.getcId()%>, this)" class="c-link list-group-item list-group-item-action"><%=cc.getcName()%></a>

                    <%
                    }
                    %>

                </div>
            </div>
            
            <!-- second col -->
            <div class="col-md-8 d-flex justify-content-center align-items-center" style="min-height: 200px;">
                <!-- posts -->
                <div class="text-center" id="loader" style="">
                    <i class="fa fa-refresh fa-4x fa-spin " ></i>
                    <p class="mt-2">Loading........</p>
                </div>
                <div class="container-fluid" id="post-container"></div>
            </div>
        </div>
    </div>
</main>

	<!-- main content end-->


	<!-- profile Modal -->
	<!-- Button trigger modal -->


	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header d-flex align-items-center primary-background2 text-white py-2 custom-modal-header">
					<div class="w-100 text-center">
						<h5 class="modal-title mb-0" id="exampleModalLabel">Technical
							Blogging</h5>
					</div>
					<button type="button" class="close ml-2" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: #fff">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="pics/<%=user.getProfile()%>" class="img-fluid"
							style="border-radius: 50%; max-width: 100px"><br>
						<h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName()%></h5>
						<!-- table -->
						<div id="profile-details">
							<table class="table">

								<tbody>
									<tr>
										<th scope="row">ID:</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">NAME:</th>
										<td><%=user.getName()%></td>

									</tr>
									<tr>
										<th scope="row">EMAIL:</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">GENDER:</th>
										<td><%=user.getGender()%></td>

									</tr>
									<tr>
										<th scope="row">ABOUT:</th>
										<td><%=user.getAbout()%></td>

									</tr>
									<tr>
										<th scope="row">Registered Date:</th>
										<td><%=user.getRdate()%></td>

									</tr>
								</tbody>
							</table>
						</div>
						<!-- profile editing -->
						<div id="profile-edit" style="display: none">
							<h4>Please edit carefully</h4>
							<form action="EditServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>ID:</td>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<td>Email:</td>
										<td><input type="email" name="user_Email"
											class="form-control" value="<%=user.getEmail()%>"></td>
									</tr>
									<tr>
										<td>Name:</td>
										<td><input type="text" name="user_Name"
											class="form-control" value="<%=user.getName()%>"></td>
									</tr>
									<tr>
										<td>Password:</td>
										<td><input type="password" name="user_Password"
											class="form-control" value="<%=user.getPassword()%>"></td>
									</tr>
									<tr>
										<td>Gender:</td>
										<td><%=user.getGender().toUpperCase()%></td>
									</tr>
									<tr>
										<td>About:</td>
										<td><textarea rows="2" name="user_About"
												class="form-control">
										<%=user.getAbout()%>
										</textarea></td>
									</tr>
									<tr>
										<td>New Profile:</td>
										<td><input type="file" name="image" class="form-control"></td>
									</tr>
								</table>

								<div class="container">
									<button type="submit" class="btn text-white" style="background-color:#7952b3">Save</button>
								</div>

							</form>
						</div>

					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-btn" type="button" class="btn text-white primary-background2">Edit</button>
				</div>
			</div>
		</div>
	</div>

	<!-- end details Modal -->

	<!-- post Modal -->

	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header primary-background2" >
					<h5 class="modal-title" id="exampleModalLabel" style="color: #fff;">Post
						Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: #fff">&times;</span>
					</button>

				</div>
				<div class="modal-body">
					<form id="add-post-form" action="AddPostServlet" method="post">

						<div class="form-group">
							<select name="cid" class="form-control" id="cid">
								<option selected>--Select Categories--</option>

								<%
								PostDao p = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = p.getAllCategories();
								for (Category ct : list) {
								%>
								<option value="<%=ct.getcId()%>"><%=ct.getcName()%></option>
								<%
								}
								%>
							</select>
						</div>

						<div class="form-group">
							<input name="postTitle" class="form-control" type="text"
								placeholder="Enter Title here..." />
						</div>

						<div class="form-group">
							<textarea name="postContent" class="form-control"
								placeholder="Enter content here..." style="height: 150px"></textarea>
						</div>
						<div class="form-group">
							<textarea name="postCode" class="form-control"
								style="height: 150px"
								placeholder="Please provide coding part(if any)"></textarea>
						</div>
						<div class="form-group">
							<label>Select pic...</label> <input name="postPic" type="file" /><br>
						</div>
						<div class="container text-center">
							<button type="submit" class="btn text-white primary-background2" >Post</button>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- end post modal -->

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

	<script type="text/javascript">
		$(document).ready(function() {

			let editStatus = false;
			$('#edit-profile-btn').click(function() {

				if (editStatus == false) {
					$('#profile-details').hide();

					$('#profile-edit').show();
					editStatus = true;
					$(this).text("Back");
				} else {
					$('#profile-details').show();

					$('#profile-edit').hide();
					editStatus = false;
					$(this).text("Edit");

				}

			})
		})
	</script>
	<!-- now add postjs  -->
	<script type="text/javascript">
		$(document)
				.ready(
						function(e) {

							$("#add-post-form")
									.on(
											"submit",
											function(event) {
												event.preventDefault();

												// Create a FormData object and populate it with the form fields
												let form = new FormData(this);

												$
														.ajax({
															url : "AddPostServlet",
															type : "POST",
															data : form,
															success : function(
																	data,
																	textStatus,
																	jqXHR) {

																console
																		.log(data);

																if (data.trim() == 'done') {
																	swal(
																			"Excellent!",
																			"saved Successfully!",
																			"success");
																} else {
																	swal(
																			"Alert!",
																			"Something went wrong! please try again...",
																			"error");

																}
															},

															error : function(
																	jqXHR,
																	textStatus,
																	errorThrown) {

																swal(
																		"Alert!",
																		"Something went wrong! please try again...",
																		"error");
															},
															processData : false,
															contentType : false
														});
											});
						});
	</script>



	<!-- Loading posts using AJAX -->
<script type="text/javascript">
    function getPosts(catId, temp) {
        $("#loader").show();
        $("#post-container").hide();

        // Remove active class and reset styles for all links for hovering on list
        $(".c-link").removeClass('active').css({
            'background-color': '',
            'border-color': ''
        });

        $.ajax({
            url: "LoadPosts.jsp",
            data: { cId: catId },
            success: function(data, textStatus, jqXHR) {
                console.log(data);
                $("#loader").hide();
                $("#post-container").show();
                $("#post-container").html(data);

                // Add active class and apply styles to the clicked link
                $(temp).addClass('active').css({
                    'background-color': '#7952b3',
                    'border-color': '#7952b3'
                });
            }
        });
    }

    $(document).ready(function(e) {
        let allPostReference = $(".c-link")[0];
        getPosts(0, allPostReference);
    });
</script>

<!-- end of post link -->





</body>
</html>