package br.com.onsmarttech.butler.models;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.validation.constraints.NotNull;

/**
 * The persistent class for the apartamento database table.
 * 
 */
@Entity
// @Table(schema = "base")
public class Apartamento {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true)
	private Long id;

	@Column(length = 5)
	@NotNull
	private String numero;
	private boolean ativo;

	// bi-directional many-to-one association to Bloco
	@ManyToOne
	@JoinColumn(name = "id_bloco")
	@NotNull
	private Bloco bloco;

	private LocalDateTime dataHoraCadastro;

	private LocalDateTime dataHoraModificacao;

	public Apartamento() {
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