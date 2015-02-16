package cscie90.project.student;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class ServletCreateStudent extends HttpServlet {
  public void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws IOException, ServletException {
	  String message;
    System.out.println("Creating new student ");
     String firstName = checkNull(req.getParameter("firstName"));
    String lastName = checkNull(req.getParameter("lastName"));
    String emailId = checkNull(req.getParameter("emailId"));
    if (firstName.isEmpty() || lastName.isEmpty() || emailId.isEmpty())
    	message = "Field empty , Re-enter details";
    else
    	message = PerformActivity.INSTANCE.add(firstName,lastName,emailId);
    
    req.setAttribute("message",message);
    req.getRequestDispatcher("/StudentAdd.jsp").forward(req, resp);
  }

  private String checkNull(String s) {
    if (s == null) {
      return "";
    }
    return s;
  }
} 