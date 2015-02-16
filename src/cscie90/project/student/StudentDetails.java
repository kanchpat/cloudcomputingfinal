package cscie90.project.student;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class StudentDetails implements Serializable{
  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
@Id
  private String lastName;
  private String firstName;
  private String emailId;
  private int assignment1Score;
  private int assignment2Score;
  private int assignment3Score;
  private int assignment4Score;
  private int assignment5Score;
  private String gpa;


  public StudentDetails(){
	  
  }
  
  public StudentDetails(String firstName, String lastName, String emailId)
     {
    this.firstName = firstName;
    this.lastName = lastName;
    this.emailId = emailId;
    this.assignment1Score = 0;
    this.assignment2Score = 0;
    this.assignment3Score = 0;
    this.assignment4Score = 0;
    this.assignment5Score = 0;
    this.gpa ="W";
  }

public String getFirstName() {
	return firstName;
}

public void setFirstName(String firstName) {
	this.firstName = firstName;
}

public String getLastName() {
	return lastName;
}

public void setLastName(String lastName) {
	this.lastName = lastName;
}

public String getEmailId() {
	return emailId;
}

public void setEmailId(String emailId) {
	this.emailId = emailId;
}

public int getAssignment1Score() {
	return assignment1Score;
}

public void setAssignment1Score(int assignment1Score) {
		this.assignment1Score = assignment1Score;
		setGpa();
}

public int getAssignment2Score() {
	return assignment2Score;
}

public void setAssignment2Score(int assignment2Score) {
	this.assignment2Score = assignment2Score;
	setGpa();
}

public int getAssignment3Score() {
	return assignment3Score;
}

public void setAssignment3Score(int assignment3Score) {
	this.assignment3Score = assignment3Score;
	setGpa();
}

public int getAssignment4Score() {
	return assignment4Score;
}

public void setAssignment4Score(int assignment4Score) {
	this.assignment4Score = assignment4Score;
	setGpa();
}

public int getAssignment5Score() {
	return assignment5Score;
}

public void setAssignment5Score(int assignment5Score) {
	this.assignment5Score = assignment5Score;
	setGpa();
}

public String getGpa() {
	return gpa;
}

public void setGpa() {
	int noOfassignmentsvalued;
	int totalScore = this.assignment1Score +
				     this.assignment2Score +
				     this.assignment3Score +
				     this.assignment4Score +
				     this.assignment5Score;
	if (this.assignment5Score > 0) noOfassignmentsvalued=5;
	else if(this.assignment4Score > 0) noOfassignmentsvalued=4;
	else if(this.assignment3Score > 0) noOfassignmentsvalued=3;
	else if(this.assignment2Score > 0) noOfassignmentsvalued=2;
	else if(this.assignment1Score > 0) noOfassignmentsvalued=1;
	else noOfassignmentsvalued = 0;
	
	if(totalScore/noOfassignmentsvalued > 95) this.gpa = "A+";
	else if (totalScore/noOfassignmentsvalued > 90) this.gpa = "A";
	else if (totalScore/noOfassignmentsvalued > 85) this.gpa = "A-";
	else if (totalScore/noOfassignmentsvalued > 80) this.gpa = "B";
	else if (totalScore/noOfassignmentsvalued > 75) this.gpa = "C";
	else if (totalScore/noOfassignmentsvalued > 70) this.gpa = "D";
	else this.gpa = "W";	
}

} 