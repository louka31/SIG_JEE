
package com.gcollecte.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="status")
public class Status implements Serializable {
    
    @Id @GeneratedValue
    private Long id;
    private String productive;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getProductive() {
		return productive;
	}
	public void setProductive(String productive) {
		this.productive = productive;
	}
	
	public Status(Long id, String productive) {
		super();
		this.id = id;
		this.productive = productive;
	}
	public Status(String productive) {
		super();
		this.productive = productive;
	}
	public Status() {
		super();
	}


}
