package entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class User {
	@Id
	@Column(name="UserName")
	private String userName;
	@Column(name="UserPassword")
	private String userPassword;
	
	public User(){
		
	}
	
	public User(String userName, String userPassword){
		super();
		this.userName = userName;
		this.userPassword = userPassword;
	}
}
