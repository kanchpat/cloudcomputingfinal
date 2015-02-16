<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="cscie90.project.student.StudentDetails" %>
<%@ page import="cscie90.project.student.PerformActivity" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student List By Name</title>
</head>
<body>

<% 
PerformActivity dao = PerformActivity.INSTANCE;
List<StudentDetails> studentDetails = new ArrayList<StudentDetails>();
studentDetails = dao.listStudentDetails();
int i=0;
UserService userService = UserServiceFactory.getUserService();
User user = userService.getCurrentUser();

String url = userService.createLoginURL(request.getRequestURI());
String urlLinktext = "Login";
%>
  <div style="width: 100%;">
    <div class="line"></div>
     <div align="center"><h2>Assignment Score Update for Cloud Computing</h2></div>
      <div align="center" class="imglogo"><img src="assets/images/extension.jpg" /></div>
    </div>

<div class="center" align="center">
<form action="/update" method="post" accept-charset="utf-8">
<label for="LastName">Last Name</label>
    <select name="lastName" id="lastName">
    <%while (studentDetails.size() > i){%>
        <option><%out.print(studentDetails.get(i).getLastName()); i++;%></option>
    <%}%>
</select>
<table>
  <tr>
    <td><label for="Assignment#">Assignment #</label></td>
    <td><select name="assignment" size="1" id="assignment">
    <option value ="1" selected>1</option>
    <option value ="2">2</option>
    <option value ="3">3</option>
    <option value ="4">4</option>
    <option value ="5">5</option>
    </select>
    <br/>
     <td><label for="score">Enter Score</label></td>
    <td><input type="text" name="score" id="score" size="20"/></td>
  </tr>
  <tr>
    <td colspan="2" align="right"><input type="submit" value="Update" name="Update"/></td>
    <td colspan="2" align="right"><input type="submit" value="Send email" name="SendEmail"/></td>
  </tr>
</table>
<p> ${message} </p>
</form>
    <a class="btn" href="/Index.jsp">Go Back to Main Menu</a>

</div>
</body>
</html>