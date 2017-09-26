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
<title>atozknowledge.com demo Regjsp</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
/* here lab is project name of sql database */
String userid=request.getParameter("userid");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nishant?autoReconnect=true&useSSL=false",
"root","root"); 
Statement st= con.createStatement();  
ResultSet rs2=st.executeQuery("select * from regt where userid='"+userid+"' and admin=0");
if(rs2.next()){
int j=st.executeUpdate("delete from info where username='"+userid+"'"); /* here lab.test is lab(project_name) and test(project_table_name) */
int k=st.executeUpdate("delete from regt where userid='"+userid+"'");
out.println("the user deleted from database");
}
else{
	out.println("CANNOT DELETE THE USER");
}
%>
<a href="index.html">Home</a>
</body>
</html>
