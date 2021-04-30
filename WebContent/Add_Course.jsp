<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Course</title>
</head>
<body>
<%
	try{
		String coursename = request.getParameter("coursename");
		int deptid = Integer.parseInt((request.getParameter("dept_name")).trim());
		System.out.println(coursename + " " + deptid);
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection(  
		"jdbc:mysql://localhost:3309/feedbackdb?autoReconnect=true&useSSL=false","root","vaishali@97");  
		//here inventory db is database name, root is username and vaishali@97 is password  
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("Select course_name from course where course_name = '" + coursename + "'");
		if(rs.next() == false){
			PreparedStatement stmt=con.prepareStatement("insert into course(course_name,dept_id) values(?,?)");  
			stmt.setString(1,coursename);
			stmt.setInt(2,deptid);
			int row = stmt.executeUpdate();  
			session.setAttribute("message", "Course Added Sucessfully");
			session.setAttribute("msg_type", "success");
			response.sendRedirect("ViewCourses.jsp");
			con.close(); 
		}
		else{
			response.sendRedirect("ViewCourses.jsp");
			session.setAttribute("message", "This Course Already exists");
			session.setAttribute("msg_type", "danger");
		}
	}catch(Exception e){}	
%>

</body>
</html>