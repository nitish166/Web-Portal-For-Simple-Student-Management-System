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
<title>Insert title here</title>
</head>
<body>
<form action="action.jsp" method="post">
activate:<input type="text" name="userid"/><br/><br/>
<input type="submit" />
</form>
		<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<% 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nishant?autoReconnect=true&useSSL=false","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select userid from regt where permission=0 ");
String msg="ACCOUNT ACTIVATION REQUESTS";
out.println("<h1>"+msg+"</h1>");
while(rs.next()){
out.println("<h1>"+ rs.getString(1)+"</h1>");	
}

%>
<br/><br/><a href="list.jsp">list of student</a>
</body>
</html>