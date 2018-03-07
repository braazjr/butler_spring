package br.com.onsmarttech.butler.models.base;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Fotos extends DadosGenericoHistorico {

	@NotNull
	@NotEmpty
	@Column(length = 100)
	private String path;

	public Fotos() {
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

}
