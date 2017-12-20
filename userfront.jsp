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
				Beer World									  
<br>
<form method="get" action="show.jsp" enctype=text/plain>
    <!-- note the show.jsp will be invoked when the choice is made -->
	<!-- The next lines give HTML for radio buttons being displayed -->
  <input type="radio" name="command" value="beers"/>Beers available
  <br>
  <input type="radio" name="command" value="bars"/>Bars available
  <br>
  <input type="radio" name="command" value="barsH"/>Time of Happy Hours
  <br>
  <input type="radio" name="command" value="bar"/> Bars near you
    <!-- when the radio for bars is chosen, then 'command' will have value 
     | 'bars', in the show.jsp file, when you access request.parameters -->
  <br>
  <input type="submit" value="submit" />
</form>
<br>

  <!--  out.print(session.getAttribute("username")); -->

<br>
<br>
Enter a new beer!
<br>

	<form method="post" action="newBeer.jsp">
	<table>
	<tr>    
	<td>Bar</td><td><input type="text" name="bar"></td>
	</tr>
	<tr>
	<td>Beer</td><td><input type="text" name="beer"></td>
	</tr>
	<tr>
	<td>Price</td><td><input type="text" name="price"></td>
	</tr>
	</table>
	<br>
	<input type="submit" value="submit">
	</form>


<br>
<br>
<br>

Reservation Form!
<br>
	<form method="post" action="reservation.jsp">
	
	<table>
	<tr>    
	<td>Name</td><td><input type="text" name="drinker"></td>
	</tr>
	<tr>
	<td>Bar</td><td><input type="text" name="bar"></td>
	</tr>
	<tr>
	<td>Number of People</td><td><input type="text" name="people"></td>
	</tr>
	<tr>
	<td>Time (e.g 8 AM, 5:30 PM...)</td><td><input type="text" name="time"></td>
	</tr>
	</table>
	<br>
	<input type="submit" value="reserve!">
	</form>

<br>

Designated Driver for which Bar?
<br>
	<form method="post" action="design.jsp">
	
	<table>
	<tr>    
	<td>Name</td><td><input type="text" name="drinker"></td>
	</tr>
	<tr>
	<td>Bar</td><td><input type="text" name="bar"></td>
	</tr>
	<tr>
	<td>Spots</td><td><input type="text" name="people"></td>
	</tr>
	<tr>
	<td>Leave Time (e.g 8 AM, 5:30 PM...)</td><td><input type="text" name="time"></td>
	</tr>
	</table>
	<br>
	<input type="submit" value="submit">
	</form>

<br>


</body>
</html>
<!-- request.getParameter("item"); -->