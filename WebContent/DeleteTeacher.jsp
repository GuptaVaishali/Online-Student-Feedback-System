<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Teacher</title>
</head>
<body>
<%
	try{
		int teacherid = Integer.parseInt((request.getParameter("tid").trim()));  
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3309/feedbackdb?autoReconnect=true&useSSL=false"
							                             ,"root","vaishali@97"); 
		PreparedStatement stmt=con.prepareStatement("Delete from teacher where teacher_id = ?");
		stmt.setInt(1,teacherid);
		int rs=stmt.executeUpdate();  
		System.out.println("Teacher Deleted" + rs);
		response.sendRedirect("ViewTeachers.jsp");
		con.close();  
	}catch(Exception e){ System.out.println(e);} 	
%>
</body>
</html>