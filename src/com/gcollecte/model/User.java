
package com.gcollecte.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="users")
public class User implements Serializable {
    
    @Id @GeneratedValue
    private Long id;
    private String first_name;

    private String Role;
    private String email;

   	private String telephone;
       private String genre;
    private String login;

	private String last_name;
    private String password;
	
	 
	public User() {
		super();
	}
	public User(String first_name, String role, String email, String telephone, String genre, String login,
			String last_name, String password) {
		super();
		this.first_name = first_name;
		Role = role;
		this.email = email;
		this.telephone = telephone;
		this.genre = genre;
		this.login = login;
		this.last_name = last_name;
		this.password = password;
	}
	public User(Long id, String last_name, String role, String email, String telephone, String genre, String login,
			String first_name, String password) {
		super();
		this.id = id;
		this.first_name = first_name;
		Role = role;
		this.email = email;
		this.telephone = telephone;
		this.genre = genre;
		this.login = login;
		this.last_name = last_name;
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getRole() {
		return Role;
	}
	public void setRole(String role) {
		Role = role;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

    
    
}
