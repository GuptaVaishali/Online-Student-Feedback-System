<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Subject</title>
</head>
<body>
	<%
	try{  
		int subid = Integer.parseInt((request.getParameter("subid")).trim());
		System.out.println(subid);
		Class.forName("com.mysql.jdbc.Driver"); 
		Connection con=DriverManager.getConnection(  
		"jdbc:mysql://localhost:3309/feedbackdb?autoReconnect=true&useSSL=false","root","vaishali@97");  
		//here feedback db is database name, root is username and vaishali@97 is password  
		Statement stmt=con.createStatement();  
		int rs=stmt.executeUpdate("delete from subject where sub_id = '" + subid + "'");  
		response.sendRedirect("ViewSubjects.jsp");
		con.close();  
		}catch(Exception e){ System.out.println(e);}  		
	%>
</body>
</html>