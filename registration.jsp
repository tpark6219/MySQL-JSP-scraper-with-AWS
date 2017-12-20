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
	try	{
		 
		    String user = request.getParameter("uname");    
		    String pwd = request.getParameter("pass");
		    String name = request.getParameter("name");
		    String email = request.getParameter("email");
		    String addr = request.getParameter("addr");
		    String city = request.getParameter("city");
		    String phone = request.getParameter("phone");
		    float age = Float.valueOf(request.getParameter("age"));
		    float salary = Float.valueOf(request.getParameter("salary"));
	    	String url = "jdbc:mysql://tjpdb336.ckaplzsssmd2.us-east-1.rds.amazonaws.com:3306/BarBeerDrinker";
	    	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		    Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection(url, "tjp336", "mypassword");
	    	//Create a SQL statement
		    Statement stmt = con.createStatement();
	        int idExist = -5;
	        ResultSet result;
		    while(true)
		    {

		    	String str2 = "select count(username) as cnt from drinkers where username = '" + user + "'";
			    result = stmt.executeQuery(str2);
			    result.next();
			    idExist = result.getInt("cnt");
		    	if(idExist > 0)
		    		
		    	{
		    		out.print("Username already exists!"+"<a href='reg.jsp'> click here </a>" );
		    		break;
		    	}
		    	else
		    		break;
		    }	    

			if(idExist  <= 0 )
			{
		    //ResultSet rs;
		    String insert = "INSERT INTO drinkers(name, city, phone, addr, username, pass, email, age, salary)" + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(insert);
			ps.setString(1, name);
			ps.setString(2, city);
			ps.setString(3, phone);
			ps.setString(4, addr);
			ps.setString(5, user);
			ps.setString(6, pwd);
			ps.setString(7, email);
			ps.setFloat(8, age);
			ps.setFloat(9, salary);
			ps.executeUpdate();
		    out.print("Registration Successfull!"+"<a href='front.jsp'>Go to Login</a>");
		    }
				
			
		}catch (Exception e) 
		{
			
			out.print("Registration unsuccessful");
		}
%>



</body>
</html>