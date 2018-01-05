package br.com.onsmarttech.butler.models;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.UpdateTimestamp;

/**
 * The persistent class for the apartamento database table.
 * 
 */
@Entity
// @Table(schema = "base")
@NamedQuery(name = "Apartamento.findAll", query = "SELECT a FROM Apartamento a")
public class Apartamento implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true)
	private Long id;

	@Column(length = 5)
	@NotNull
	private String numero;
	private boolean ativo;

	// bi-directional many-to-one association to Bloco
	@ManyToOne
	@JoinColumn(name = "id_bloco")
	@NotNull
	private Bloco bloco;

	@Temporal(TemporalType.TIMESTAMP)
	private Date dataHoraCadastro;

	@Temporal(TemporalType.TIMESTAMP)
	@UpdateTimestamp
	private Date dataHoraModificacao;

	public Apartamento() {
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNumero() {
		return this.numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public boolean getAtivo() {
		return ativo;
	}

	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}

	public Bloco getBloco() {
		return this.bloco;
	}

	public void setBloco(Bloco bloco) {
		this.bloco = bloco;
	}

	public Date getDataHoraCadastro() {
		return dataHoraCadastro == null ? new Date() : dataHoraCadastro;
	}

	public void setDataHoraCadastro(Date dataHoraCadastro) {
		this.dataHoraCadastro = dataHoraCadastro;
	}

	public Date getDataHoraModificacao() {
		return dataHoraModificacao;
	}

	public void setDataHoraModificacao(Date dataHoraModificacao) {
		this.dataHoraModificacao = dataHoraModificacao;
	}

	@PrePersist
	private void initAtivo() {
		ativo = true;
	}

	@Override
	public String toString() {
		return String.format("%s[id=%d]", getClass().getSimpleName(), getId());
	}

}