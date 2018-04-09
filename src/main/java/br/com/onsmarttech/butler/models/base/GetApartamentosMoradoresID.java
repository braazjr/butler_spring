package br.com.onsmarttech.butler.models.base;

import java.io.Serializable;

import javax.persistence.Embeddable;

@Embeddable
public class GetApartamentosMoradoresID implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer idApartamento;
	private Integer idMorador;

	public GetApartamentosMoradoresID() {
	}

	public GetApartamentosMoradoresID(Integer idApartamento, Integer idMorador) {
		this.idApartamento = idApartamento;
		this.idMorador = idMorador;
	}

	@Override
	public String toString() {
		return "GetApartamentosMoradoresID [idApartamento=" + idApartamento + ", idMorador=" + idMorador + "]";
	}

	public Integer getIdApartamento() {
		return idApartamento;
	}

	public void setIdApartamento(Integer idApartamento) {
		this.idApartamento = idApartamento;
	}

	public Integer getIdMorador() {
		return idMorador;
	}

	public void setIdMorador(Integer idMorador) {
		this.idMorador = idMorador;
	}

}
