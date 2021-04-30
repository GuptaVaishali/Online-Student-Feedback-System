<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Teacher</title>
</head>
<body>
	<% 	
		try{
			String tname = request.getParameter("tname");
			String tuname = request.getParameter("tusername");
			String tpassword = request.getParameter("tpassword");
			String mobile = request.getParameter("tmobileno");
			int courseid = Integer.parseInt((request.getParameter("course_name")).trim());
			int deptid = Integer.parseInt((request.getParameter("dept_name")).trim());
			System.out.println(tname + "  " + tuname + " " + tpassword + " " + mobile + " " + courseid + " " + deptid);
			
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3309/feedbackdb?autoReconnect=true&useSSL=false","root","vaishali@97");  
			//here inventory db is database name, root is username and vaishali@97 is password 
			
			PreparedStatement st=con.prepareStatement("select * from teacher where tusername = ?");
			st.setString(1,tuname);
			ResultSet rs= st.executeQuery();  	
			if(rs.next()==false)  {
				PreparedStatement stmt=con.prepareStatement("insert into teacher(tname,tusername,tpassword,mobile_no,course_id,dept_id) values(?,?,?,?,?,?)");  
				
				stmt.setString(1,tname);
				stmt.setString(2,tuname);
				stmt.setString(3,tpassword);
				stmt.setString(4,mobile);
				stmt.setInt(5,courseid);
				stmt.setInt(6,deptid);
				int row = stmt.executeUpdate(); 
				System.out.println("row affected" + row);
				
				session.setAttribute("message", "Teacher Added Sucessfully");
				session.setAttribute("msg_type", "success");
				response.sendRedirect("ViewTeachers.jsp");
			}
			else
			{ 
				response.sendRedirect("ViewTeachers.jsp");
				session.setAttribute("message", "This Teacher Already exists");
				session.setAttribute("msg_type", "danger");
			}
			con.close();  
		}catch(Exception e){}	
%>
</body>
</html>