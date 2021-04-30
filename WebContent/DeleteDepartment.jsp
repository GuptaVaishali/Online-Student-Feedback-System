<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Department</title>
</head>
<body>
	<%
	try{  
		int deptid = Integer.parseInt((request.getParameter("deptid")).trim());
		System.out.println(deptid);
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection(  
		"jdbc:mysql://localhost:3309/feedbackdb?autoReconnect=true&useSSL=false","root","vaishali@97");  
		//here feedback db is database name, root is username and vaishali@97 is password  
		Statement stmt=con.createStatement();  
		int rs=stmt.executeUpdate("delete from department where dept_id = '" + deptid + "'");  
		response.sendRedirect("ViewDepartments.jsp");
		con.close();  
		}catch(Exception e){ System.out.println(e);}  		
	%>
</body>
</html>