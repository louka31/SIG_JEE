package com.gcollecte.model;

import java.io.Serializable;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="compagne")
public class Compagne implements Serializable {
    
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id @GeneratedValue
   private Long Id ;
    private String nom;
    private String email;
    private String adresse;
    private String telephone;
	public Long getId() {
		return Id;
	}
	public void setId(Long id) {
		Id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAdresse() {
		return adresse;
	}
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Compagne(Long Id ,String nom,  String email, String adresse, String telephone) {
		super();
		this.Id=Id;
		this.nom = nom;
		this.email = email;
		this.adresse = adresse;
		this.telephone = telephone;
	}
	public Compagne(String nom,  String email, String adresse, String telephone) {
	
		this.nom = nom;
		this.email = email;
		this.adresse = adresse;
		this.telephone = telephone;
	}
	public Compagne() {
		super();
	}
    
} 


    

	
