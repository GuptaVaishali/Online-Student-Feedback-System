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
    <title>Change Student Password</title>
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
            <h1 class="text-center text-muted">Change Password</h1>
          </div>
        </div>
      </div>
    </header>
    
    <%  if( session.getAttribute("message") != null){ %> 
    		<div class='alert alert-danger alert-dismissible fade show' role="alert">
	  			<%=session.getAttribute("message")%>
	  			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
	<% session.removeAttribute("message"); }	%>
	
	<form name = "changeStupassform" action = "ChangeStudentPass.jsp"  method = "get" style = "max-width:300px; margin:auto;">
		<input type="hidden" name="studentid" value="<%=request.getParameter("studentid")%>"> 
		<div class="form-floating mt-3">
				<input type = "password" class="form-control" id = "opassword" name = "oldpass" required placeholder = "Enter Old Password">
				<label for="opassword">Old Password</label>
		</div>
		<div class="form-floating mt-3">
				<input type = "password" class="form-control" id = "npassword" name = "newpass" required placeholder = "Enter New Password">
				<label for="npassword">New Password</label>
		</div>
		<div class="form-floating mt-3">
				<input type = "password" class="form-control" id = "cpassword" name = "confirmpass" required placeholder = "Enter Confirm Password">
				<label for="cpassword">Confirm Password</label>
		</div>
		<input type = "submit" class="w-100 btn btn-lg btn-primary mt-3 mb-3" value = "Change Password">
	</form>
	
	
	<%
	try{
		String studentid = request.getParameter("studentid");
		String opass = request.getParameter("oldpass");
		String npass = request.getParameter("newpass");
		String cpass = request.getParameter("confirmpass");
			//System.out.println(user + " " + opass + " " + npass + " " + cpass);
		if(studentid != null && opass!=null && npass!=null && cpass!=null){
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3309/feedbackdb?autoReconnect=true&useSSL=false"
							                             ,"root","vaishali@97"); 
			PreparedStatement stmt=con.prepareStatement("select * from student where sid = ?");
			stmt.setString(1,studentid);
			ResultSet rs=stmt.executeQuery();  
			if(rs.next()){
				if(rs.getString("spassword").equals(opass)){
					if(opass.equals(npass)){
						session.setAttribute("message","Old Password and New Password are same..Please choose some different Password");
						response.sendRedirect("ChangeStudentPass.jsp?studentid="+studentid);
					}
					else if(npass.equals(cpass)){
						PreparedStatement st=con.prepareStatement("update student set spassword = ? where sid = ?");
						st.setString(1,npass);
						st.setString(2,studentid);
						int r = st.executeUpdate(); 
						System.out.println("row updated " + r);
						session.setAttribute("message","Password Updated..please login again");
						response.sendRedirect("StudentLogin.jsp");
					}
					else{
						session.setAttribute("message","New Password and Confirm Password don't match");
						response.sendRedirect("ChangeStudentPass.jsp?studentid="+studentid);
					}
				} 
				else{
					session.setAttribute("message","Wrong Password");
					response.sendRedirect("ChangeStudentPass.jsp?studentid="+studentid);
				}
			}
			con.close();  
		}}catch(Exception e){ System.out.println(e);} 
	%>
	
	<footer id="footer" style = "text-align: center;padding: 3px;margin-top:4px; background-color:gray; color: white;" >
		<p class="float-right"><a href="#">Back to top</a></p>
		<p>Copyright Feedback, &copy; 2021</p>
	</footer>
	<script src="js\bootstrap.min.js"></script>
</body>
</html>