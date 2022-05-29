package com.gcollecte.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="projets")
public class Projet implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;



	public Projet() {
		super();
	}
	public Projet(String nom, Long user_id, String xmin, String ymin, String xmax, String ymax, String idCompagne) {
		super();
		this.nom = nom;
		this.user_id = user_id;
		this.xmin = xmin;
		this.ymin = ymin;
		this.xmax = xmax;
		this.ymax = ymax;
		IdCompagne = idCompagne;
	}
	public Projet(Long id, String nom, Long user_id, String xmin, String ymin, String xmax, String ymax,
			String idCompagne) {
		super();
		this.id = id;
		this.nom = nom;
		this.user_id = user_id;
		this.xmin = xmin;
		this.ymin = ymin;
		this.xmax = xmax;
		this.ymax = ymax;
		IdCompagne = idCompagne;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public Long getUser_id() {
		return user_id;
	}
	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}
	public String getXmin() {
		return xmin;
	}
	public void setXmin(String xmin) {
		this.xmin = xmin;
	}
	public String getYmin() {
		return ymin;
	}
	public void setYmin(String ymin) {
		this.ymin = ymin;
	}
	public String getXmax() {
		return xmax;
	}
	public void setXmax(String xmax) {
		this.xmax = xmax;
	}
	public String getYmax() {
		return ymax;
	}
	public void setYmax(String ymax) {
		this.ymax = ymax;
	}
	public String getIdCompagne() {
		return IdCompagne;
	}
	public void setIdCompagne(String idCompagne) {
		IdCompagne = idCompagne;
	}
	@Id @GeneratedValue
    private Long id;
    private String nom;
    private Long user_id;
  

	private String xmin;
    private String ymin;
    private String xmax;
    private String ymax;
    private String  IdCompagne ;

    
}
