<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="css\bootstrap.min.css"> 
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Subject Report</title>
  </head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark sticky-top bg-dark shadow">
  		<a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">FEEDBACK MANAGEMENT SYSTEM</a>
  			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    			<span class="navbar-toggler-icon"></span>
  			</button>
  		<div class="collapse navbar-collapse" id="navbarNav">
  			<ul class="navbar-nav px-5 ms-auto">
  				<li class="nav-item">
      				<a class="nav-link text-white" href='TeacherHome.jsp?teacherid=<%=request.getParameter("teacherid")%>'>Home</a>
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
            <h1 class="text-center text-muted">Report</h1>
          </div>
        </div>
      </div>
    </header>
<% 
try{
	int teacherid = Integer.parseInt((request.getParameter("teacherid")).trim());
    int subid = Integer.parseInt((request.getParameter("subject_name")).trim());
    
    System.out.println(teacherid + " " + subid);
    
	Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection(  
		"jdbc:mysql://localhost:3309/feedbackdb?autoReconnect=true&useSSL=false","root","vaishali@97");  
		//here feedback db is database name, root is username and vaishali@97 is password 
		
		System.out.println("Connection created");
		
		PreparedStatement stmt=con.prepareStatement("select tname,sub_name,floor(avg(ques1)),floor(avg(ques2)),floor(avg(ques3)),floor(avg(ques4)),floor(avg(ques5)),floor(avg(ques6)),floor(avg(ques7)),floor(avg(ques8)),floor(avg(ques9)),floor(avg(ques10)),floor(avg(ques11)) from feedback,teacher,subject where feedback.teacher_id = teacher.teacher_id and feedback.sub_id = subject.sub_id group by feedback.teacher_id,feedback.sub_id having feedback.teacher_id = ? and feedback.sub_id = ?");
		stmt.setInt(1,teacherid);
		stmt.setInt(2,subid);
		
		System.out.println("Query created");
		
		ResultSet rs = stmt.executeQuery(); 
		
		if(rs.next()){
		
		System.out.println("result created");
	%>
		
		<div class="table-responsive" style = "margin-bottom: 10px;">
		<table class="table table-striped table-success  table-hover table-bordered align-middle mt- 5 text-center m-auto">
		  <thead>
		 	<tr>
		      <th scope="col">Details</th>
		      <th scope="col">Values</th>
		    </tr>
		  </thead>
	<% 	
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
			      <th scope="row">Teacher Name</th>
			       <td><%= tname %></td>
			    </tr>
			    <tr>
			      <th scope="row">Subject Name</th>
			       <td><%= subname %></td>
			    </tr>
			    <tr>
			      <th scope="row">Teacher's ability to bring Conceptual clarity and thinking</th>
			       <td><%= q1  %></td>
			    </tr>
			    <tr>
			      <th scope="row">Teacher's ability to provide motivation</th>
			       <td><%=q2  %></td>
			    </tr>
			    <tr>
			      <th scope="row">Teacher's communication skill</th>
			       <td><%= q3  %></td>
			    </tr>
			    <tr>
			      <th scope="row">Teacher's regularity and punctuality</th>
			       <td><%= q4 %></td>
			    </tr>
			    <tr>
			      <th scope="row">Teacher's ability for explaining areas of confusion</th>
			       <td><%= q5  %></td>
			    </tr>
			    <tr>
			      <th scope="row">Teacher's guidance after class hours</th>
			       <td><%= q6 %></td>
			    </tr>
			    <tr>
			      <th scope="row">Teacher's ability to explain theory with practical</th>
			       <td><%= q7 %></td>
			    </tr>
			    <tr>
			      <th scope="row">Teacher's Computer/IT skills</th>
			       <td><%= q8 %></td>
			    </tr>
			    <tr>
			      <th scope="row">Completion and coverage of syllabus</th>
			       <td><%= q9 %></td>
			    </tr>
			    <tr>
			      <th scope="row">Teacher's overall performance</th>
			       <td><%= q10 %></td>
			    </tr>
			    <tr>
			      <th scope="row">Did you Enjoy online teaching</th>
			       <td><%= q11 %></td>
			    </tr>
		  	</tbody>
		</table>
	</div>	
<%
		} 
		else{
			out.println("Feedback has not submitted yet");
		}
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