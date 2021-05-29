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
    <title>Feedback Form</title>
	<script>
		function fun(){
			var q1 = document.getElementsByName('A');
			var isChecked_q1 = false;
			for ( var i = 0; i < q1.length; i++) {
			    if(q1[i].checked) {
			        isChecked_q1 = true;
			        break;
			    }
			}
			if(!isChecked_q1)   { 
			    alert("Please Give Feedback For Ques1");
			    return false;
			}
			
			var q2 = document.getElementsByName('B');
			var isChecked_q2 = false;
			for ( var i = 0; i < q2.length; i++) {
			    if(q2[i].checked) {
			        isChecked_q2 = true;
			        break;
			    }
			}
			if(!isChecked_q2)   { 
			    alert("Please Give Feedback For Ques2");
			    return false;
			}
			
			var q3 = document.getElementsByName('C');
			var isChecked_q3 = false;
			for ( var i = 0; i < q3.length; i++) {
			    if(q3[i].checked) {
			        isChecked_q3 = true;
			        break;
			    }
			}
			if(!isChecked_q3)   { 
			    alert("Please Give Feedback For Ques3");
			    return false;
			}
			
			var q4 = document.getElementsByName('D');
			var isChecked_q4 = false;
			for ( var i = 0; i < q4.length; i++) {
			    if(q4[i].checked) {
			        isChecked_q4 = true;
			        break;
			    }
			}
			if(!isChecked_q4)   { 
			    alert("Please Give Feedback For Ques4");
			    return false;
			}
			
			var q5 = document.getElementsByName('E');
			var isChecked_q5 = false;
			for ( var i = 0; i < q5.length; i++) {
			    if(q5[i].checked) {
			        isChecked_q5 = true;
			        break;
			    }
			}
			if(!isChecked_q5)   { 
			    alert("Please Give Feedback For Ques5");
			    return false;
			}
			
			var q6 = document.getElementsByName('F');
			var isChecked_q6 = false;
			for ( var i = 0; i < q6.length; i++) {
			    if(q6[i].checked) {
			        isChecked_q6 = true;
			        break;
			    }
			}
			if(!isChecked_q6)   { 
			    alert("Please Give Feedback For Ques6");
			    return false;
			}
			
			var q7 = document.getElementsByName('G');
			var isChecked_q7 = false;
			for ( var i = 0; i < q7.length; i++) {
			    if(q7[i].checked) {
			        isChecked_q7 = true;
			        break;
			    }
			}
			if(!isChecked_q7)   { 
			    alert("Please Give Feedback For Ques7");
			    return false;
			}
			
			var q8 = document.getElementsByName('H');
			var isChecked_q8 = false;
			for ( var i = 0; i < q8.length; i++) {
			    if(q8[i].checked) {
			        isChecked_q8 = true;
			        break;
			    }
			}
			if(!isChecked_q8)   { 
			    alert("Please Give Feedback For Ques8");
			    return false;
			}
			
			var q9 = document.getElementsByName('I');
			var isChecked_q9 = false;
			for ( var i = 0; i < q9.length; i++) {
			    if(q9[i].checked) {
			        isChecked_q9 = true;
			        break;
			    }
			}
			if(!isChecked_q9)   { 
			    alert("Please Give Feedback For Ques9");
			    return false;
			}
			
			var q10 = document.getElementsByName('J');
			var isChecked_q10 = false;
			for ( var i = 0; i < q10.length; i++) {
			    if(q10[i].checked) {
			        isChecked_q10 = true;
			        break;
			    }
			}
			if(!isChecked_q10)   { 
			    alert("Please Give Feedback For Ques10");
			    return false;
			}
			
			var q11 = document.getElementsByName('K');
			var isChecked_q11 = false;
			for ( var i = 0; i < q11.length; i++) {
			    if(q11[i].checked) {
			        isChecked_q11 = true;
			        break;
			    }
			}
			if(!isChecked_q11)   { 
			    alert("Please Give Feedback For Ques11");
			    return false;
			}
		}
	</script>
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
      				<a class="nav-link text-white" href="StudentHome.jsp?studentid=<%=request.getParameter("studentid")%>"> Home </a>
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
            <h1 class="text-center text-muted">Feedback Form</h1>
          </div>
        </div>
      </div>
    </header>
    
	<form action="FeedbackForm1.jsp" method = "get" onsubmit = "return fun()" style = "max-width:800px; margin:auto;">
		<input type= "hidden" name = "stuid" value = "<%=request.getParameter("studentid")%>">
		<input type= "hidden" name = "teacherid" value = "<%=request.getParameter("teacher_name")%>">
		<div class="mb-3">
		   	<label for="subname" class="form-label">Subject_Name</label>
			<select name="subject_name" class = "form-select" id = "subname" size="1">
		<%
	//	int teacherid = Integer.parseInt((request.getParameter("teacher_name")).trim());
	//	System.out.println(teacherid);
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3309/feedbackdb?autoReconnect=true&useSSL=false","root","vaishali@97");  
			//here feedback db is database name, root is username and vaishali@97 is password  
			Statement stmt=con.createStatement();  
			ResultSet rs=stmt.executeQuery("select * from subject where tid = '" +  request.getParameter("teacher_name") + "'");  
			while(rs.next())  {
			int subid = rs.getInt(1);
			String subname = rs.getString(2);
			
		%>
			<option value="<%=subid %> "> <%=subname%></option>
			
		<% 
			}
		%>
			</select>
			</div>
		<% 
			con.close();  
			}catch(Exception e){ System.out.println(e);}  		
		%>
		
		<div Style = "background-color:lightpink; padding-left:5px;">
		<h4> Dear Student,</h4>
		<p>You are requested to give your frank and objective opinion, by ticking the appropriate choice, about the concerned teacher on
		under mentioned indices for quality evaluation. Your response will be kept confidential</p>
		</div>
		
		<h5 style = "color:blue;">1. Teacher's ability to bring Conceptual clarity and thinking</h5>
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "A"  id = "A1" value="1">
			<label class="form-check-label" for="A1">Poor</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "A"  id = "A2" value="2">
			<label class="form-check-label" for="A2">Average</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "A"  id = "A3" value="3">
			<label class="form-check-label" for="A3">Good</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "A"  id = "A4" value="4">
			<label class="form-check-label" for="A4">Very Good</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "A"  id = "A5" value="5">
			<label class="form-check-label" for="A5">Excellent</label>
		</div>
		
		
		<h5 style = "color:blue;">2. Teacher's ability to provide motivation</h5>
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "B" id = "B1" value="1">
			<label  class="form-check-label" for="B1">Poor</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "B" id = "B2" value="2">
			<label  class="form-check-label" for="B2">Average</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "B" id = "B3" value="3">
			<label  class="form-check-label" for="B3">Good</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "B" id = "B4" value="4">
			<label class="form-check-label"  for="B4">Very Good</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "B" id = "B5" value="5">
			<label class="form-check-label" for="B5">Excellent</label>
		</div>
		
		<h5 style = "color:blue;">3. Teacher's communication skill</h5>
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "C" id = "C1" value="1">
			<label class="form-check-label" for="C1">Poor</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "C" id = "C2" value="2">
			<label class="form-check-label" for="C2">Average</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "C" id = "C3" value="3">
			<label class="form-check-label" for="C3">Good</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "C" id = "C4" value="4">
			<label class="form-check-label" for="C4">Very Good</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "C" id = "C5" value="5">
			<label class="form-check-label" for="C5">Excellent</label>
		</div>
		
		<h5 style = "color:blue;">4. Teacher's regularity and punctuality</h5>
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "D" id = "D1" value="1">
			<label class="form-check-label" for="D1">Poor</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "D" id = "D2" value="2">
			<label class="form-check-label" for="D2">Average</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "D" id = "D3" value="3">
			<label class="form-check-label" for="D3">Good</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "D" id = "D4" value="4">
			<label class="form-check-label" for="D4">Very Good</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "D" id = "D5" value="5">
			<label class="form-check-label" for="D5">Excellent</label>
		</div>
		
		<h5 style = "color:blue;">5. Teacher's ability for explaining areas of confusion</h5>
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "E" id = "E1" value="1">
			<label class="form-check-label" for="E1">Poor</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "E" id = "E2" value="2">
			<label class="form-check-label" for="E2">Average</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "E" id = "E3" value="3">
			<label class="form-check-label" for="E3">Good</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "E" id = "E4" value="4">
			<label class="form-check-label" for="E4">Very Good</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "E" id = "E5" value="5">
			<label class="form-check-label" for="E5">Excellent</label>
		</div>
		
		<h5 style = "color:blue;">6. Teacher's guidance after class hours</h5>
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "F" id = "F1" value="1">
			<label class="form-check-label" for="F1">Poor</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "F" id = "F2" value="2">
			<label class="form-check-label" for="F2">Average</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "F" id = "F3" value="3">
			<label class="form-check-label" for="F3">Good</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "F" id = "F4" value="4">
			<label class="form-check-label" for="F4">Very Good</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "F" id = "F5" value="5">
			<label class="form-check-label" for="F5">Excellent</label>
		</div>
		
		<h5 style = "color:blue;">7. Teacher's ability to explain theory with practical</h5>
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "G" id = "G1" value="1">
			<label class="form-check-label" for="G1">Poor</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "G" id = "G2" value="2">
			<label class="form-check-label" for="G2">Average</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "G" id = "G3" value="3">
			<label class="form-check-label" for="G3">Good</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "G" id = "G4" value="4">
			<label class="form-check-label" for="G4">Very Good</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "G" id = "G5" value="5">
			<label class="form-check-label" for="G5">Excellent</label>
		</div>
		
		<h5 style = "color:blue;">8. Teacher's Computer/IT skills</h5>
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "H" id = "H1" value="1">
			<label class="form-check-label" for="H1">Poor</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "H" id = "H2" value="2">
			<label class="form-check-label" for="H2">Average</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "H" id = "H3" value="3">
			<label class="form-check-label" for="H3">Good</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "H" id = "H4" value="4">
			<label class="form-check-label" for="H4">Very Good</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "H" id = "H5" value="5">
			<label class="form-check-label" for="H5">Excellent</label>
		</div>
		
		<h5 style = "color:blue;">9. Completion and coverage of syllabus</h5>
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "I" id = "I1" value="1">
			<label class="form-check-label" for="I1">Poor</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "I" id = "I2" value="2">
			<label class="form-check-label" for="I2">Average</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "I" id = "I3" value="3">
			<label class="form-check-label" for="I3">Good</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "I" id = "I4" value="4">
			<label class="form-check-label" for="I4">Very Good</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "I" id = "I5" value="5">
			<label class="form-check-label" for="I5">Excellent</label>
		</div>
		
		<h5 style = "color:blue;">10. Teacher's overall performance</h5>
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "J" id = "J1" value="1">
			<label class="form-check-label" for="J1">Poor</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "J" id = "J2" value="2">
			<label class="form-check-label" for="J2">Average</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "J" id = "J3" value="3">
			<label class="form-check-label" for="J3">Good</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "J" id = "J4" value="4">
			<label class="form-check-label" for="J4">Very Good</label> 
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "J" id = "J5" value="5">
			<label class="form-check-label" for="J5">Excellent</label> 
		</div>
		
		<h5 style = "color:blue;">11. Did you Enjoy online teaching</h5>
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "K" id = "K1" value="1">
			<label class="form-check-label" for="K1">Poor</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "K" id = "K2" value="2">
			<label class="form-check-label" for="K2">Average</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "K" id = "K3" value="3">
			<label class="form-check-label" for="K3">Good</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "K" id = "K4" value="4">
			<label class="form-check-label" for="K4">Very Good</label>
		</div>
		
		<div class="form-check form-check-inline">
			<input type = "radio" class="form-check-input" name = "K" id = "K5" value="5">
			<label class="form-check-label" for="K5">Excellent</label>
		</div>
		
		<input type = "submit" class="w-100 btn btn-lg btn-primary mb-3 mt-3" value = "submit">
		
	</form>
	
	 <%  if( session.getAttribute("message") != null){ %> 
    		<div class='alert alert-danger alert-dismissible fade show' role="alert">
	  			<%=session.getAttribute("message")%>
	  			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
	<% session.removeAttribute("message"); }	%> 
	
	<footer id="footer" style = "text-align: center;padding: 3px;margin-top:3px; background-color:gray; color: white;" >
		<p class="float-right"><a href="#">Back to top</a></p>
		<p>Copyright Feedback, &copy; 2021</p>
	</footer>
	<script src="js\bootstrap.min.js"></script>
	
</body>
</html>