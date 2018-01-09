package br.com.onsmarttech.butler.models;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * The persistent class for the condominio database table.
 * 
 */
@Entity
// @Table(schema = "base")
public class Condominio extends DadosGenericos {

	@Column(length = 30)
	@NotNull
	private String nome;

	// bi-directional many-to-one association to Bloco
	@JsonIgnore
	@OneToMany(mappedBy = "condominio")
	private List<Bloco> blocos;

	// bi-directional many-to-one association to Construtora
	@ManyToOne
	@JoinColumn(name = "id_condominio")
	@NotNull
	private Construtora construtora;

	public Condominio() {
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public List<Bloco> getBlocos() {
		return this.blocos;
	}

	public void setBlocos(List<Bloco> blocos) {
		this.blocos = blocos;
	}

	public Bloco addBloco(Bloco bloco) {
		getBlocos().add(bloco);
		bloco.setCondominio(this);

		return bloco;
	}

	public Bloco removeBloco(Bloco bloco) {
		getBlocos().remove(bloco);
		bloco.setCondominio(null);

		return bloco;
	}

	public Construtora getConstrutora() {
		return this.construtora;
	}

	public void setConstrutora(Construtora construtora) {
		this.construtora = construtora;
	}

	@Override
	public String toString() {
		return String.format("%s[id=%d]", getClass().getSimpleName(), getId());
	}
}