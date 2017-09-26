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
String user=request.getParameter("userid"); 
session.putValue("user",user); 
String pwd=request.getParameter("pwd"); 
String fname=request.getParameter("fname"); 
String lname=request.getParameter("lname"); 
String email=request.getParameter("email");/* here lab is project name of sql database */
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nishant?autoReconnect=true&useSSL=false",
"root","root"); 
Statement st= con.createStatement();  
ResultSet rs=st.executeQuery("select * from regt where userid='"+user+"'");
if(rs.next()){
	out.println("username already exists");
}
else{
st.executeUpdate("insert into regt values('"+user+"','"+pwd+"','"+fname+"','"+lname+"','"+email+"',0,0)"); /* here lab.test is lab(project_name) and test(project_table_name) */

out.println("Registered\n"); 
}

%>
<br/><br/><a href ="Login.html">Login</a><br/><br/>
<a href="index.html">Home</a>
</body>
</html>
