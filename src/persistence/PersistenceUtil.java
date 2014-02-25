package persistence;

import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import entity.ToDoObject;
import entity.User;

@SuppressWarnings("serial")
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
	
	public static User findUser(String userName){
		EntityManager em = emf.createEntityManager();
		User user = em.find(User.class, userName);
		em.close();
		
		return user;
	}
	
	public static void removeToDoObject(int id) {
		EntityManager em = emf.createEntityManager();
		ToDoObject objectToRemove = em.find(ToDoObject.class, id);
		
		em.getTransaction().begin();
		em.remove(objectToRemove);
		em.getTransaction().commit();
		em.close();
	}
}