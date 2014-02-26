package entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

//@NamedQueries({
//	@NamedQuery(name="ToDoObject.findToDoObjectsByUsername",
//				query="SELECT o.date, o.task, o.id FROM ToDoObject o WHERE o.UserName = :userName"),
//				query="SELECT o FROM ToDoObject o WHERE o.UserName = :userName"),
//})

@Entity
public class ToDoObject {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID")
	private int id;
	@Column(name="Timestamp")
	private Date date;
	@Column(name="Task")
	private String task;
	@ManyToOne(optional=false)
	@JoinColumn(name="UserName", nullable=false, updatable=false)
	private User user;
	
	public ToDoObject(){
		
	}
	
	public ToDoObject(String task, User user){
		super();
		this.date = new Date();
		this.task = task;
		this.user = user;
	}
}
