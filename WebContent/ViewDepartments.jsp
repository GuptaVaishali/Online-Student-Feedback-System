<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="css\bootstrap.min.css"> 
    <title>View Department</title>
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
            <h1 class="text-center text-muted">Manage Departments</h1>
          </div>
        </div>
      </div>
    </header>
  
    <!-- Button trigger modal -->
     <div class = "container">
    	<div class = "w-25 m-auto mb-3 mt-2 ">
			<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#AddDepartmentModal">
	  			Add Department
			</button>
		</div>
    </div>
    
    <%  if( session.getAttribute("message") != null){ %> 
    		<div class='alert alert-<%=session.getAttribute("msg_type")%> alert-dismissible fade show' role="alert">
	  			<%=session.getAttribute("message")%>
	  			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
	<% session.removeAttribute("message"); }	%>
	
	<!-- Modal -->
	<div class="modal fade" id="AddDepartmentModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Add Department</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <form name = "AddDeptform" action = "Add_Department.jsp" method = "get">
	      	<div class="modal-body">
	        	<div class="mb-3">
					  <label for="deptname" class="form-label">Dept_name</label>
					  <input type= "text"  class="form-control" name = "deptname" id="deptname" placeholder="Enter Department Name" required>
				</div>
	      	</div>
	      	<div class="modal-footer">
	        	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        	<input type="submit" class="btn btn-primary">
	      	</div>
	      </form>
	    </div>
	  </div>
	</div>
    
    
	
	<%
	try{  
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection(  
		"jdbc:mysql://localhost:3309/feedbackdb?autoReconnect=true&useSSL=false","root","vaishali@97");  
		//here feedback db is database name, root is username and vaishali@97 is password  
		Statement stmt=con.createStatement();  
		ResultSet rs=stmt.executeQuery("select * from department");  
	%>
			<div class="table-responsive">
				<table class="table table-striped table-success  table-hover table-bordered  align-middle mt- 5 text-center m-auto">
			  <thead>
			    <tr>
			      <th scope="col">Dept_name</th>
			      <th scope="col">Delete</th>
			    </tr>
			  </thead>
	<% 
		while(rs.next())  {
			int deptid = rs.getInt(1);
			String deptname = rs.getString(2);
	%>
			  <tbody>
			    <tr>
			      <th scope="row"><%= deptname %></th>
			       <td><a class="btn btn-danger" href="DeleteDepartment.jsp?deptid=<%=deptid %>" role="button">Delete</a></td>
			    </tr>
			  </tbody>
	<% 
		}
	%>
		</table>
  		</div>
	
	<%
		con.close();  
		}catch(Exception e){ System.out.println(e);}  		
	%>


<footer id="footer" style = "text-align: center;padding: 3px;margin-top:4px; background-color: black; color: white;" >
		<p class="float-right"><a href="#">Back to top</a></p>
		<p class = "text-muted" >Copyright Feedback, &copy; 2021</p>
</footer>
<script src="js\bootstrap.min.js"></script>
</body>
</html>