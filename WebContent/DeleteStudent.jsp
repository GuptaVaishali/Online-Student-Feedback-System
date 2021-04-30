<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Student</title>
</head>
<body>
	<%
	try{  
		int sid = Integer.parseInt((request.getParameter("sid")).trim());
		System.out.println(sid);
		Class.forName("com.mysql.jdbc.Driver"); 
		Connection con=DriverManager.getConnection(  
		"jdbc:mysql://localhost:3309/feedbackdb?autoReconnect=true&useSSL=false","root","vaishali@97");  
		//here feedback db is database name, root is username and vaishali@97 is password  
		Statement stmt=con.createStatement();  
		int rs=stmt.executeUpdate("delete from student where sid = '" + sid + "'");  
		response.sendRedirect("ViewStudents.jsp");
		con.close();  
		}catch(Exception e){ System.out.println(e);}  		
	%>
</body>
</html>