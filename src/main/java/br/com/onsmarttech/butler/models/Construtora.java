package br.com.onsmarttech.butler.models;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;

/**
 * The persistent class for the construtora database table.
 * 
 */
@Entity
//@Table(schema = "base")
public class Construtora extends DadosGenericos implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column( nullable = false, length = 255)
	@NotNull
	private String cnpj;

	@Column(nullable = false, length = 30)
	@NotNull
	private String nomeFantasia;

	@Column(nullable = false, length = 30)
	@NotNull
	private String nomeSocial;

	// bi-directional many-to-one association to Condominio
	@OneToMany(mappedBy = "construtora")
	private List<Condominio> condominios;

	// bi-directional many-to-one association to Empresa
	@ManyToOne
	@JoinColumn(name = "cnpj_empresa", nullable = false)
	private Empresa empresa;

	public Construtora() {
	}

	public String getCnpj() {
		return this.cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public String getNomeFantasia() {
		return this.nomeFantasia;
	}

	public void setNomeFantasia(String nomeFantasia) {
		this.nomeFantasia = nomeFantasia;
	}

	public String getNomeSocial() {
		return this.nomeSocial;
	}

	public void setNomeSocial(String nomeSocial) {
		this.nomeSocial = nomeSocial;
	}

	public List<Condominio> getCondominios() {
		return this.condominios;
	}

	public void setCondominios(List<Condominio> condominios) {
		this.condominios = condominios;
	}

	public Condominio addCondominio(Condominio condominio) {
		getCondominios().add(condominio);
		condominio.setConstrutora(this);

		return condominio;
	}

	public Condominio removeCondominio(Condominio condominio) {
		getCondominios().remove(condominio);
		condominio.setConstrutora(null);

		return condominio;
	}

	public Empresa getEmpresa() {
		return this.empresa;
	}

	public void setEmpresa(Empresa empresa) {
		this.empresa = empresa;
	}

}