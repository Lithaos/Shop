package pl.Shop.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name = "User")
public class User {

	@Id
	@GeneratedValue
	private Long id;

	@NotEmpty(message = "Podaj imie!")
	private String userName;

	@NotEmpty(message = "Podaj hasło!")
	private String password;

	@NotEmpty(message = "Musisz podać email!")
	@Email(message = "Podaj poprawny adres email!")
	private String email;

	private String role="ROLE_USER";
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
 
	
	
}