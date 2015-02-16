<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="cscie90.project.student.StudentDetails" %>
<%@ page import="cscie90.project.student.PerformActivity" %>

<!DOCTYPE html>


<%@page import="java.util.ArrayList"%>

<html>
  <head>
    <title>Student Details</title>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
      <meta charset="utf-8"> 
  </head>
  <body>
<%
PerformActivity dao = PerformActivity.INSTANCE;

UserService userService = UserServiceFactory.getUserService();
User user = userService.getCurrentUser();

String url = userService.createLoginURL(request.getRequestURI());
String urlLinktext = "Login";
StudentDetails studentDetails = new StudentDetails();
studentDetails=null;
%>
  <div style="width: 100%;">
    <div class="line"></div>
     <div align="right"><a href="<%=url%>"><%=urlLinktext%></a> <%=(user==null? "" : user.getNickname())%></div>
     <div align="center"><h2>Student Detail of Cloud Computing</h2></div>
      <div align="center" class="imglogo"><img src="assets/images/extension.jpg" /></div>
    </div>

<form action="/list" method="post" accept-charset="utf-8">
<div align="center" class="center">
  <table>
    <tr>
      <td><label for="lastName">Enter Last Name</label></td>
      <td><input type="text" name="lastName" id="lastName" size="20"/></td>
    </tr>
    <tr>
      <td colspan="2" align="right"><input type="submit" value="List"/></td>
    </tr>
  </table>
   </div> 
  
 <div align ="center">
 	
  <table>
    <tr>
      <td><label for="lastName">Last Name</label></td>
      <td><label for="firstName">First Name</label></td>
      <td><label for="emailId">Email Id</label></td>
      <td><label for="assignment1Score">Assignment 1 Score</label></td>
      <td><label for="assignment2Score">Assignment 2 Score</label></td>
      <td><label for="assignment3Score">Assignment 3 Score</label></td>
      <td><label for="assignment4Score">Assignment 4 Score</label></td>
      <td><label for="assignment5Score">Assignment 5 Score</label></td>
      <td><label for="gpA">GPA</label></td>
	</tr>
	<tr>
      <td>${studentDetails.lastName}</td>
      <td>${studentDetails.firstName}</td>
      <td>${studentDetails.emailId}</td>
      <td>${studentDetails.assignment1Score}</td>
      <td>${studentDetails.assignment2Score}</td>
      <td>${studentDetails.assignment3Score}</td>
      <td>${studentDetails.assignment4Score}</td>
      <td>${studentDetails.assignment5Score}</td>
      <td>${studentDetails.gpa}</td>
    </tr>
   </table>
       <a class="btn" href="/Index.jsp">Go Back to Main Menu</a>

   </div>
 </form>

<hr />
</body>
</html> 