package cscie90.project.student;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public enum SendEmail {
	INSTANCE;
// ...
Properties props = new Properties();
Session session = Session.getDefaultInstance(props, null);

String msgBody;
StudentDetails studentDetails;
	public void sendMsg(String fromEmailId, String lastName) throws UnsupportedEncodingException, MessagingException
	{
		studentDetails = PerformActivity.INSTANCE.getTodos(lastName);
		try {
			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(fromEmailId, "Student Details Web Admin"));
			msg.addRecipient(Message.RecipientType.TO,
					new InternetAddress(studentDetails.getEmailId(), lastName));
			msg.setSubject("Your Assignment Score is posted");
			createMsgBody();
			msg.setText(msgBody);
			Transport.send(msg);

		   } catch ( UnsupportedEncodingException|MessagingException ex) {
			   	System.out.println("Issue with sending the message");
		   	}
	}

public void createMsgBody(){
	msgBody = 
			" Assignment 1 Score " + studentDetails.getAssignment1Score() + "\n" +
			" Assignment 2 Score " + studentDetails.getAssignment2Score() + "\n" +
			" Assignment 3 Score " + studentDetails.getAssignment3Score() + "\n" +
			" Assignment 4 Score " + studentDetails.getAssignment4Score() + "\n" +
			" Assignment 5 Score " + studentDetails.getAssignment5Score() ;

}
	
}
