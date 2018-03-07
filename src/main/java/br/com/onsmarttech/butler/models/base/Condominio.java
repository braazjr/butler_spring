package br.com.onsmarttech.butler.models.base;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Condominio extends DadosGenericoEndereco {

	@Column(length = 30)
	@NotNull
	private String nome;

	@JsonIgnore
	@OneToMany(mappedBy = "condominio")
	private List<Bloco> blocos;

	@ManyToOne
	@JoinColumn(name = "id_construtora")
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
}