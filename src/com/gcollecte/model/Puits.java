package com.gcollecte.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="puits")
public class Puits implements Serializable {
    
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id @GeneratedValue
   private Long Id ;
    private String sigle;
    private String nom;
    private String num;
    private Long IdFichier ;
    private Long IdImage ;
    private Long IdCordonnees ;
    private Long IdPermis ;
    private Long IdStatus ;
    private Long IdEchelle ;
    
    
	
	public Long getId() {
		return Id;
	}
	public void setId(Long id) {
		Id = id;
	}
	public String getSigle() {
		return sigle;
	}
	public void setSigle(String sigle) {
		this.sigle = sigle;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public Long getIdFichier() {
		return IdFichier;
	}
	public void setIdFichier(Long idFichier) {
		IdFichier = idFichier;
	}
	public Long getIdImage() {
		return IdImage;
	}
	public void setIdImage(Long idImage) {
		IdImage = idImage;
	}

	public Long getIdCordonnees() {
		return IdCordonnees;
	}
	public void setIdCordonnees(Long idCordonnees) {
		IdCordonnees = idCordonnees;
	}
	public Long getIdPermis() {
		return IdPermis;
	}
	public void setIdPermis(Long idPermis) {
		IdPermis = idPermis;
	}
	public Long getIdStatus() {
		return IdStatus;
	}
	public void setIdStatus(Long idStatus) {
		IdStatus = idStatus;
	}
	public Long getIdEchelle() {
		return IdEchelle;
	}
	public void setIdEchelle(Long idEchelle) {
		IdEchelle = idEchelle;
	}
	public Puits(Long id,String num, String nom, String sigle,  Long idFichier, Long idImage,
			Long idCordonnees, Long idPermis, Long idStatus, Long idEchelle) {
		super();
		Id = id;
		this.sigle = sigle;
		this.nom = nom;
		this.num = num;
		IdFichier = idFichier;
		IdImage = idImage;
		IdCordonnees = idCordonnees;
		IdPermis = idPermis;
		IdStatus = idStatus;
		IdEchelle = idEchelle;
	}
	public Puits() {
		super();
	}
	public Puits(String num,String nom, String sigle,  Long idFichier, Long idImage, Long idCordonnees,
			Long idPermis, Long idStatus, Long idEchelle) {
		super();
		this.sigle = sigle;
		this.nom = nom;
		this.num = num;
		IdFichier = idFichier;
		IdImage = idImage;
		IdCordonnees = idCordonnees;
		IdPermis = idPermis;
		IdStatus = idStatus;
		IdEchelle = idEchelle;
	}

    
    
} 


    

	
