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
String User=request.getParameter("username");
String Branch=request.getParameter("branch");  
String Address=request.getParameter("address"); 
String DOB=request.getParameter("dob"); 
String Contact=request.getParameter("contact"); 
String bank_account=request.getParameter("bank_account");  /* here lab is project name of sql database */
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nishant?autoReconnect=true&useSSL=false",
"root","root"); 
Statement st= con.createStatement();  
int j=st.executeUpdate("delete from info where username='"+User+"'");
int i=st.executeUpdate("insert into info values ('"+Branch+"','"+Address+"','"+DOB+"','"+Contact+"','"+bank_account+"','"+User+"')"); /* here lab.test is lab(project_name) and test(project_table_name) */

out.println("information updated");  

%>
<br/><br/><a href ="Login.html">Login</a><br/><br/>
<a href="index.html">Home</a>
</body>
</html>
