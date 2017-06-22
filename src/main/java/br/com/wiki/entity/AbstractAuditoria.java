package br.com.wiki.entity;

import java.io.Serializable;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.EntityListeners;
import javax.persistence.MappedSuperclass;

import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.AbstractPersistable;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

//@MappedSuperclass
//@EntityListeners(AuditingEntityListener.class) // fica ouvindo alteraçãoes nas
//												// classes que herdam
//												// AbstractAuditoria
public abstract class AbstractAuditoria<PK extends Serializable> extends AbstractPersistable<PK> {

	@Column(name = "created_by")
	@CreatedBy
	private String createdBy;
	
	@Column(name = "created_date")
	@CreatedDate
	private LocalDateTime createdDate;
	
	@Column(name = "Last_modified_by")
	@LastModifiedBy
	private String lastModifiedBy;
	
	@Column(name = "last_modified_date")
	@LastModifiedDate
	private LocalDateTime lastModifiedDate;

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public LocalDateTime getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(LocalDateTime createdDate) {
		this.createdDate = createdDate;
	}

	public String getLastModifiedBy() {
		return lastModifiedBy;
	}

	public void setLastModifiedBy(String lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}

	public LocalDateTime getLastModifiedDate() {
		return lastModifiedDate;
	}

	public void setLastModifiedDate(LocalDateTime lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}

	@Override
	public void setId(PK id) {
		super.setId(id);
	}
	
	
}
