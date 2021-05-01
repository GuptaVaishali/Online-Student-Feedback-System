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
    <title>Change Teacher password</title>
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
            <h1 class="text-center text-muted">Change Password</h1>
          </div>
        </div>
      </div>
    </header>
	<form name = "changepassform" action = "ChangeTeacherPassword.jsp"  method = "get" style = "max-width:300px; margin:auto;">
		<input type="hidden" name="teacherid" value="<%=request.getParameter("teacherid")%>"> 
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
	
	<% 	if(session.getAttribute("message") != null){  %>
			<div class='alert alert-danger alert-dismissible fade show' role="alert">
	  			<%=session.getAttribute("message") %>
	  			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
		<% session.removeAttribute("message"); }	%>
		
	
	<%
	try{
		String teacherid = request.getParameter("teacherid");
		String opass = request.getParameter("oldpass");
		String npass = request.getParameter("newpass");
		String cpass = request.getParameter("confirmpass");
		if(teacherid!= null && opass!= null){
			System.out.println(teacherid + " " + opass + " " + npass + " " + cpass);
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3309/feedbackdb?autoReconnect=true&useSSL=false"
							                             ,"root","vaishali@97"); 
			PreparedStatement stmt=con.prepareStatement("select * from teacher where teacher_id = ?");
			stmt.setString(1,teacherid);
			ResultSet rs=stmt.executeQuery();  
			if(rs.next()){
				if(rs.getString("tpassword").equals(opass)){
					if(opass.equals(npass)){
						session.setAttribute("message","Old Password and New Password are same..Please choose some different Password");
						response.sendRedirect("ChangeTeacherPassword.jsp?teacherid="+teacherid);
					}
					else if(npass.equals(cpass)){
						PreparedStatement st=con.prepareStatement("update teacher set tpassword = ? where teacher_id = ?");
						st.setString(1,npass);
						st.setString(2,teacherid);
						int r = st.executeUpdate(); 
						System.out.println("row updated " + r);
						response.sendRedirect("TeacherLogin.jsp");
						session.setAttribute("message","Password Updated..please login with updated password");
					}
					else{
						session.setAttribute("message","New Password and Confirm Password don't Match");
						response.sendRedirect("ChangeTeacherPassword.jsp?teacherid=" + teacherid);
					}
				} 
				else{
					session.setAttribute("message", "Wrong Password");	
					response.sendRedirect("ChangeTeacherPassword.jsp?teacherid= " + teacherid);
				}
		}
			con.close(); 
		}
	}catch(Exception e){ System.out.println(e);} 
%>
	<footer id="footer" style = "text-align: center;padding: 3px;margin-top:4px; background-color:gray; color: white;" >
		<p class="float-right"><a href="#">Back to top</a></p>
		<p>Copyright Feedback, &copy; 2021</p>
	</footer>
	<script src="js\bootstrap.min.js"></script>
</body>
</html>	