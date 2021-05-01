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
    <title>Choose Teacher</title>
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
      				<a class="nav-link text-white" href="StudentHome.jsp">Home</a>
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
            <h1 class="text-center text-muted">Choose Teacher</h1>
          </div>
        </div>
      </div>
    </header>
    
	<form action="FeedbackForm.jsp" method = "get" style = "max-width:300px; margin:auto;">
		<input type= "hidden" name = "studentid" value = "<%=request.getParameter("studentid")%>">
		<div class="mb-3">
	   		<label for="tname" class="form-label">Teacher_Name</label>
	
		<select name="teacher_name" class="form-select" id = "tname" size="1">
	<%
	try{  
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection(  
		"jdbc:mysql://localhost:3309/feedbackdb?autoReconnect=true&useSSL=false","root","vaishali@97");   
		Statement stmt=con.createStatement();  
		ResultSet rs=stmt.executeQuery("select * from teacher");  
		while(rs.next())  {
		int tid = rs.getInt(1);
		String tname = rs.getString(2);
		
	%>
		<option value="<%=tid %> "> <%=tname%></option>
		
	<% 
		}
	%>
		</select>
		</div>
	<% 
		con.close();  
		}catch(Exception e){ System.out.println(e);}  		
	%>
	<input type = "submit" class="w-100 btn btn-lg btn-primary mb-3" value = "Next" >
	</form>
	<footer id="footer" style = "text-align: center;padding: 3px;margin-top:4px; background-color:gray; color: white;" >
		<p class="float-right"><a href="#">Back to top</a></p>
		<p>Copyright Feedback, &copy; 2021</p>
	</footer>
	<script src="js\bootstrap.min.js"></script>
</body>
</html>