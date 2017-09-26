<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
	String userid=request.getParameter("userid");
	Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nishant?autoReconnect=true&useSSL=false","root","root"); 
Statement st= con.createStatement(); 
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
String information="<a href=\"student_info.jsp\">UPDATE STUDENT INFO</a>";
out.println("<br/><br/>");
out.println(information);
%>
</body>
</html>
