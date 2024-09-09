<%@page import="com.blogging.entities.Posts"%>
<%@page import="java.util.List"%>
<%@page import="com.blogging.helper.ConnectionProvider"%>

<%@page import="com.blogging.dao.*"%>
<%@page import="com.blogging.entities.User"%>
 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blogging Posts</title>
<style>
body, .card-body, .no-posts-container {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", "Liberation Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
}

.card {
    height: 400px; /* Set a fixed height for the card */
    display: flex;
    flex-direction: column;
    overflow: hidden; /* Hide overflowing content */
}

.card-img-top {
    height: 180px; /* Adjust the height of the image */
    object-fit: cover; /* Ensure the image covers the area without distortion */
}

.card-body {
    flex-grow: 1;
    overflow: hidden; /* Hide overflowing content in the body */
    padding: 15px;
    text-overflow: ellipsis; /* Add ellipsis if the content is too long */
}

.card-footer {
    background-color: #f8f9fa;
    padding: 10px;
    text-align: center;
    border-top: 1px solid rgba(0, 0, 0, 0.125);
    margin-bottom: 10px; /* Add margin at the bottom of the footer */
}


.no-posts-container {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 20vh; /* Adjust as necessary */
    background-color: #f8f9fa; /* Light background to highlight the message */
    color: #495057; /* Darker text for contrast */
    border: 2px dashed #6c757d; /* Optional: dashed border to indicate emptiness */
    border-radius: 8px; /* Optional: rounded corners */
    margin: 0 auto; /* Center the div horizontally */
    width: 60%; /* Increase width to 60% of the parent container */
}

.no-posts-container h3 {
    margin: 0;
    font-size: 1.5rem; /* Adjust font size as needed */
    text-align: center;
}

</style>
<script src="js/myjs.js?v=1" type="text/javascript"></script>
</head>

<div class="row">
	<%
	User uu = (User)session.getAttribute("currentUser");
	PostDao dao = new PostDao(ConnectionProvider.getConnection());
	List<Posts> posts = null;
	int cid = Integer.parseInt(request.getParameter("cId"));
	if(cid == 0){
		posts = dao.getAllPost();
	} else {
		posts = dao.getAllPostById(cid);
	}
	if(posts.size() == 0){
		out.println("<div class='no-posts-container'>");
		out.println("<h3 class='display-3'>No Posts in this category</h3>");
		out.println("</div>");
	}

	for (Posts p : posts) {
	%>
	<div class="col-md-6 mt-3">
		<div class="card">
			<img src="blogPics/<%=p.getpPic()%>" class="card-img-top" alt="...">
			<div class="card-body">
				<b><%=p.getpTitle() %></b>
				<p><%=p.getpContent() %></p>
			</div>
			<% LikeDao ld = new LikeDao(ConnectionProvider.getConnection()); %>
			<div class="card-footer text-center primary-background2 ">
				<a href="ShowBlog.jsp?post_id=<%=p.getpId() %>" class="btn text-white btn-sm primary-background2">Continue...</a>
				<a  href="javascript:void(0);" onclick="doLike(<%=p.getpId()%>,<%=uu.getId()%>, this)" class="btn text-white btn-sm primary-background2">
					<i class="fa fa-thumbs-o-up"></i>
					<span class="like-counter"><%=ld.countLikeonPost(p.getpId()) %></span>
				</a>
			
			</div>
		</div>
	</div>
	<%
	}
	%>
</div>

