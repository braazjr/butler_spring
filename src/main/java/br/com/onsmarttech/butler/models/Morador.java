package br.com.onsmarttech.butler.models;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.UpdateTimestamp;

/**
 * The persistent class for the morador database table.
 * 
 */
@Entity
// @Table(schema = "base")
public class Morador implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(unique = true, length = 255)
	@NotNull
	private String documento;
	private Boolean ativo;

	@Column(length = 14)
	@NotNull
	private String celular;

	@Column(length = 30)
	@NotNull
	private String email;

	@Column(length = 30)
	@NotNull
	private String nome;

	@Column(length = 14)
	@NotNull
	private String telefone;

	@Column(length = 8)
	private String placaCarro;

	@Column(length = 15)
	private String observacao;
	private String parentesco;

	@Enumerated
	@NotNull
	private TipoDocumento tipodocumento;

	@Enumerated
	@NotNull
	private TipoMorador tipomorador;

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

	public Morador() {
	}

	public String getDocumento() {
		return this.documento;
	}

	public void setDocumento(String documento) {
		this.documento = documento;
	}

	public Boolean getAtivo() {
		return this.ativo;
	}

	public void setAtivo(Boolean ativo) {
		this.ativo = ativo;
	}

	public String getCelular() {
		return this.celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getTelefone() {
		return this.telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getPlacaCarro() {
		return placaCarro;
	}

	public void setPlacaCarro(String placaCarro) {
		this.placaCarro = placaCarro;
	}

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	public String getParentesco() {
		return parentesco;
	}

	public void setParentesco(String parentesco) {
		this.parentesco = parentesco;
	}

	public TipoDocumento getTipodocumento() {
		return this.tipodocumento;
	}

	public void setTipodocumento(TipoDocumento tipodocumento) {
		this.tipodocumento = tipodocumento;
	}

	public TipoMorador getTipomorador() {
		return this.tipomorador;
	}

	public void setTipomorador(TipoMorador tipomorador) {
		this.tipomorador = tipomorador;
	}

	public Bloco getBloco() {
		return bloco;
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
		return String.format("%s[documento=%d]", getClass().getSimpleName(), getDocumento());
	}

}