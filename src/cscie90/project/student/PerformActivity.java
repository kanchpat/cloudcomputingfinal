package cscie90.project.student;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;


public enum PerformActivity {
  INSTANCE;

  public List<StudentDetails> listStudentDetails() {
    EntityManager em = EMFService.get().createEntityManager();
    // read the existing entries
    Query q = em.createQuery("select m from StudentDetails m");
    @SuppressWarnings("unchecked")
	List<StudentDetails> studentDetails = q.getResultList();
    return studentDetails;
  }

  public String add(String firstName, String lastName, String emailId)
  {
    synchronized (this) {
      EntityManager em = EMFService.get().createEntityManager();
      Boolean validateEmail =EmailFormatValidator.INSTANCE.validate(emailId);
      Boolean validateLastName = true;
	   Query q = em
		        .createQuery("select t from StudentDetails t where t.lastName = :lastName");
	    q.setParameter("lastName", lastName);
	    @SuppressWarnings("unchecked")
		List<StudentDetails> studentDetailsRetrieve = q.getResultList();
      if (studentDetailsRetrieve.size() >= 1 )  
    	  validateLastName = false;     
        if (validateEmail == false)
    	  return "Email Id invalid";
      if (validateLastName == false)
    	  return "Last Name Exists Already";
 	 StudentDetails studentDetails = new StudentDetails(firstName, lastName, emailId);
 	 em.persist(studentDetails);
   		em.close();
   		return "Student Created";
     }
  }

  public void update(String lastName,int assignment,int score)
  {
    synchronized (this) {
      EntityManager em = EMFService.get().createEntityManager();
	    Query q = em
		        .createQuery("select t from StudentDetails t where t.lastName = :lastName");
	    q.setParameter("lastName", lastName);
	    @SuppressWarnings("unchecked")
		List<StudentDetails> studentDetails = q.getResultList();
      if (studentDetails.size() >= 1 )
      {
    	  System.out.println("Inside Assignment score setup");
    	  if(assignment == 1) studentDetails.get(0).setAssignment1Score(score);
    	  if(assignment == 2) studentDetails.get(0).setAssignment2Score(score);
    	  if(assignment == 3) studentDetails.get(0).setAssignment3Score(score);
    	  if(assignment == 4) studentDetails.get(0).setAssignment4Score(score);
    	  if(assignment == 5) studentDetails.get(0).setAssignment5Score(score);
      }
      em.persist(studentDetails.get(0));
      em.close();
    }
  }
 
  public StudentDetails getTodos(String lastName) {
	    EntityManager em = EMFService.get().createEntityManager();
	    Query q = em
	        .createQuery("select t from StudentDetails t where t.lastName = :lastName");
	    q.setParameter("lastName", lastName);
	    System.out.println("Last Name :"+lastName);
	    @SuppressWarnings("unchecked")
		List<StudentDetails> studentDetails = q.getResultList();
	    System.out.println("Size of studentDetails"+studentDetails.size());
	    if (studentDetails.size() >= 1 )
	    		return studentDetails.get(0);
	    return null;
	  }
} 