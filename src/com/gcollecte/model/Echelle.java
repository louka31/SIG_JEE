package com.gcollecte.model;

import java.io.Serializable;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="echelle")
public class Echelle implements Serializable {
    
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id @GeneratedValue
   private Long Id ;
    private String nom;
	public Long getId() {
		return Id;
	}
	public Echelle() {
		super();
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
	public Echelle(String nom) {
		super();
		this.nom = nom;
	}
	public Echelle(Long id, String nom) {
		super();
		Id = id;
		this.nom = nom;
	}


    
} 


    

	
