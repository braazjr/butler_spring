package br.com.onsmarttech.butler.models.base;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Bloco extends DadosGenericoHistorico {
	
	private Boolean ativo;

	@Column(length = 25)
	@NotNull
	private String nome;
	private Integer numero;

	@OneToMany(mappedBy = "bloco")
	@JsonIgnore
	private List<Apartamento> apartamentos;

	@ManyToOne
	@JoinColumn(name = "id_condominio")
	@NotNull
	private Condominio condominio;

	public Bloco() {
	}

	@PrePersist
	private void onCreateChild() {
		ativo = true;
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
}