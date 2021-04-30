<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Subject</title>
</head>
<body>
	<% 	
		try{
			String subname = request.getParameter("subname");
			int sem = Integer.parseInt((request.getParameter("sem")).trim());
			int courseid = Integer.parseInt((request.getParameter("course_name")).trim());
			int teacherid = Integer.parseInt((request.getParameter("teacher_name")).trim());
			System.out.println(subname +" " + sem +  " " +courseid + " " + teacherid);
			
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3309/feedbackdb?autoReconnect=true&useSSL=false","root","vaishali@97");  
			//here feedback db is database name, root is username and vaishali@97 is password 
			
			PreparedStatement st=con.prepareStatement("select * from subject where sub_name = ?");
			st.setString(1,subname);
			
			ResultSet rs= st.executeQuery();  	
			if(rs.next()==false)  {		
				PreparedStatement stmt=con.prepareStatement("insert into subject(sub_name,semester,course_id,tid) values(?,?,?,?)");  
				
				stmt.setString(1,subname);
				stmt.setInt(2,sem);
				stmt.setInt(3,courseid);
				stmt.setInt(4,teacherid);
				int row = stmt.executeUpdate(); 
				System.out.println("row affected" + row);
				session.setAttribute("message", "Subject Added Sucessfully");
				session.setAttribute("msg_type", "success");
				response.sendRedirect("ViewSubjects.jsp");
			}
			else
			{ 
				response.sendRedirect("ViewSubjects.jsp");
				session.setAttribute("message", "This Subject Already exists");
				session.setAttribute("msg_type", "danger");
			}
			con.close();  
		}catch(Exception e){}	
	%>
</body>
</html>