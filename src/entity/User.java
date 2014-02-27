package entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@NamedQueries( {
	@NamedQuery(name="User.findUserAndPasswordByUsername",
				query="SELECT o FROM User o WHERE o.userName =:userName"),
	@NamedQuery(name="User.findAllUserNames",
				query="SELECT o.userName FROM User o"),
})

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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	
	
}
