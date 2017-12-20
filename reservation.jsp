<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.lang.Math" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Beer World</title>
</head>
<body>
<%    
		try {
		
			//Create a connection string
			//String url = "jdbc:mysql://localhost:3306/your_db";
			String url = "jdbc:mysql://tjpdb336.ckaplzsssmd2.us-east-1.rds.amazonaws.com:3306/BarBeerDrinker";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		    Class.forName("com.mysql.jdbc.Driver");
		
			//Create a connection to your DB
		    //Connection con = DriverManager.getConnection(url, "csuser", "your_pwd");
		    Connection con = DriverManager.getConnection(url, "tjp336", "mypassword");
			//Create a SQL statement
		    Statement stmt = con.createStatement();
		    
			//Populate SQL statement with an actual query. It returns a single number. The number of beers in the DB.
			String str = "SELECT COUNT(*) as cnt FROM drinkers";
			
			//Run the query against the DB
		    ResultSet result = stmt.executeQuery(str);
			
			//Start parsing out the result of the query. Don't forget this statement. It opens up the result set.
		    result.next();
		    //Parse out the result of the query
		    int countName = result.getInt("cnt");
		    
		    //Populate SQL statement with an actual query. It returns a single number. The number of beers in the DB.
		    str = "SELECT COUNT(*) as cnt FROM bars";
		    //Run the query against the DB
		    result = stmt.executeQuery(str);
		    //Start parsing out the result of the query. Don't forget this statement. It opens up the result set.
		    result.next();
		    //Parse out the result of the query
		    int countBars = result.getInt("cnt");
		    
		    //Get parameters from the HTML form at the HelloWorld.jsp
		    String newName = request.getParameter("drinker");
		    String newBar = request.getParameter("bar");
		    float people = Float.valueOf(request.getParameter("people"));
		    String newTime = request.getParameter("time");
		    int idExist = -5;
		    int ID;
		    while(true)
		    {
		    	ID = (int) (Math.random() * (90000 - 10000)) + 10000;
		    	String str2 = "select count(ID) as cnt from reserv where id = '" + ID + "'";
			    result = stmt.executeQuery(str2);
			    result.next();
			    idExist = result.getInt("cnt");
		    	if(idExist == 1)
		    		continue;
		    	else
		    		break;
		    }
		    //Make an insert statement for the Sells table:
		    String insert = "INSERT INTO reserv(drinker, bar, people, time, ID)" +
		              "VALUES (?, ?, ?, ?, ?)";
		    //Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(insert);
			
		    //Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, newName);
			ps.setString(2, newBar);
			ps.setFloat(3, people);
			ps.setString(4, newTime);
			ps.setFloat(5, ID);
			//Run the query against the DB
			ps.executeUpdate();

		    int countBarsN = 0;
		    int countBeers = 0;
		    int countBeersN = 0;
		    
		    //Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		    con.close();
		    
		    //Compare counts of the beers and bars before INSERT on Sells and after to figure out whether there is a bar and a beer stub records inserted by a trigger. 

		    
		    out.println("reservations accepted!");
		    out.println("Your ID is: " + ID);
		} catch (Exception ex) {
		out.print("Must enter valid bar!");
		}






%>
</body>
</html>