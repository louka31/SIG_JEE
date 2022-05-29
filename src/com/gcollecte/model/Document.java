
package com.gcollecte.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="document")
public class Document implements Serializable {
    
    @Id @GeneratedValue
    private Long id;
   private String num_doc	;
   private String sigle;
   private String nom;
   private Float td_m	;
   private Float td_formation	;
   private Long idformat;
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public String getNum_doc() {
	return num_doc;
}
public void setNum_doc(String num_doc) {
	this.num_doc = num_doc;
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
public Float getTd_m() {
	return td_m;
}
public void setTd_m(Float td_m) {
	this.td_m = td_m;
}
public Float getTd_formation() {
	return td_formation;
}
public void setTd_formation(Float td_formation) {
	this.td_formation = td_formation;
}
public Long getIdformat() {
	return idformat;
}
public void setIdformat(Long idformat) {
	this.idformat = idformat;
}
public Document(Long id, String num_doc, String sigle, String nom, Float td_m, Float td_formation, Long idformat) {
	super();
	this.id = id;
	this.num_doc = num_doc;
	this.sigle = sigle;
	this.nom = nom;
	this.td_m = td_m;
	this.td_formation = td_formation;
	this.idformat = idformat;
}
public Document(String num_doc, String sigle, String nom, Float td_m, Float td_formation, Long idformat) {
	super();
	this.num_doc = num_doc;
	this.sigle = sigle;
	this.nom = nom;
	this.td_m = td_m;
	this.td_formation = td_formation;
	this.idformat = idformat;
}
public Document() {
	super();
}


}
