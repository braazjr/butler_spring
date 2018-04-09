package br.com.onsmarttech.butler.models.base;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "getapartamentosmoradores")
public class GetApartamentosMoradores {

	@EmbeddedId
	private GetApartamentosMoradoresID apartamentosMoradoresID;
	private String numeroApartamento;
	private String documentoMorador;
	private String nomeMorador;
	private String tipoMorador;
	private Integer idBloco;
	private String nomeBloco;
	private Integer numeroBloco;
	private Integer idCondominio;
	private String nomeCondominio;
	private Integer idConstrutora;
	private String nomeFantasiaConstrutora;

	public GetApartamentosMoradores() {
	}

	public GetApartamentosMoradores(GetApartamentosMoradoresID apartamentosMoradoresID, String numeroApartamento,
			String documentoMorador, String nomeMorador, String tipoMorador, Integer idBloco, String nomeBloco,
			Integer numeroBloco, Integer idCondominio, String nomeCondominio, Integer idConstrutora,
			String nomeFantasiaConstrutora) {
		this.apartamentosMoradoresID = apartamentosMoradoresID;
		this.numeroApartamento = numeroApartamento;
		this.documentoMorador = documentoMorador;
		this.nomeMorador = nomeMorador;
		this.tipoMorador = tipoMorador;
		this.idBloco = idBloco;
		this.nomeBloco = nomeBloco;
		this.numeroBloco = numeroBloco;
		this.idCondominio = idCondominio;
		this.nomeCondominio = nomeCondominio;
		this.idConstrutora = idConstrutora;
		this.nomeFantasiaConstrutora = nomeFantasiaConstrutora;
	}

	@Override
	public String toString() {
		return "GetApartamentosMoradores [apartamentosMoradoresID=" + apartamentosMoradoresID + ", numeroApartamento="
				+ numeroApartamento + ", documentoMorador=" + documentoMorador + ", nomeMorador=" + nomeMorador
				+ ", tipoMorador=" + tipoMorador + ", idBloco=" + idBloco + ", nomeBloco=" + nomeBloco
				+ ", numeroBloco=" + numeroBloco + ", idCondominio=" + idCondominio + ", nomeCondominio="
				+ nomeCondominio + ", idConstrutora=" + idConstrutora + ", nomeFantasiaConstrutora="
				+ nomeFantasiaConstrutora + "]";
	}

	public GetApartamentosMoradoresID getApartamentosMoradoresID() {
		return apartamentosMoradoresID;
	}

	public void setApartamentosMoradoresID(GetApartamentosMoradoresID apartamentosMoradoresID) {
		this.apartamentosMoradoresID = apartamentosMoradoresID;
	}

	public String getNumeroApartamento() {
		return numeroApartamento;
	}

	public void setNumeroApartamento(String numeroApartamento) {
		this.numeroApartamento = numeroApartamento;
	}

	public String getDocumentoMorador() {
		return documentoMorador;
	}

	public void setDocumentoMorador(String documentoMorador) {
		this.documentoMorador = documentoMorador;
	}

	public String getNomeMorador() {
		return nomeMorador;
	}

	public void setNomeMorador(String nomeMorador) {
		this.nomeMorador = nomeMorador;
	}

	public String getTipoMorador() {
		return tipoMorador;
	}

	public void setTipoMorador(String tipoMorador) {
		this.tipoMorador = tipoMorador;
	}

	public Integer getIdBloco() {
		return idBloco;
	}

	public void setIdBloco(Integer idBloco) {
		this.idBloco = idBloco;
	}

	public String getNomeBloco() {
		return nomeBloco;
	}

	public void setNomeBloco(String nomeBloco) {
		this.nomeBloco = nomeBloco;
	}

	public Integer getNumeroBloco() {
		return numeroBloco;
	}

	public void setNumeroBloco(Integer numeroBloco) {
		this.numeroBloco = numeroBloco;
	}

	public Integer getIdCondominio() {
		return idCondominio;
	}

	public void setIdCondominio(Integer idCondominio) {
		this.idCondominio = idCondominio;
	}

	public String getNomeCondominio() {
		return nomeCondominio;
	}

	public void setNomeCondominio(String nomeCondominio) {
		this.nomeCondominio = nomeCondominio;
	}

	public Integer getIdConstrutora() {
		return idConstrutora;
	}

	public void setIdConstrutora(Integer idConstrutora) {
		this.idConstrutora = idConstrutora;
	}

	public String getNomeFantasiaConstrutora() {
		return nomeFantasiaConstrutora;
	}

	public void setNomeFantasiaConstrutora(String nomeFantasiaConstrutora) {
		this.nomeFantasiaConstrutora = nomeFantasiaConstrutora;
	}

}
