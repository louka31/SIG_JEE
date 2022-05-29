
package com.gcollecte.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="cordonnees")
public class Cordonnees implements Serializable {
    
    @Id @GeneratedValue
    private Long id;
    private Float X_m;
    private Float Y_m;

	private String  X_deg;
    private String Y_deg;
    
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Float getX_m() {
		return X_m;
	}
	public void setX_m(Float x_m) {
		X_m = x_m;
	}
	public Float getY_m() {
		return Y_m;
	}
	public void setY_m(Float y_m) {
		Y_m = y_m;
	}
	public String getX_deg() {
		return X_deg;
	}
	public void setX_deg(String x_deg) {
		X_deg = x_deg;
	}
	public String getY_deg() {
		return Y_deg;
	}
	public void setY_deg(String y_deg) {
		Y_deg = y_deg;
	}
	public Cordonnees(Long id, Float x_m, Float y_m, String x_deg, String y_deg) {
		super();
		this.id = id;
		X_m = x_m;
		Y_m = y_m;
		X_deg = x_deg;
		Y_deg = y_deg;
	}
	public Cordonnees(Float x_m, Float y_m, String x_deg, String y_deg) {
		super();
		X_m = x_m;
		Y_m = y_m;
		X_deg = x_deg;
		Y_deg = y_deg;
	}
	public Cordonnees() {
		super();
	}
	
}
