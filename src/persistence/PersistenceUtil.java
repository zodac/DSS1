package persistence;

import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import entity.ToDoObject;
import entity.User;

@SuppressWarnings({"serial", "unchecked"})
public class PersistenceUtil implements Serializable {
	protected static EntityManagerFactory emf = Persistence.createEntityManagerFactory("DSS1");

	public static void persistMany(List<Object> entities) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		for (Object e : entities)
			em.persist(e);
		em.getTransaction().commit();
		em.close();
	}

	public static void persist(Object entity) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		em.persist(entity);
		em.getTransaction().commit();
		em.close();
	}
	
	public static User findSingleUserName(String userName){
		EntityManager em = emf.createEntityManager();
		User user = em.find(User.class, userName);
		em.close();
		
		return user;
	}
	
	public static void removeToDoObject(int id) {
		EntityManager em = emf.createEntityManager();
		ToDoObject objectToRemove = em.find(ToDoObject.class, id);
		
		if(objectToRemove != null){ //If connection is slow and user double-clicks "remove", system tried to remove object twice
			em.getTransaction().begin();
			em.remove(objectToRemove);
			em.getTransaction().commit();
			em.close();
		}
	}
	
	public static User findUserAndPasswordByUsername(String userName){
		EntityManager em = emf.createEntityManager();
		List<User> users = (List<User>) em.createNamedQuery("User.findUserAndPasswordByUsername").setParameter("userName", userName).getResultList();
		em.close();
		
		if(users.isEmpty())
			return null;
		else return users.get(0);
	}
	
	public static List<String> findAllUserNames(){
		EntityManager em = emf.createEntityManager();
		List<String> users = (List<String>) em.createNamedQuery("User.findAllUserNames").getResultList();
		em.close();
		
		return users;
	}
	
	public static List<Object[]> findToDoObjectsByUsername(String userName){
		EntityManager em = emf.createEntityManager();
		List<Object[]> toDoObjects = (List<Object[]>) em.createNamedQuery("ToDoObject.findToDoObjectsByUsername")
														.setParameter("user",  em.find(User.class, userName)).getResultList();
		em.close();
		
		return toDoObjects;
	}
}