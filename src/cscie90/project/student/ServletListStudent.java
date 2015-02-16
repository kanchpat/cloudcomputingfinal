package cscie90.project.student;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ServletListStudent extends HttpServlet {
  private static final long serialVersionUID = 1L;

  public void doPost(HttpServletRequest req, HttpServletResponse resp)
  throws IOException, ServletException {
	  StudentDetails studentDetails;
    String lastName = req.getParameter("lastName");
    if (lastName.isEmpty())
    	 studentDetails = null;
    else
    	studentDetails = PerformActivity.INSTANCE.getTodos(lastName);
    req.getSession().setAttribute("studentDetails",studentDetails);
    getServletContext().getRequestDispatcher("/StudentList.jsp").forward(req, resp);
  }
}