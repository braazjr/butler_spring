package br.com.onsmarttech.butler.models.base;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(schema = "portal")
public class Documentos extends DadosGenericoPortal {

	@NotNull
	@NotEmpty
	@Column(length = 50)
	private String nome;

	@NotNull
	@NotEmpty
	@Column(length = 100)
	private String path;

	public Documentos() {
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
