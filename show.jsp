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
	List<String> list = new ArrayList<String>();

	try {



	    	//Create a connection string
			//String url = "jdbc:mysql://your_VM:3306/your_db";
	    	String url = "jdbc:mysql://tjpdb336.ckaplzsssmd2.us-east-1.rds.amazonaws.com:3306/BarBeerDrinker";
	    	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		    Class.forName("com.mysql.jdbc.Driver");
	    

		    Connection con = DriverManager.getConnection(url, "tjp336", "mypassword");
	    	//Create a SQL statement
		    Statement stmt = con.createStatement();
	    	//Get the selected radio button from the HelloWorld.jsp
		    String entity = request.getParameter("command");
	    	int happy = 0;
	    	int bar = 0;
	    	String str;
	    	if(entity.equals("barsH"))
	    	{
	    		entity = "bars";
	    		happy = 1;
	    	} if (entity.equals("bar"))
	    	{
	    		entity = "bars";
	    		bar = 1;
	    			str = "SELECT b.name, b.city FROM drinkers d, bars b WHERE d.username = '" + session.getAttribute("username") + "' AND d.city = b.city";
	    	}
	    	else{
	    	//Make a SELECT query from the table specified by the 'command' parameter at the HelloWorld.jsp
				str = "SELECT * FROM " + entity;
	    	}
	    	//Run the query against the database.;l
		    ResultSet result = stmt.executeQuery(str);
		   
		    //Make an HTML table to show the results in:
		    out.print("<table>");
		    
	    	   //make a row
		       out.print("<tr>");
	    	   //make a column
		       out.print("<td>");
	    	   //print out column header
		       out.print("name");
		       out.print("</td>");
		       //make a column
		       out.print("<td>");
		       //depending on the radio button selection make a column header for Manufacturer if the beers table was selected and Address if the bars table was selected
		       if (entity.equals("beers"))
		       		out.print("manf");
		       else if (happy == 1)
		    	   out.print("hour");
		       else if (bar == 1)
		      	   out.print("bar");
		       else
		    	   out.print("addr");
		       out.print("</td>");
		       out.print("</tr>");
		    
		    //parse out the results
		    while(result.next())
		    {
		       //make a row
		       out.print("<tr>");
		       //make a column
		       out.print("<td>");
		       //Print out current bar or beer name:
		       out.print(result.getString("name"));
		       out.print("</td>");
		       out.print("<td>");
		       //Print out current bar/beer additional info: Manf or Address
		       if (entity.equals("beers"))
		       		out.print(result.getString("manf"));
		       else if(happy == 1)
		    	   out.print(result.getString("happyhour"));
		       else if(bar == 1)
		    	   out.print(result.getString("city"));
		       else
		    	   out.print(result.getString("addr"));
		       out.print("</td>");
		       out.print("</tr>");
		      
		    } 
		    out.print("</table>");
		    
		    //close the connection.
		    con.close();

	} catch (Exception e) {
	}
	
	
%>

</body>
</html>