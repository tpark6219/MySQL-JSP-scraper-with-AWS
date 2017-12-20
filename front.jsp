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


Bar Beer Drinker									  
<br>
 <!-- Show html form to i) display something, ii) choose an action via a 
  | radio button -->
<form method="get" action="login.jsp" enctype=text/plain>
    <!-- note the show.jsp will be invoked when the choice is made -->
	<!-- The next lines give HTML for radio buttons being displayed -->
  <table>
	<tr>    
	<td>Username</td><td><input type="text" name="username"></td>
	</tr>
	<tr>
	<td>Password</td><td><input type="password" name="pass"></td>
	</tr>
	<tr>
	 <td><input type="submit" value="LOGIN" /> </td>
	  <tr>
        <td colspan="2">Not Registered? <a href="reg.jsp">Register Here</a></td>
   </tr>
	</table>

</form>
<br>
<!--        // adding pattern.
			String url = "jdbc:mysql://tjpdb336.ckaplzsssmd2.us-east-1.rds.amazonaws.com:3306/BarBeerDrinker";
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url, "tjp336", "mypassword");
			Statement stmt = con.createStatement();
			ResultSet result2;
			
			ArrayList<String> arrayList = new ArrayList<String>();
			ArrayList<String> arrayList2 = new ArrayList<String>();
			ArrayList<String> boston = new ArrayList<String>();
			ArrayList<String> chicago = new ArrayList<String>();
			ArrayList<String> newyork = new ArrayList<String>();
			ArrayList<String> sanfran = new ArrayList<String>();
			String str = "SELECT * FROM bars WHERE city = 'Boston'";
			ResultSet result = stmt.executeQuery(str);
			
			while(result.next()){
				boston.add(result.getString("bar"));
			}
			str = "SELECT * FROM bars WHERE city = 'Chicago'";
			result = stmt.executeQuery(str);
			while(result.next()){
				chicago.add(result.getString("bar"));
			}
			str = "SELECT * FROM bars WHERE city = 'New York'";
			result = stmt.executeQuery(str);
			while(result.next()){
				newyork.add(result.getString("bar"));
			}
			str = "SELECT * FROM bars WHERE city = 'San Francisco'";
			result = stmt.executeQuery(str);
			while(result.next()){
				sanfran.add(result.getString("bar"));
			}
			
			str = "SELECT * FROM drinkers WHERE salary > 80000";
			 result = stmt.executeQuery(str);
			
			while(result.next())
			{   
				arrayList.add(result.getString("name"));
				arrayList2.add(result.getString("city"));

			} 
			String bar = "Blue Angel";
			for(int i = 0; i < arrayList.size(); i++)
			{
				String insert = "INSERT INTO frequents(drinker, bar)" +
			              "VALUES (?, ?)";
		    	PreparedStatement ps = con.prepareStatement(insert);
				String drinker = arrayList.get(i);
				if(arrayList2.get(0).equals("Boston"))
				{
					bar = boston.get(0);
				}else if(arrayList2.get(0).equals("Chicago"))
				{
					bar= chicago.get(0);
				}else if(arrayList2.get(0).equals("New York"))
				{
					bar = newyork.get(0);
				}else if(arrayList2.get(0).equals("San Francisco"))
				{
					 bar = sanfran.get(0);
				}
				ps.setString(1, drinker);
				ps.setString(2, bar);
				ps.executeUpdate();
			}

-->

</body>
</html>