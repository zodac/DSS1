package entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class ToDoObject {
	@Id
	@Column(name="Timestamp")
	private Date date;
	@Column(name="Task")
	private String task;
	@Column(name="User")
	private String user;
	
	public ToDoObject(){
		
	}
	
	public ToDoObject(String task, String user){
		super();
		this.date = new Date();
		this.task = task;
		this.user = user;
	}
}
