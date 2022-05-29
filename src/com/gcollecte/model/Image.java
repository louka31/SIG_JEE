
package com.gcollecte.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="image")
public class Image implements Serializable {
    
    @Id @GeneratedValue
    private Long id;
    private String enregistrement;
    private String top;
	private String bottom;

	public Image(String enregistrement, String top, String bottom) {
		super();
		this.enregistrement = enregistrement;
		this.top = top;
		this.bottom = bottom;
	}
	public Image() {
		super();
	}
	public Image(Long id, String enregistrement, String top, String bottom) {
		super();
		this.id = id;
		this.enregistrement = enregistrement;
		this.top = top;
		this.bottom = bottom;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getEnregistrement() {
		return enregistrement;
	}
	public void setEnregistrement(String enregistrement) {
		this.enregistrement = enregistrement;
	}
	public String getTop() {
		return top;
	}
	public void setTop(String top) {
		this.top = top;
	}
	public String getBottom() {
		return bottom;
	}
	public void setBottom(String bottom) {
		this.bottom = bottom;
	}
}
