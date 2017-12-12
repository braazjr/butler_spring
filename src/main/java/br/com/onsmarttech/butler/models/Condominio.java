package br.com.onsmarttech.butler.models;

import java.io.Serializable;
import javax.persistence.*;

import org.hibernate.validator.constraints.NotBlank;

import java.util.List;

/**
 * The persistent class for the condominio database table.
 * 
 */
@Entity
//@Table(schema = "base")
public class Condominio extends DadosGenericos implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(nullable = false, length = 30)
	@NotBlank
	private String nome;

	// bi-directional many-to-one association to Bloco
	@OneToMany(mappedBy = "condominio")
	private List<Bloco> blocos;

	// bi-directional many-to-one association to Construtora
	@ManyToOne
	@JoinColumn(name = "id_condominio", nullable = false)
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