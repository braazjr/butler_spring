package br.com.onsmarttech.butler.models.base;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.validation.constraints.NotNull;

@Entity
public class Apartamento extends DadosGenericoHistorico {

	@Column(length = 15)
	@NotNull
	private String numero;
	private boolean ativo;

	@ManyToOne
	@JoinColumn(name = "id_bloco")
	@NotNull
	private Bloco bloco;

	@ManyToMany
	@JoinTable(name = "apartamento_morador", inverseJoinColumns = @JoinColumn(name = "id_morador"), joinColumns = @JoinColumn(name = "id_apartamento"))
	private List<Morador> moradores;

	public Apartamento() {
	}

	@PrePersist
	private void onCreateChild() {
		ativo = true;
	}

	public String getNumero() {
		return this.numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public boolean getAtivo() {
		return ativo;
	}

	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}

	public Bloco getBloco() {
		return this.bloco;
	}

	public void setBloco(Bloco bloco) {
		this.bloco = bloco;
	}

	public List<Morador> getMorador() {
		return moradores;
	}

	public void setMorador(List<Morador> morador) {
		this.moradores = morador;
	}

}