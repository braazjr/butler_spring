package br.com.onsmarttech.butler.models.base;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(schema = "base")
public class Empresa extends DadosGenericoEndereco {

	@Column(length = 18, unique = true)
	@NotNull
	@Size(min = 18, max = 18)
	private String cnpj;

	@Column(length = 30, unique = true, name = "nome_fantasia")
	@NotNull
	@Size(min = 5, max = 30)
	private String nomeFantasia;

	@Column(length = 30, unique = true, name = "nome_social")
	@NotNull
	@Size(min = 5, max = 30)
	private String nomeSocial;

	@JsonIgnore
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