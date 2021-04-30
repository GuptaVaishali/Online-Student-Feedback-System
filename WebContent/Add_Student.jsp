<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Student</title>
</head>
<body>
	<% 	
		try{
			String sname = request.getParameter("sname");
			String susername = request.getParameter("susername");
			String spassword = request.getParameter("spassword");
			String mobile = request.getParameter("smobileno");
			int sem = Integer.parseInt((request.getParameter("studsem")).trim());
			int age = Integer.parseInt((request.getParameter("sage")).trim());
			int courseid = Integer.parseInt((request.getParameter("course_name")).trim());
			int deptid = Integer.parseInt((request.getParameter("dept_name")).trim());
			System.out.println(sname + "  " + susername + " " + spassword + " " + mobile + " " +sem + " " + age + " " +courseid + " " + deptid);
			
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3309/feedbackdb?autoReconnect=true&useSSL=false","root","vaishali@97");  
			//here inventory db is database name, root is username and vaishali@97 is password 
			
			PreparedStatement st=con.prepareStatement("select * from student where susername = ?");
			st.setString(1,susername);
			ResultSet rs= st.executeQuery();  	
			if(rs.next()==false)  {
			
				PreparedStatement stmt=con.prepareStatement("insert into student(sname,susername,spassword,mobile_no,semester,age,course_id,dept_id) values(?,?,?,?,?,?,?,?)");  
				
				stmt.setString(1,sname);
				stmt.setString(2,susername);
				stmt.setString(3,spassword);
				stmt.setString(4,mobile);
				stmt.setInt(5,sem);
				stmt.setInt(6,age);
				stmt.setInt(7,courseid);
				stmt.setInt(8,deptid);
				
				int row = stmt.executeUpdate(); 
				System.out.println("row affected" + row);
				session.setAttribute("message", "Student Added Sucessfully");
				session.setAttribute("msg_type", "success");
				response.sendRedirect("ViewStudents.jsp");
			
			}
			else
			{ 
				response.sendRedirect("ViewStudents.jsp");
				session.setAttribute("message", "Student Username Already exists");
				session.setAttribute("msg_type", "danger");
			}
			con.close();  
		}catch(Exception e){}	
	%>
	
</body>
</html>