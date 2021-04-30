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
    <title>Change password</title>
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
      				<a class="nav-link text-white" href="TeacherHome.jsp">Home</a>
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
	<form name = "changepassform" action = "ChangePassword.jsp"  method = "get" style = "max-width:300px; margin:auto;">
		<input type="hidden" name="username" value="<%=request.getParameter("user")%>"> 
		<div class="mb-3">
			<label for="opassword" class="form-label">Old Password</label>
     		 <input type = "password" class="form-control" id = "opassword" name = "oldpass" required placeholder = "Enter Old Password">
		</div>
		<div class="mb-3">
			<label for="npassword" class="form-label">New Password</label>
     		<input type = "password" class="form-control" id = "npassword" name = "newpass" required placeholder = "Enter New Password">
		</div>
		<div class="mb-3">
			<label for="cpassword" class="form-label">Confirm Password</label>
     		<input type = "password" class="form-control" id = "cpassword" name = "confirmpass" required placeholder = "Enter Confirm Password">
		</div>
		<div class="mb-3">
     		<input type = "submit" class="btn btn-primary w-100" value = "Change Password">
		</div>
	</form>
<% 
		if(session.getAttribute("error_message") != null){
%>
			<div class='alert alert-danger alert-dismissible fade show' role="alert">
	  			<%=session.getAttribute("error_message") %>
	  			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
<%		} %>
	
	<%
	//String error_message = "";
	try{
		String user = request.getParameter("username");
		String opass = request.getParameter("oldpass");
		String npass = request.getParameter("newpass");
		String cpass = request.getParameter("confirmpass");
			//System.out.println(user + " " + opass + " " + npass + " " + cpass);
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3309/feedbackdb?autoReconnect=true&useSSL=false"
							                             ,"root","vaishali@97"); 
			PreparedStatement stmt=con.prepareStatement("select * from teacher where tusername = ?");
			stmt.setString(1,user);
			ResultSet rs=stmt.executeQuery();  
			if(rs.next()){
				if(rs.getString("tpassword").equals(opass)){
					if(npass.equals(cpass)){
						PreparedStatement st=con.prepareStatement("update teacher set tpassword = ? where tusername = ?");
						st.setString(1,npass);
						st.setString(2,user);
						int r = st.executeUpdate(); 
						System.out.println("row updated " + r);
					//	error_message = "Password Updated..please login again";
						response.sendRedirect("TeacherLogin.jsp");
					//	String message = "Password Updated..please login with updated password";
						session.setAttribute("message","Password Updated..please login with updated password");
					}
					else{
						session.setAttribute("error_message","New Password and Confirm Password donot Match");
						response.sendRedirect("ChangePassword.jsp?user=" + user);
					}
				} 
				else{
					session.setAttribute("error_message", "Wrong Password");	
					response.sendRedirect("ChangePassword.jsp?user=" + user);
				}
			}
			con.close();  
		}catch(Exception e){ System.out.println(e);} 
%>
	<footer id="footer" style = "text-align: center;padding: 3px;margin-top:4px; background-color:gray; color: white;" >
		<p class="float-right"><a href="#">Back to top</a></p>
		<p>Copyright Feedback, &copy; 2021</p>
	</footer>
	<script src="js\bootstrap.min.js"></script>
</body>
</html>	