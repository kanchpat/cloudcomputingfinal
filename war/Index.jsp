<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <title>Student Details</title>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
      <meta charset="utf-8"> 
<title>Student Grading System</title>
</head>
<body>
<%

UserService userService = UserServiceFactory.getUserService();
User user = userService.getCurrentUser();
String url = userService.createLoginURL(request.getRequestURI());
String urlLinktext = "Login";
if (user != null){
    url = userService.createLogoutURL(request.getRequestURI());
    urlLinktext = "Logout";
}
if(user == null)
{%>
<p> Please login to the gmail account to access </p>
  <div style="width: 100%;">
    <div class="line"></div>
     <div align="center" class="headline"><h1>Welcome to the Student Grading System of Cloud Computing</h1></div>
      <div align="right"><a href="<%=url%>"><%=urlLinktext%></a> <%=(user==null? "" : user.getNickname())%></div>
      <div align="center" class="imglogo"><img src="assets/images/extension.jpg" /></div>
    </div>
<%}
else{
%>
   <div style="width: 100%;">
    <div class="line"></div>
     <div align="center" class="headline"><h1>Welcome to the Student Grading System of Cloud Computing</h1></div>
      <div align="right"><a href="<%=url%>"><%=urlLinktext%></a> <%=(user==null? "" : user.getNickname())%></div>
      <div align="center" class="imglogo"><img src="assets/images/extension.jpg" /></div>
    </div>
 <div align="center" class="center">
<form method="post" ACTION="StudentAdd.jsp">
<input type="submit" value="Student Add">
</form>
<form method="post" ACTION="StudentList.jsp">
<input type="submit" value="Student List by Name">
</form>
<form method="post" ACTION="StudentListAll.jsp">
<input type="submit" value="Student List All">
</form>
<form method="post" ACTION="StudentUpdateScore.jsp">
<input type="submit" value="Student Update Score">
</form>
<%} %>
</div>
<div>
<p>
<br> This page is designed for Cloud Computing CSCIE-90 Final Project Student Grading System.-Kanchana Santhanakrishnan
<br>
<br>
<br>Student Add would add new systems to the system. You would need First Name, Last Name and Email id for the Student
<br>Student List By Name would retrieve student's details based on the Last Name supplied
<br>Student List All would retrieve all the student details available
<br>Student Update Score would update the score based on the last name and the assignment # specified. You could also send email from this option to the individual
</p>
</div>
</body>
</html>