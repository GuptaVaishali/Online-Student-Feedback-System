<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Feedback Form1</title>
</head>
<body>
	<%
	try{
		int sid = Integer.parseInt((request.getParameter("stuid")).trim());
		int teacherid = Integer.parseInt((request.getParameter("teacherid")).trim());
		int subid = Integer.parseInt((request.getParameter("subject_name")).trim());
		int q1 = Integer.parseInt((request.getParameter("A")).trim());
		int q2 = Integer.parseInt((request.getParameter("B")).trim());
		int q3 = Integer.parseInt((request.getParameter("C")).trim());
		int q4 = Integer.parseInt((request.getParameter("D")).trim());
		int q5 = Integer.parseInt((request.getParameter("E")).trim());
		int q6 = Integer.parseInt((request.getParameter("F")).trim());
		int q7 = Integer.parseInt((request.getParameter("G")).trim());
		int q8 = Integer.parseInt((request.getParameter("H")).trim());
		int q9 = Integer.parseInt((request.getParameter("I")).trim());
		int q10 = Integer.parseInt((request.getParameter("J")).trim());
		int q11 = Integer.parseInt((request.getParameter("K")).trim());
		
		System.out.println(sid + " " + teacherid + " " + subid);
		
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection(  
		"jdbc:mysql://localhost:3309/feedbackdb?autoReconnect=true&useSSL=false","root","vaishali@97");  
		//here feedback db is database name, root is username and vaishali@97 is password 
		
		System.out.println("Connection created");
		
		PreparedStatement stmt=con.prepareStatement("select * from feedback where sid = ? and teacher_id = ? and sub_id = ?");
		stmt.setInt(1,sid);
		stmt.setInt(2,teacherid);
		stmt.setInt(3,subid);
		
		System.out.println("Query created with parameters");
		
		ResultSet rs= stmt.executeQuery();  	
		if(rs.next()==false)  {
		
			System.out.println("result set empty");
		
			PreparedStatement st=con.prepareStatement("insert into feedback(sid,sub_id,teacher_id,ques1,ques2,ques3,ques4,ques5,ques6,ques7,ques8,ques9,ques10,ques11) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			st.setInt(1,sid);
			st.setInt(2,subid);
			st.setInt(3,teacherid);
			st.setInt(4,q1);
			st.setInt(5,q2);
			st.setInt(6,q3);
			st.setInt(7,q4);
			st.setInt(8,q5);
			st.setInt(9,q6);
			st.setInt(10,q7);
			st.setInt(11,q8);
			st.setInt(12,q9);
			st.setInt(13,q10);
			st.setInt(14,q11);
			
			int row = st.executeUpdate(); 
			System.out.println("feedback submitted " + row);
			session.setAttribute("message","Feedback Submitted");
			response.sendRedirect("FeedbackForm.jsp?studentid="+sid+ "&teacherid=" + teacherid); 
		}
		else{
			session.setAttribute("message","Feedback has been submitted for this teacher already");
			System.out.println("Feedback has been submitted for this teacher already");
			response.sendRedirect("FeedbackForm.jsp?studentid="+sid +"&teacherid=" + teacherid); 
		}	
		con.close();  
	}catch(Exception e){}	
	%>
</body>
</html>