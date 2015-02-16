<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
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
  UserService userService = UserServiceFactory.getUserService();
  User user = userService.getCurrentUser();
  String url = userService.createLoginURL(request.getRequestURI());
  String urlLinktext = "Login";
  
  
  if (user != null){
    url = userService.createLogoutURL(request.getRequestURI());
    urlLinktext = "Logout";
}
  %>
  
   <div style="width: 100%;">
    <div class="line"></div>
     <div align="right"><a href="<%=url%>"><%=urlLinktext%></a> <%=(user==null? "" : user.getNickname())%></div>
     <div align="center"><h2>Student Registration of Cloud Computing</h2></div>
      <div align="center" class="imglogo"><img src="assets/images/extension.jpg" /></div>
    </div>

  
  
<div class="main">

<div class="headline" align="center">New Student</div>
<div align="center" class="center">
<% if (user != null){ %> 

<form action="/new" method="post" accept-charset="utf-8">
  <table>
    <tr>
      <td><label for="firstName">First Name</label></td>
      <td><input type="text" name="firstName" id="firstName" size="20"/></td>
    </tr>
    <tr>
      <td valign="left"><label for="lastName">Last Name</label></td>
      <td><input type="text" name="lastName" id="lastName" size="20"/></td>
    </tr>
  <tr>
    <td valign="top"><label for="emailId">Email Id</label></td>
    <td><input type="text" name="emailId" id="emailId" size="20" /></td>
  </tr>
  <tr>
      <td colspan="2" align="right"><input type="submit" value="Create"/></td>
    </tr>
  </table>
  <a class="btn" href="/Index.jsp">Go Back to Main Menu</a>
  <br>
  ${message}
  
</form>
<% }else{ %>
Please login to your account

<% } %>
</div>
</div>
</body>
</html> 