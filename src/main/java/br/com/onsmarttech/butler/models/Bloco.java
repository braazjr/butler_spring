package br.com.onsmarttech.butler.models;

import java.io.Serializable;
import javax.persistence.*;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.util.Date;
import java.util.List;

/**
 * The persistent class for the bloco database table.
 * 
 */
@Entity
// @Table(schema = "base")
public class Bloco implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true, nullable = false)
	private Long id;
	private Boolean ativo;

	@Column(length = 15)
	@NotNull
	private String nome;
	private Integer numero;

	// bi-directional many-to-one association to Apartamento
	@OneToMany(mappedBy = "bloco")
	@JsonIgnore
	private List<Apartamento> apartamentos;

	// bi-directional many-to-one association to Condominio
	@ManyToOne
	@JoinColumn(name = "id_condominio")
	@NotNull
	private Condominio condominio;

	@Temporal(TemporalType.TIMESTAMP)
	private Date dataHoraCadastro;

	@Temporal(TemporalType.TIMESTAMP)
	@UpdateTimestamp
	private Date dataHoraModificacao;

	public Bloco() {
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Boolean getAtivo() {
		return this.ativo;
	}

	public void setAtivo(Boolean ativo) {
		this.ativo = ativo;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Integer getNumero() {
		return this.numero;
	}

	public void setNumero(Integer numero) {
		this.numero = numero;
	}

	public List<Apartamento> getApartamentos() {
		return this.apartamentos;
	}

	public void setApartamentos(List<Apartamento> apartamentos) {
		this.apartamentos = apartamentos;
	}

	public Apartamento addApartamento(Apartamento apartamento) {
		getApartamentos().add(apartamento);
		apartamento.setBloco(this);

		return apartamento;
	}

	public Apartamento removeApartamento(Apartamento apartamento) {
		getApartamentos().remove(apartamento);
		apartamento.setBloco(null);

		return apartamento;
	}

	public Condominio getCondominio() {
		return this.condominio;
	}

	public void setCondominio(Condominio condominio) {
		this.condominio = condominio;
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