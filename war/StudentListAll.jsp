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
    <title>Student List </title>
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
List<StudentDetails> studentDetails = new ArrayList<StudentDetails>();
            
if (user != null){
    url = userService.createLogoutURL(request.getRequestURI());
    urlLinktext = "Logout";
    studentDetails = dao.listStudentDetails();
}
    
%>
  <div style="width: 100%;">
    <div class="line"></div>
     <div align="center" class="headline">Student Details of Cloud Computing</div>
      <div align="right"><a href="<%=url%>"><%=urlLinktext%></a> <%=(user==null? "" : user.getNickname())%></div>
      <div align="center" class="imglogo"><img src="assets/images/extension.jpg" /></div>
    </div>
  </div>

<div class="center" align="left">
<table>
  <tr>
      <th>First Name </th>
      <th>Last Name</th>
      <th>Email Id</th>
      <th>Assignment1 Score</th>	
      <th>Assignment2 Score</th>
      <th>Assignment3 Score</th>
      <th>Assignment4 Score</th>
      <th>Assignment5 Score</th>
      <th>GPA</th>
    </tr>

<% for (StudentDetails studentDet : studentDetails) {%>
<tr> 
<td><%=studentDet.getFirstName()%></td>
<td><%=studentDet.getLastName()%></td>
<td><%=studentDet.getEmailId()%></td>
<td><%=studentDet.getAssignment1Score()%>
<td><%=studentDet.getAssignment2Score()%>
<td><%=studentDet.getAssignment3Score()%>
<td><%=studentDet.getAssignment4Score()%>
<td><%=studentDet.getAssignment5Score()%>
<td><%=studentDet.getGpa()%>
</tr> 
<%}
%>
</table>
</div>
You have a total number of <%= studentDetails.size() %>  StudentDetails.
<hr/>
  <div class="center" align="center"><a class="btn" href="/Index.jsp">Go Back to Main Menu</a></div>