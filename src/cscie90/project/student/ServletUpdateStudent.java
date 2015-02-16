package cscie90.project.student;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;


@SuppressWarnings("serial")
public class ServletUpdateStudent extends HttpServlet {
  public void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws IOException, ServletException {
	if 	(req.getParameter("Update") != null)
	{
    String lastName = checkNull(req.getParameter("lastName"));
     int assignment = Integer.parseInt(checkNull(req.getParameter("assignment")));
     int score = Integer.parseInt(checkNull(req.getParameter("score")));
    PerformActivity.INSTANCE.update(lastName,assignment,score);
    String message = "Score updated";
    req.setAttribute("message",message);
	}
	if(req.getParameter("SendEmail") != null)
	{
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();
		String fromEmailId = user.getEmail(); 
		System.out.println("Email id of the sender" + fromEmailId);
	    String lastName = checkNull(req.getParameter("lastName"));
	    System.out.println("Name of the email sender"+lastName);
	    try {
			SendEmail.INSTANCE.sendMsg(fromEmailId,lastName);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    String message = "An Email has been sent out";
	    req.setAttribute("message",message);
	}
    req.getRequestDispatcher("/StudentUpdateScore.jsp").forward(req, resp);

  }

  private String checkNull(String s) {
    if (s == null) {
      return "";
    }
    return s;
  }
} 