
package com.gcollecte.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="format")
public class Format implements Serializable {
    
    @Id @GeneratedValue
    private Long id;
    private String Type;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
	}
	public Format(Long id, String type) {
		super();
		this.id = id;
		Type = type;
	}
	public Format() {
		super();
	}
	public Format(String type) {
		super();
		Type = type;
	}

}
