package br.com.onsmarttech.butler.models.base;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Noticia extends DadosGenericoHistorico {

	@NotNull
	@NotEmpty
	@Column(length = 100)
	private String titulo;

	@NotNull
	@NotEmpty
	private String conteudo;

	public Noticia() {
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getConteudo() {
		return conteudo;
	}

	public void setConteudo(String conteudo) {
		this.conteudo = conteudo;
	}

}
