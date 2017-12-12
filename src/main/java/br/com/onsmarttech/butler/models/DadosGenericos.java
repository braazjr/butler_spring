package br.com.onsmarttech.butler.models;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.validator.constraints.NotBlank;

@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public class DadosGenericos implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	@Column(unique = true, nullable = false)
	private Long id;
	private Boolean ativo;
	
	@Column(nullable = false, length = 30)
	@NotBlank
	@Size(min = 5, max = 30)
	private String bairro;

	@Column(nullable = false, length = 9)
	@NotBlank
	@Size(min = 9, max = 9)
	private String cep;

	@Column(nullable = false, length = 30)
	@NotBlank
	@Size(min = 5, max = 30)
	private String cidade;
	private String complemento;

	@Column(nullable = false, length = 50)
	@NotBlank
	@Size(min = 5, max = 50)
	private String email;

	@Column(nullable = false, length = 20)
	@NotBlank
	@Size(min = 5, max = 20)
	private String estado;
	private Integer numero;

	@Column(nullable = false, length = 50)
	@NotBlank
	@Size(min = 5, max = 50)
	private String rua;

	@Column(nullable = false, length = 13)
	@NotBlank
	@Size(min = 13, max = 13)
	private String telefone;

	@Temporal(TemporalType.TIMESTAMP)
	private Date dataHoraCadastro;

	@Temporal(TemporalType.TIMESTAMP)
	private Date dataHoraModificacao;

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(nullable = false)
	public Boolean getAtivo() {
		return this.ativo;
	}

	public void setAtivo(Boolean ativo) {
		this.ativo = ativo;
	}

	public String getBairro() {
		return this.bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCep() {
		return this.cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getCidade() {
		return this.cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	@Column(nullable = true, length = 50)
	public String getComplemento() {
		return this.complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEstado() {
		return this.estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	@Column(nullable = false)
	public Integer getNumero() {
		return this.numero;
	}

	public void setNumero(Integer numero) {
		this.numero = numero;
	}

	public String getRua() {
		return this.rua;
	}

	public void setRua(String rua) {
		this.rua = rua;
	}

	public String getTelefone() {
		return this.telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public Date getDataHoraCadastro() {
		return dataHoraCadastro == null ? new Date() : dataHoraCadastro;
	}

	public void setDataHoraCadastro(Date dataHoraCadastro) {
		this.dataHoraCadastro = dataHoraCadastro;
	}

	@UpdateTimestamp
	public Date getDataHoraModificacao() {
		return dataHoraModificacao;
	}

	public void setDataHoraModificacao(Date dataHoraModificacao) {
		this.dataHoraModificacao = dataHoraModificacao;
	}
}
