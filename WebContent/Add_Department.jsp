<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String dname = request.getParameter("deptname");
	try{  
	 	Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3309/feedbackdb?autoReconnect=true&useSSL=false"
						                             ,"root","vaishali@97"); 
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("Select dept_name from department where dept_name = '" + dname + "'");
		if(rs.next() == false){
			PreparedStatement stmt=con.prepareStatement("insert into department(dept_name) values(?)");
			stmt.setString(1,dname);
			int row = stmt.executeUpdate();
			System.out.println("Rows Affected:" + row);
			response.sendRedirect("ViewDepartments.jsp");
			session.setAttribute("message", "Department Added Sucessfully");
			session.setAttribute("msg_type", "success");
			con.close();  
		}
		else{
			response.sendRedirect("ViewDepartments.jsp");
			session.setAttribute("message", "This Department Already exists");
			session.setAttribute("msg_type", "danger");
		}
			
	}catch(Exception e){ System.out.println(e);}  
%>


<!--  <script type="text/javascript">
	alert("Department Added Successfully");
</script> -->
</body>
</html>