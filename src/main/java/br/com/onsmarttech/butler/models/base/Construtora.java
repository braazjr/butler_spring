package br.com.onsmarttech.butler.models.base;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(schema = "base")
public class Construtora extends DadosGenericoEndereco {

	@Column(length = 18, unique = true)
	@NotNull
	private String cnpj;

	@Column(length = 50, unique = true, name = "nome_fantasia")
	@NotNull
	private String nomeFantasia;

	@Column(length = 50, unique = true, name = "nome_social")
	@NotNull
	private String nomeSocial;

	@JsonIgnore
	@OneToMany(mappedBy = "construtora")
	private List<Condominio> condominios;

	@ManyToOne
	@JoinColumn(name = "id_empresa")
	@NotNull
	private Empresa empresa;

	public Construtora() {
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public String getNomeFantasia() {
		return nomeFantasia;
	}

	public void setNomeFantasia(String nomeFantasia) {
		this.nomeFantasia = nomeFantasia;
	}

	public String getNomeSocial() {
		return nomeSocial;
	}

	public void setNomeSocial(String nomeSocial) {
		this.nomeSocial = nomeSocial;
	}

	public List<Condominio> getCondominios() {
		return condominios;
	}

	public void setCondominios(List<Condominio> condominios) {
		this.condominios = condominios;
	}

	public Empresa getEmpresa() {
		return empresa;
	}

	public void setEmpresa(Empresa empresa) {
		this.empresa = empresa;
	}

}