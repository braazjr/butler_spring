package br.com.onsmarttech.butler.models.base;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(schema = "portal")
public class FAQ extends DadosGenericoPortal {

	@NotNull
	@NotEmpty
	private String pergunta;

	@NotNull
	@NotEmpty
	private String resposta;

	public FAQ() {
	}

	public String getPergunta() {
		return pergunta;
	}

	public void setPergunta(String pergunta) {
		this.pergunta = pergunta;
	}

	public String getResposta() {
		return resposta;
	}

	public void setResposta(String resposta) {
		this.resposta = resposta;
	}

}
