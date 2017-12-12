package br.com.onsmarttech.butler.models;

import java.io.Serializable;
import javax.persistence.*;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

import java.util.List;

/**
 * The persistent class for the empresa database table.
 * 
 */
@Entity
// @Table(schema = "base")
public class Empresa extends DadosGenericos implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(length = 18, nullable = false)
	@NotBlank
	@Size(min = 18, max = 18)
	private String cnpj;

	@Column(nullable = false, length = 30)
	@NotBlank
	@Size(min = 5, max = 30)
	private String nomeFantasia;

	@Column(nullable = false, length = 30)
	@NotBlank
	@Size(min = 5, max = 30)
	private String nomeSocial;

	// bi-directional many-to-one association to Construtora
	@OneToMany(mappedBy = "empresa")
	private List<Construtora> construtoras;

	public Empresa() {
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

	public List<Construtora> getConstrutoras() {
		return this.construtoras;
	}

	public void setConstrutoras(List<Construtora> construtoras) {
		this.construtoras = construtoras;
	}

	public Construtora addConstrutora(Construtora construtora) {
		getConstrutoras().add(construtora);
		construtora.setEmpresa(this);

		return construtora;
	}

	public Construtora removeConstrutora(Construtora construtora) {
		getConstrutoras().remove(construtora);
		construtora.setEmpresa(null);

		return construtora;
	}

}