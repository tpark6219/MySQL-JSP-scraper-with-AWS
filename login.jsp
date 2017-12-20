<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Beer World</title>
</head>
<body>


<%
    String username = request.getParameter("username");    
    String pwd = request.getParameter("pass");
    
	
    String url = "jdbc:mysql://tjpdb336.ckaplzsssmd2.us-east-1.rds.amazonaws.com:3306/BarBeerDrinker";
	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
    Class.forName("com.mysql.jdbc.Driver");

	//Create a connection to your DB
    //Connection con = DriverManager.getConnection(url, "csuser", "your_pwd");
    Connection con = DriverManager.getConnection(url, "tjp336", "mypassword");
	//Create a SQL statement
    Statement stmt = con.createStatement();
    ResultSet rs;
    rs = stmt.executeQuery("SELECT * FROM drinkers where username ='" + username + "' and pass ='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("username", username);
        response.sendRedirect("userfront.jsp");
    } else {
        out.println("Invalid password or Invalid username <a href='front.jsp'>try again</a>");
    }
%>
	


</body>
</html>