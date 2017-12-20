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
        <form method="post" action="registration.jsp">
            <center>
            <table>
                <thead>
                    <tr>
                        <th>Enter Information Here</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <tr>
                        <td>Username*</td>
                        <td><input type="text" name="uname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password*</td>
                        <td><input type="password" name="pass" value="" /></td>
                    </tr>
                    <tr>
                        <td>First Name*</td>
                        <td><input type="text" name="name" value="" /></td>
                    </tr>
                    <tr>
                        <td>Email*</td>
                        <td><input type="text" name="email" value="" /></td>
                    </tr>
                     <tr>
                        <td>City*</td>
                        <td><input type="text" name="city" value="" /></td>
                    </tr>
                    <tr>
                        <td>Phone Number</td>
                        <td><input type="text" name="phone" value="" /></td>
                    </tr>
                     <tr>
                        <td>Street Name*</td>
                        <td><input type="text" name="addr" value="" /></td>
                    </tr>
                     <tr>
                        <td>Age</td>
                        <td><input type="text" name="age" value="" /></td>
                    </tr>
                     <tr>
                        <td>Salary ( $ )</td>
                        <td><input type="text" name="salary" value="" /></td>
                    </tr>                    
                    <tr>
                        <td><input type="submit" value="Submit" /></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
                    <tr>
                        <td>Already registered? <a href="front.jsp">Login Here</a></td>
                    </tr>
                </tbody>
            </table>
            </center>
        </form>
    </body>
</html>