<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
body{
	background-color:pink
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>atozknowledge.com demo loginjsp</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
String userid=request.getParameter("usr"); 
session.putValue("userid",userid); 
String userlogin=request.getParameter("log");
//out.println(userlogin);

String pwd=request.getParameter("pwd"); 
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nishant?autoReconnect=true&useSSL=false","root","root"); 
Statement st= con.createStatement();
if(userlogin.equals("user")){
ResultSet rs=st.executeQuery("select * from regt where userid='"+userid+"' and permission=1 ");
if(rs.next()) 
{ 
if(rs.getString(2).equals(pwd)) 
{ 
out.println("WELCOME\n   USERID: "+userid+"\n\n");
ResultSet rs2=st.executeQuery("select * from info where username='"+userid+"'");
if(rs2.next()){
	int k=1;
	for(k=1;k<=5;k++){
		switch(k){
		case 1:
		out.println("<br/>BRANCH:");
		out.println(rs2.getString(k));
		break;
		case 2:out.println("<br/>ADDRESS:");
		out.println(rs2.getString(k));break;
		case 3:out.println("<br/>DOB:");
		out.println(rs2.getString(k));break;
		case 4:out.println("<br/>CONTACT:");
		out.println(rs2.getString(k));break;
		case 5:out.println("<br/>BANK_ACC:");
		out.println(rs2.getString(k));break;
		}
	}
}
else{
	out.println("NO INFORMATION AVAILABLE");
}
String information="<a href=\"student_info.html\">UPDATE STUDENT INFO</a>";
out.println("<br/><br/>");
out.println(information);
} 
else 
{ 
out.println("Invalid password try again\n"); 
} 
} 
else {
	out.println("Invalid userid or not authenticated try again\n");
}
}
else{
	ResultSet rs1=st.executeQuery("select * from regt where userid='"+userid+"'and admin=1");
	if(rs1.next()) 
	{ 
	if(rs1.getString(2).equals(pwd)) 
	{ 
		
		String url="http://localhost:8080/nishant123/admin.jsp";
		response.sendRedirect(url);
	}
	else{
		out.println("invalid password");
	}
	}
	else{
		out.println("not a valid userid or not a admin");
	}
}
%>
<br/><br/><a href="index.html">Home</a>
</br>
</br>
</body>
</html>
