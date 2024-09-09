<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blogging Website</title>
<!-- CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.jumbotron {
	border-radius: 0;
	/* Adjust as needed if adding padding to the container-fluid */
}

.jumbotron {
	height: 95vh;
	position: relative;
	margin-top: 0px;
}

.navbar-search {
	display: flex;
	align-items: center;
}

.navbar-search input {
	width: 300px;
}

.jumbotron .container {
	width: 100%;
	padding-top: 40px;
	padding-right: 15px;
	padding-left: 0px;
	margin-right: auto;
	margin-left: 33px;
}

.jumbotron .container h2 {
	font-weight: 500;
}

.jumbotron .container p {
	width: 65%;
}

.jumbotron  img {
	position: absolute;
	width: 600px;
	right: 1px;
	bottom: 50px;
}

.crdhdr {
	text-align: center;
	background-color: #333;
	padding-top: 17px;
	color: white;
	font-family: verdana;
	font-weight: 400;
}

.searchbtn{
border-radius: 6px;
border:.5px solid black;
background-color: white;
color: black;
}

.searchbtn:hover {
color: white;
background-color: #7952b3 ;
}

.rdmr {
	background-color: transparent;
	border: 1px solid black;
}

.rdmr:hover {
	background-color: #7952b3;
	color: white;
}

.card {
	width: 100%;
	margin: auto;

}

.card-item {
    margin-bottom: 1.5rem;
    display: flex; 
}

.card-text {
	max-height: 220px;
	overflow: clip;
}

@media only screen and (max-width: 966px) {
	.jumbotron  img {
		width: 570px;
		bottom: 20px;
	}
}

@media only screen and (max-width: 843px) {
	.jumbotron  img {
		display:none;
	}
}
/* 
@media only screen and (max-width: 770px) {
	.jumbotron  img {
		width: 470px;
		bottom: 20px;
	}
	@media only screen and (max-width: 683px) {
		.jumbotron  img {
		
			width: 470px;
			bottom: 0px;
		}
	}
	@media only screen and (max-width: 640px) {
		.jumbotron  img {
			
			width: 400px;
			bottom: 0px;
		}
	}
	@media only screen and (max-width: 555px) {
		.jumbotron  img {
			display: none;
		}
	} */

	/* Card container and card item adjustments */
	#cardContainer {
		margin-bottom: 2rem;
	}
	.card-item {
		margin-bottom: 1.5rem; /* Space between cards */
	}

	/* Responsive adjustments */
	@media ( max-width : 767.98px) {
		.card-item {
			margin-bottom: 1rem; /* Reduced space between cards on mobile */
		}
	}
}



</style>


</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark primary-background2">
		<a class="navbar-brand" href="index.jsp"> <span class="fa fa-bolt"></span>Blogging
		</a>
	
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">  <span
						class="fa fa-graduation-cap"></span>Learn with Arsh<span
						class="sr-only">(current)</span></a></li>

				<li class="nav-item"><a class="nav-link"
					href="https://arshnadeem.github.io/myself/"> <span
						class="fa fa-address-book"></span>Contact
				</a></li>
				<li class="nav-item"><a href="Login.jsp" class="nav-link ">
						<span class="fa fa-user-circle-o"></span>Login
				</a></li>
				<li class="nav-item"><a href="Register.jsp" class="nav-link ">
						<span class="fa fa-user-plus"></span>SignUp
				</a></li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" id="noteSearch">     
    </form>
		</div>
	</nav>

	<!-- //banner -->
	<div class="container-fluid p-0  m-0">
		<div class="jumbotron primary-background1 text-white ">
			<div class="container">
				<h2 class="display-4">Welcome to Technical Blogging</h2>
				<p>Welcome to Blogging, world of Technologies</p>
				<p> Technical blogging involves
					writing articles about technical subjects, often focusing on
					programming, software development, technology trends, or industry
					insights. It serves as a way to share knowledge, document solutions
					to common problems, and offer tutorials or code examples to help
					others learn.</p>
				<div class="clipped-element">
					<a href="Register.jsp" class="btn btn-outline-light btn-lg">
						Sign up</a> <a href="Login.jsp" class="btn btn-outline-light btn-lg">
						Login </a>
				</div>
			</div>
			<img alt="" src="./pics/hero_illustration.png">
		</div>
	</div>

	<!-- Cards -->
	<div class="container ">
		<div class="row mb-3" id="cardContainer">
			<div class=" col-md-4 card-item ">

				<div class="card ">
					<div class="crdhdr card-header">
						<h5 class="card-title">Java Programming</h5>
					</div>

					<div class="card-body">
						<p class="card-text">Java is a programming language and a
							platform. Java is a high level, robust, object-oriented and
							secure programming language. Java was developed by Sun
							Microsystems (which is now the subsidiary of Oracle) in the year
							1995. James Gosling is known as the father of Java. Java works on
							different platforms (Windows, Mac, Linux, Raspberry Pi, etc.) It
							is one of the most popular programming languages in the world It
							has a large demand in the current job market It is easy to learn
							and simple to use It is open-source and free It is secure, fast
							and powerful It has huge community support (tens of millions of
							developers)</p>
						<a href="http://localhost:7050/Blogging/ShowBlog.jsp?post_id=1"
							class="rdmr btn">Read More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 card-item">
				<div class=" card">
					<div class="crdhdr card-header">
						<h5 class="card-title">Python Programming</h5>
					</div>

					<div class="card-body">
						<p class="card-text">Python is a versatile, high-level
							programming language known for its simplicity and readability. It
							supports multiple programming paradigms, including
							object-oriented. Python is widely used in web development, data
							analysis, machine learning, and automation. Python works on
							different platforms (Windows, Mac, Linux, Raspberry Pi, etc).
							Python has a simple syntax similar to the English language.
							Python has syntax that allows developers to write programs with
							fewer lines than some other programming languages. Python runs on
							an interpreter system, meaning that code can be executed as soon
							as it is written. This means that prototyping can be very quick.
							Python can be treated in a procedural way, an object-oriented way
							or a functional way.</p>
						<a href="http://localhost:7050/Blogging/ShowBlog.jsp?post_id=12"
							class="rdmr btn primary-background2 ">Read More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 card-item">
				<div class=" card">
					<div class="crdhdr card-header">
						<h5 class="card-title">Web Development</h5>
					</div>

					<div class="card-body">
						<p class="card-text">Web development involves creating and
							maintaining websites or web applications. It encompasses both
							frontend development (user interface and experience) using HTML,
							CSS, and JavaScript, and backend development (server-side logic,
							databases) using languages like Python, Java, or PHP. Popular
							Frontend Technologies HTML: HTML stands for HyperText Markup
							Language. It is used to design the front end portion of web pages
							using markup language. It acts as a skeleton for a website since
							it is used to make the structure of a website. CSS: Cascading
							Style Sheets fondly referred to as CSS is a simply designed
							language intended to simplify the process of making web pages
							presentable. It is used to style our website. JavaScript:
							JavaScript is a scripting language used to provide a dynamic
							behavior to our website. Bootstrap: Bootstrap is a free and
							open-source tool collection for creating responsive websites and
							web applications. It is the most popular CSS framework for
							developing responsive, mobile-first websites.</p>
						<a href="http://localhost:7050/Blogging/ShowBlog.jsp?post_id=13"
							class="rdmr btn primary-background2 ">Read More</a>
					</div>
				</div>
			</div>
		</div>
		<!-- Add more cards as needed -->

		<div class="row mb-3">
			<div class="col-md-4 card-item">
				<div class=" card">
					<div class="crdhdr card-header">
						<h5 class="card-title">Foundation</h5>
					</div>

					<div class="card-body">
						<p class="card-text">A foundation provides the essential
							groundwork for further development, whether in technology or
							education. It serves as the core platform or knowledge base upon
							which more advanced concepts or structures are built.
							Construction: In building construction, the foundation is
							literally the base that supports the entire structure. A weak
							foundation can lead to structural failures, while a strong
							foundation ensures the building's stability and longevity.
							Learning and Education: Foundational knowledge in subjects like
							mathematics, reading, and writing is essential for advanced
							learning. Without a solid grasp of the basics, students may
							struggle with more complex topics. Software Development: In
							coding, a well-structured and clean codebase serves as the
							foundation for scalable and maintainable software. If the base
							code is poorly written, future development becomes difficult and
							error-prone.</p>
						<a href="http://localhost:7050/Blogging/ShowBlog.jsp?post_id=14"
							class="rdmr btn primary-background2 ">Read More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 card-item">
				<div class=" card">
					<div class="crdhdr card-header">
						<h5 class="card-title">IoT</h5>
					</div>
					<div class="card-body">

						<p class="card-text">The IoT connects physical devices with
							sensors and software, enabling data exchange and interaction over
							the internet. IoT transforms industries like healthcare and smart
							homes connectivity and automation. The cost of integrating
							computing power into small objects has now dropped considerably.
							For example, you can add connectivity with Alexa voice services
							capabilities to MCUs</p>
						<a href="http://localhost:7050/Blogging/ShowBlog.jsp?post_id=15"
							class="rdmr btn primary-background2 ">Read More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 card-item">
				<div class=" card">
					<div class="crdhdr card-header">
						<h5 class="card-title">Web Technology</h5>
					</div>

					<div class="card-body">
						<p class="card-text">Web technology includes the tools and
							protocols for creating and managing websites. It covers frontend
							(HTML, CSS, JavaScript) and backend technologies, ensuring
							dynamic, interactive, and secure online experiences. Web
							Technology can be Classified into the Following Sections: World
							Wide Web (WWW): The World Wide Web is based on several different
							technologies: Web browsers, Hypertext Markup Language (HTML), and
							Hypertext Transfer Protocol (HTTP). Web Browser: The web browser
							is an application software to explore www (World Wide Web). It
							provides an interface between the server and the client and
							requests to the server for web documents and services. Web
							Server: Web server is a program which processes the network
							requests of the users and serves them with files that create web
							pages. This exchange takes place using Hypertext Transfer
							Protocol (HTTP). Web Pages: A webpage is a digital document that
							is linked to the World Wide Web and viewable by anyone connected
							to the internet has a web browser. Web Development: Web
							development refers to the building, creating, and maintaining of
							websites. It includes aspects such as web design, web publishing,
							web programming, and database management. It is the creation of
							an application that works over the internet i.e. websites.</p>
						<a href="#" class="rdmr btn primary-background2 ">Read More</a>
					</div>
				</div>
			</div>
		</div>

		<div class="row mb-3">
			<div class="col-md-4 card-item">
				<div class=" card">
					<div class="crdhdr card-header">
						<h5 class="card-title">Cloud Computing</h5>
					</div>

					<div class="card-body">
						<p class="card-text">Cloud computing is a transformative
							technology that allows individuals and organizations to access
							and manage computing resources over the internet, rather than
							relying on local servers or personal devices. This model provides
							on-demand availability of computing power, storage, and
							applications, often through a pay-as-you-go pricing structure.
							Cloud computing offers flexibility, scalability, and
							cost-efficiency, making it an essential part of modern IT
							infrastructure. There are three main types of cloud services:
							Infrastructure as a Service (IaaS), which provides virtualized
							computing resources like virtual machines and storage; Platform
							as a Service (PaaS), which offers a platform allowing customers
							to develop, run, and manage applications without dealing with
							underlying infrastructure; and Software as a Service (SaaS),
							which delivers software applications over the internet, typically
							through a subscription model.</p>
						<a href="http://localhost:7050/Blogging/ShowBlog.jsp?post_id=14"
							class="rdmr btn primary-background2 ">Read More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 card-item">
				<div class=" card">
					<div class="crdhdr card-header">
						<h5 class="card-title">Data Stuctures & Algorithms</h5>
					</div>
					<div class="card-body">

						<p class="card-text">Data Structures and Algorithms (DSA) form
							the backbone of computer science, serving as the fundamental
							building blocks for writing efficient and effective software.
							Data structures are ways of organizing and storing data so that
							it can be accessed and modified efficiently. Common data
							structures include arrays, linked lists, stacks, queues, trees,
							and graphs. Each data structure has its own strengths and
							weaknesses, making it suitable for specific types of tasks and
							operations. Algorithms are step-by-step procedures or formulas
							for solving problems. When paired with data structures,
							algorithms enable efficient data processing and retrieval, which
							is crucial in software development. Examples of algorithms
							include sorting (e.g., quicksort, mergesort), searching (e.g.,
							binary search), and graph traversal (e.g., depth-first search,
							breadth-first search). Understanding the time and space
							complexity of algorithms, typically expressed in Big O notation,
							is essential for evaluating their performance and choosing the
							right approach for a given problem.</p>
						<a href="http://localhost:7050/Blogging/ShowBlog.jsp?post_id=15"
							class="rdmr btn primary-background2 ">Read More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 card-item">
				<div class=" card">
					<div class="crdhdr card-header">
						<h5 class="card-title">DBMS</h5>
					</div>

					<div class="card-body">
						<p class="card-text">A Database Management System (DBMS) is a
							software tool that enables users to efficiently create, manage,
							and interact with databases. DBMSs provide an organized way to
							store, retrieve, and manipulate large amounts of data, making
							them essential for applications ranging from simple websites to
							complex enterprise systems. They support various operations like
							querying, updating, and administering databases, ensuring data
							integrity, security, and consistency. DBMSs typically support
							different data models such as relational, hierarchical, and
							object-oriented models. The relational model, where data is
							stored in tables (or relations) and managed using Structured
							Query Language (SQL), is the most widely used. Popular relational
							DBMSs include MySQL, PostgreSQL, Oracle, and Microsoft SQL
							Server.</p>
						<a href="#" class="rdmr btn primary-background2 ">Read More</a>
					</div>
				</div>
			</div>

		</div>


	</div>

	<footer class="primary-background1 text-white pt-4  mt-4">
		<div class="container">
			<div class="row">
				<!-- About Section -->
				<div class="col-md-4">
					<h6>About Us</h6>
					<p>Technical Blogging is a platform to share knowledge,
						insights, and tutorials on various programming languages,
						technologies and other topics.</p>
				</div>
				<!-- Quick Links -->
				<div class="col-md-4">
					<h6>Quick Links</h6>
					<ul class="list-unstyled">
						<li><a href="index.jsp" class="text-white">Home</a></li>
						<li><a href="https://arshnadeem.github.io/myself/" class="text-white">Contact</a></li>
						<li><a href="Login.jsp" class="text-white">Login</a></li>
					</ul>
				</div>
				<!-- Contact Information -->
				<div class="col-md-4">
					<h6>Contact Us</h6>
					<ul class="list-unstyled">
						<li><span class="fa fa-map-marker"></span> D03 Alpha-1 Greater Noida,
							U.P, India</li>
						<li><span class="fa fa-phone"></span> +91 721 7335 122</li>
						<li><span class="fa fa-envelope"></span> mohdarshnadeem@gmail.com</li>
					</ul>
					<!-- Social Media Links -->
					<div class="mt-3">
						
							 <a href="https://x.com/ArshNadeem47989" class="text-white mr-3"><span class="fa fa-twitter"></span></a> <a
							href="https://www.linkedin.com/in/arsh-nadeem-646b94213/" class="text-white mr-3"><span class="fa fa-linkedin"></span></a>
						<a href="https://www.instagram.com/arshflyyyy/" class="text-white"><span class="fa fa-instagram"></span></a>
					</div>
				</div>
			</div>
			<!-- Footer Bottom -->
			<div class="row mt-4">
				<div class="col-md-12 text-center">
					<p class="mb-0">&copy; 2024 Technical Blogging. All rights
						reserved.</p>
				</div>
			</div>
		</div>
	</footer>


	<!-- JavaScript -->
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
<script>
$(document).ready(function(){
  // Listen for input in the search box
  $("#noteSearch").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    
    // Loop through all cards to filter based on title or content
    $(".card").filter(function() {
    	
      $(this).toggle($(this).find(".card-title").text().toLowerCase().indexOf(value) > -1);
    });
  });
});
</script>

</body>
</html>
