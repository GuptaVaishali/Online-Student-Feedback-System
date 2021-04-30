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
    <title>View Teachers</title>
    <script>
		function fun(){
			var tmobile = document.getElementById("tmobile").value;
			var regx = /^[7-9][0-9]{9}$/;
			if(!(regx.test(tmobile))){
				alert("Please Enter valid mobile No");
				return false;
			} 
		}
	</script>
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
            <h1 class="text-center text-muted">Edit Teacher</h1>
          </div>
        </div>
      </div>
    </header>
	<%
		int tid = Integer.parseInt(request.getParameter("tid").trim());
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3309/feedbackdb?autoReconnect=true&useSSL=false","root","vaishali@97");  
			//here feedback db is database name, root is username and vaishali@97 is password  
			Statement stmt=con.createStatement();  
			ResultSet rs=stmt.executeQuery("select tname,tusername,tpassword,mobile_no,course_name,dept_name,course.course_id,department.dept_id from teacher,course,department where teacher.course_id = course.course_id and teacher.dept_id = department.dept_id and teacher.teacher_id = '" + tid + "'");  

			while(rs.next())  {
				String tname = rs.getString(1);
				String tusername = rs.getString(2);
				String pass = rs.getString(3);
				String mobileno = rs.getString(4);
				String coursename = rs.getString(5);
				String deptname = rs.getString(6);
				int cid = rs.getInt(7);
				int depid = rs.getInt(8);
	%>
			<form name = "EditTecherForm" action = "UpdateTeacher.jsp" method = "get" onsubmit = "return fun()" style = "max-width:300px; margin:auto;">
			<input type = "hidden" value = "<%=request.getParameter("tid")%>" name= "tid">
			<div class="mb-3">
					  <label for="tname1" class="form-label">Teacher Name</label>
					  <input type = "text" class="form-control" name = "tname" value = "<%=tname%>" id = "tname1" required placeholder = "Enter Name">
				</div>
				<div class="mb-3">
					  <label for="tuname" class="form-label">Teacher UserName</label>
					  <input type = "text" class="form-control" name = "tusername" value = "<%=tusername%>" id ="tuname" required placeholder = "Enter Username">
				</div>
				<div class="mb-3">
					  <label for="tpass" class="form-label">Teacher Password</label>
					  <input type = "password" class="form-control" name = "tpassword" value = "<%=pass%>" id="tpass" required placeholder = "Enter Password">
				</div>
				<div class="mb-3">
					  <label for="tmobile" class="form-label">Teacher Mobile No</label>
					   <input type = "text" class="form-control" name = "tmobileno" value = "<%=mobileno%>" id="tmobile" required placeholder = "Enter Mobile NO">
				</div>
				<div class="mb-3">
					  <label for="cname" class="form-label">Course_Name</label>
					  <select name="course_name" class="form-select" id = "cname" size="1">
					  	<option value="<%=cid %> " selected> <%=coursename%></option>
				<%
						try{  
							Statement st=con.createStatement();  
							ResultSet rst=st.executeQuery("select * from course where course.course_id != '" + cid + "'");  
							while(rst.next())  {
								int courseid = rst.getInt(1);
								String cname = rst.getString(2);
				%>
								<option value="<%=courseid %> "> <%=cname%></option>
				<% 
							}
				%>
						</select>
				<% 
						}
						catch(Exception e){ System.out.println(e);}  		
				%>
				</div>	
				<div class="mb-3">
	   				<label for="deptname" class="form-label">Department_Name</label>
					<select name="dept_name" class="form-select" id = "deptname" size="1">
						<option value="<%=depid %> "> <%=deptname%></option>
						<%
						try{  
							Statement stmt1=con.createStatement();  
							ResultSet rs1=stmt1.executeQuery("select * from department where dept_id != '" + depid + "'");  
							while(rs1.next())  {
							int deptid = rs1.getInt(1);
							String dname = rs1.getString(2);
						%>
							<option value="<%=deptid %> "> <%=dname%></option>
							
						<% 
							}
						%>
							</select>
						<% 
							}catch(Exception e){ System.out.println(e);}  		
						%>
				</div>
				<input type = "submit" class="w-100 btn btn-primary mb-4"  value = "Update">
	<% 
		}
		con.close();  
		}catch(Exception e){ System.out.println(e);}  		
	%>
	</form>
	
	<footer id="footer" style = "text-align: center;padding: 3px;margin-top:4px; background-color:gray; color: white;" >
			<p class="float-right"><a href="#">Back to top</a></p>
			<p>Copyright Feedback, &copy; 2021</p>
	</footer>
	<script src="js\bootstrap.min.js"></script>
</body>
</html>