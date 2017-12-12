package br.com.onsmarttech.butler.models;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.UpdateTimestamp;

/**
 * The persistent class for the objeto database table.
 * 
 */
@Entity
//@Table(schema = "security")
@NamedQuery(name = "Objeto.findAll", query = "SELECT o FROM Objeto o")
public class Objeto implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long id;
	private String nome;

	private Date dataHoraCadastro;
	private Date dataHoraModificacao;

	public Objeto() {
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true, nullable = false)
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(nullable = false, length = 15)
	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	@Temporal(TemporalType.TIMESTAMP)
	public Date getDataHoraCadastro() {
		return dataHoraCadastro;
	}

	public void setDataHoraCadastro(Date dataHoraCadastro) {
		this.dataHoraCadastro = dataHoraCadastro;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@UpdateTimestamp
	public Date getDataHoraModificacao() {
		return dataHoraModificacao;
	}

	public void setDataHoraModificacao(Date dataHoraModificacao) {
		this.dataHoraModificacao = dataHoraModificacao;
	}

	@PrePersist
	@PreUpdate
	private void configurarDataHoraCadastro() {
		if (getDataHoraCadastro() == null) {
			setDataHoraCadastro(new Date());
		}
	}
}