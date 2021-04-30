<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="css\bootstrap.min.css"> 
	
    <title>Admin Login</title>
  </head>
  
  <header>
	<nav class="navbar navbar-expand-lg navbar-dark sticky-top bg-dark shadow">
  		<a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">FEEDBACK MANAGEMENT SYSTEM</a>
	</nav>
  </header>
  
  <body class = "bg-light">
	 <%  if( session.getAttribute("message") != null){ %> 
    		<div class='alert alert-<%=session.getAttribute("msg_type")%> alert-dismissible fade show' role="alert">
	  			<%=session.getAttribute("message")%>
	  			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
	<% session.removeAttribute("message"); }	%>
	
	<div class = "text-center mt-5">
		<form action = "AdminLogin.jsp" method = "post" style = "max-width:300px; margin:auto;">
			<h1 class="h3 font-weight-normal">Admin Login</h1>
			<div class="form-floating mt-3">
				<input type = "text" class="form-control" id = "username" name = "username" placeholder="UserName" required>
				<label for="username" class= "sr-only">UserName</label>
			</div>
			<div class="form-floating mt-2">
				<input type="password" class="form-control" id = "password" name = "password" placeholder="Password" required>
				<label for="password" class= "sr-only">Password</label>
			</div>
			<button class="w-100 btn btn-lg btn-primary mt-4 mb-4" type="submit">Sign in</button>
		</form>
	</div>
 
	<footer id="footer" style = "text-align: center;padding: 3px;margin-top:4px; background-color:gray; color: white;" >
		<p class="float-right"><a href="#">Back to top</a></p>
		<p>Copyright Feedback, &copy; 2021</p>
	</footer>
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
   <script src="js\bootstrap.min.js"></script>
  </body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*" %>
<%
	try{
	String user = request.getParameter("username");
	String pass = request.getParameter("password");
	if(user!=null && pass!=null){
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3309/feedbackdb?autoReconnect=true&useSSL=false"
						                             ,"root","vaishali@97"); 
		PreparedStatement stmt=con.prepareStatement("select * from admin where ausername = ? and apassword = ?");
		stmt.setString(1,user);
		stmt.setString(2,pass);
		ResultSet rs=stmt.executeQuery();  
		if(rs.next() == true){
			response.sendRedirect("AdminHome.html");
		} 
		else{
			session.setAttribute("message", "Wrong User ID or Password");
			session.setAttribute("msg_type", "danger");
		}
		con.close();  
	}
	}catch(Exception e){ System.out.println(e);} 

%>

