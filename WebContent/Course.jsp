<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Courses Of Respective Departments</title>
</head>
<body>
<%
	int deptid = Integer.parseInt(request.getParameter("dname").trim());
	try{
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:mysql://localhost:3309/feedbackdb?autoReconnect=true&useSSL=false","root","vaishali@97");  
	//here feedback db is database name, root is username and vaishali@97 is password 
	
	Statement st=con.createStatement();

	ResultSet rs = st.executeQuery("select * from course where course.dept_id = '" + deptid +"'");
	
			while(rs.next()){
	%>
				<option value = "<%= rs.getInt(1) %>"> <%= rs.getString(2) %> </option>
	<% 
			}		
			con.close();  
	}catch(Exception e){}	
	%>

</body>
</html>