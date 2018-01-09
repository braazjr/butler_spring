package br.com.onsmarttech.butler.models;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * The persistent class for the bloco database table.
 * 
 */
@Entity
// @Table(schema = "base")
public class Bloco {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
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

	private LocalDateTime dataHoraCadastro;

	private LocalDateTime dataHoraModificacao;

	public Bloco() {
	}

	@PrePersist
	private void onCreate() {
		ativo = true;
		dataHoraCadastro = LocalDateTime.now();
		dataHoraModificacao = LocalDateTime.now();
	}

	@PreUpdate
	private void onUpdate() {
		dataHoraModificacao = LocalDateTime.now();
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

	public LocalDateTime getDataHoraCadastro() {
		return dataHoraCadastro;
	}

	public void setDataHoraCadastro(LocalDateTime dataHoraCadastro) {
		this.dataHoraCadastro = dataHoraCadastro;
	}

	public LocalDateTime getDataHoraModificacao() {
		return dataHoraModificacao;
	}

	public void setDataHoraModificacao(LocalDateTime dataHoraModificacao) {
		this.dataHoraModificacao = dataHoraModificacao;
	}
}