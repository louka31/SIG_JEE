package com.gcollecte.model;

import java.io.Serializable;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="permis")
public class Permis implements Serializable {
    
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id @GeneratedValue
   private Long Id ;
    private String ancien_nom;
    private String nouveau_nom;
    private Long idprojet ;

	public Long getId() {
		return Id;
	}
	public void setId(Long id) {
		Id = id;
	}
	public String getAncien_nom() {
		return ancien_nom;
	}
	public void setAncien_nom(String ancien_nom) {
		this.ancien_nom = ancien_nom;
	}
	public String getNouveau_nom() {
		return nouveau_nom;
	}
	public void setNouveau_nom(String nouveau_nom) {
		this.nouveau_nom = nouveau_nom;
	}
	public Long getIdprojet() {
		return idprojet;
	}
	public void setIdprojet(Long idprojet) {
		this.idprojet = idprojet;
	}
	public Permis(Long id, String ancien_nom, String nouveau_nom, Long idprojet) {
		super();
		Id = id;
		this.ancien_nom = ancien_nom;
		this.nouveau_nom = nouveau_nom;
		this.idprojet = idprojet;
	}
	public Permis(String ancien_nom, String nouveau_nom, Long idprojet) {
		super();
		this.ancien_nom = ancien_nom;
		this.nouveau_nom = nouveau_nom;
		this.idprojet = idprojet;
	}
	public Permis() {
		super();
	}

    
} 


    

	
