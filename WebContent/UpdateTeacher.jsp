<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Teacher</title>
</head>
<body>
	<% 	
		try{
			int tid = Integer.parseInt((request.getParameter("tid")).trim());
			String tname = request.getParameter("tname");
			String tuname = request.getParameter("tusername");
			String tpassword = request.getParameter("tpassword");
			String mobile = request.getParameter("tmobileno");
			int courseid = Integer.parseInt((request.getParameter("course_name")).trim());
			int deptid = Integer.parseInt((request.getParameter("dept_name")).trim());
			System.out.println(tid + " " + tname + "  " + tuname + " " + tpassword + " " + mobile + " " + courseid + " " + deptid);
			
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3309/feedbackdb?autoReconnect=true&useSSL=false","root","vaishali@97");  
			//here inventory db is database name, root is username and vaishali@97 is password
			
				PreparedStatement stmt=con.prepareStatement("update teacher set tname = ? ,tusername = ? ,tpassword = ? ,mobile_no = ? ,course_id = ? ,dept_id = ? where teacher_id = ?");  
				
				System.out.println("statements created");
				stmt.setString(1,tname);
				stmt.setString(2,tuname);
				stmt.setString(3,tpassword);
				stmt.setString(4,mobile);
				stmt.setInt(5,courseid);
				stmt.setInt(6,deptid);
				stmt.setInt(7, tid);
				System.out.println("parameters set");
				
				int row = stmt.executeUpdate(); 
				System.out.println("row affected" + row);
				
				session.setAttribute("message", "Teacher Updated Sucessfully");
				session.setAttribute("msg_type", "success");
				response.sendRedirect("ViewTeachers.jsp");
			con.close();  
		}catch(Exception e){}	
%>
</body>
</html>