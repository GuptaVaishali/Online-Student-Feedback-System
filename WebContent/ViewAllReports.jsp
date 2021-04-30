<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="css\bootstrap.min.css"> 
    <title>View Reports</title>
  </head>
  
<body class = "bg-light">
	<nav class="navbar navbar-expand-lg navbar-dark sticky-top bg-dark shadow">
  		<a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">FEEDBACK MANAGEMENT SYSTEM</a>
  			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    			<span class="navbar-toggler-icon"></span>
  			</button>
  		<div class="collapse navbar-collapse" id="navbarNav">
  			<ul class="navbar-nav px-5 ms-auto">
  				<li class="nav-item">
      				<a class="nav-link text-white" href="AdminHome.html">Home</a>
    			</li>
    			<li class="nav-item">
      				<a class="nav-link text-white" href="index.html">Sign out</a>
    			</li>
  			</ul>
  		</div>
	</nav>

	<header id="header">
      <div class="container bg-smoky-white">
        <div class="row">
          <div class="col-md-12">
            <h1 class="text-center text-muted">View Reports</h1>
          </div>
        </div>
      </div>
    </header>

	<%
	try{
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:mysql://localhost:3309/feedbackdb?autoReconnect=true&useSSL=false","root","vaishali@97");  
	//here feedback db is database name, root is username and vaishali@97 is password 
	
	Statement st=con.createStatement();

	ResultSet rs = st.executeQuery("select tname,sub_name,floor(avg(ques1)),floor(avg(ques2)),floor(avg(ques3)),floor(avg(ques4)),floor(avg(ques5)),floor(avg(ques6)),floor(avg(ques7)),floor(avg(ques8)),floor(avg(ques9)),floor(avg(ques10)),floor(avg(ques11)) from feedback,teacher,subject where feedback.teacher_id = teacher.teacher_id and feedback.sub_id = subject.sub_id group by feedback.teacher_id,feedback.sub_id"); 
	%>
	<div class="table-responsive" style = "margin-bottom: 10px;">
			<table class="table table-striped table-success  table-hover table-bordered w-25 align-middle mt- 5 text-center m-auto">
			  <thead>
			 	<tr>
			      <th scope="col">Teacher Name</th>
			      <th scope="col">Subject Name</th>
			      <th scope="col">Ability to bring Conceptual clarity and thinking</th>
			      <th scope="col">Ability to provide motivation</th>
			      <th scope="col">Communication Skills</th>
			      <th scope="col">Regularity and Punctuality</th>
			      <th scope="col">Ability for explaining areas of confusion</th>
			      <th scope="col">Guidance after class hours</th>
			      <th scope="col">Ability to explain theory with practical</th>
			      <th scope="col">Computer/IT skills</th>
			      <th scope="col">Completion and coverage of syllabus</th>
			      <th scope="col">Overall Performance</th>
			      <th scope="col">Online Teaching</th>
			    </tr>
			  </thead>
	<% 
	while(rs.next()){
		String tname = rs.getString(1);
		String subname = rs.getString(2);
		int q1 = rs.getInt(3);
		int q2 = rs.getInt(4);
		int q3 = rs.getInt(5);
		int q4 = rs.getInt(6);
		int q5 = rs.getInt(7);
		int q6 = rs.getInt(8);
		int q7 = rs.getInt(9);
		int q8 = rs.getInt(10);
		int q9 = rs.getInt(11);
		int q10 = rs.getInt(12);
		int q11 = rs.getInt(13);
	%>
				<tbody>
			    <tr> 
			       <th scope="row"><%= tname %></th>
			       <td><%= subname %></td>
			       <td><%= q1  %></td>
			       <td><%=q2  %></td>
			       <td><%= q3  %></td>
			       <td><%= q4 %></td>
			       <td><%= q5  %></td>
			       <td><%= q6 %></td>
			       <td><%= q7 %></td>
			       <td><%= q8 %></td>
			       <td><%= q9 %></td>
			       <td><%= q10 %></td>
			       <td><%= q11 %></td>
			    </tr>
		  	</tbody>
		  	
	<% }%>
	</table>
	</div>	
	<% 
	con.close();  
	}catch(Exception e){}	
	%>
<footer id="footer" style = "text-align: center;padding: 3px;margin-top:4px; background-color:gray; color: white;" >
		<p class="float-right"><a href="#">Back to top</a></p>
		<p>Copyright Feedback, &copy; 2021</p>
</footer>
<script src="js\bootstrap.min.js"></script>
</body>
</html>