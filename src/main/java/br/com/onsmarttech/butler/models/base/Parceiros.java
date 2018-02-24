package br.com.onsmarttech.butler.models.base;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Parceiros extends DadosGenericoPortal {

	@NotNull
	@NotEmpty
	@Column(length = 50)
	private String nome;

	@NotNull
	@NotEmpty
	@Column(length = 100)
	private String path;

	public Parceiros() {
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

}
