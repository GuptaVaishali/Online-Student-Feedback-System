<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="css\bootstrap.min.css"> 
    <title>Student Home</title>
  </head>
  
<body class = "bg-light">
	<header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
	  <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">FEEDBACK MANAGEMENT SYSTEM</a>
	  <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  
	  <ul class="navbar-nav px-3">
	    <li class="nav-item text-nowrap">
	      <a class="nav-link text-white" href="index.html">Sign out</a>
	    </li>
	  </ul>
	</header>

	<header id="header">
      <div class="container bg-smoky-white">
        <div class="row">
          <div class="col-md-12">
            <h1 class="text-center text-muted">Student Home</h1>
          </div>
        </div>
      </div>
    </header>

<div class = "container">
	<div class="row row-cols-1 row-cols-md-2 g-4">
	  <div class="col">
		<div class="card bg-light border-primary shadow">
		  <img src="images\eight.png"  height = "200" class="card-img-top" alt="...">
		  <div class="card-body text-center">
			<a class="btn btn-primary" href="ChooseTeacher.jsp?studentid=<%=request.getParameter("studentid")%>" role="button">Give Feedback</a>
		  </div>
		</div>
	  </div>
	  <div class="col">
		<div class="card bg-light border-primary shadow">
		  <img src="images\pass2.jpg" height = "200" class="card-img-top" alt="...">
		  <div class="card-body text-center">
			<a class="btn btn-primary" href="ChangeStudentPass.jsp?studentid=<%=request.getParameter("studentid")%>" role="button">Change Password</a>
		  </div>
		</div>
	  </div>
	</div>
</div>
<footer id="footer" style = "text-align: center;padding: 3px;margin-top:15px; background-color: gray; color: white;" >
		<p class="float-right"><a href="#">Back to top</a></p>
		<p>Copyright Feedback, &copy; 2021</p>
</footer>
<script src="js\bootstrap.min.js"></script>
</body>
</html>