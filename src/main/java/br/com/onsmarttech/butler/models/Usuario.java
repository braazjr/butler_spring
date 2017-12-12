package br.com.onsmarttech.butler.models;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.*;

import org.hibernate.annotations.UpdateTimestamp;

/**
 * The persistent class for the usuario database table.
 * 
 */
@Entity
//@Table(schema = "security")
@NamedQuery(name = "Usuario.findAll", query = "SELECT u FROM Usuario u")
public class Usuario extends DadosGenericos implements Serializable {

	private static final long serialVersionUID = 1L;

	private String cpf;
	private String login;
	private String senha;

	private List<Perfil> perfis;

	private Date dataHoraCadastro;
	private Date dataHoraModificacao;
	private Usuario usuario;

	public Usuario() {
	}

	@Column(length = 255)
	public String getCpf() {
		return this.cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	@Column(nullable = false, length = 15)
	public String getLogin() {
		return this.login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	@Column(nullable = false, length = 30)
	public String getSenha() {
		return this.senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "usuario_perfil", joinColumns = @JoinColumn(name = "codigo_usuario"), inverseJoinColumns = @JoinColumn(name = "codigo_perfil"))
	public List<Perfil> getPerfis() {
		return perfis;
	}

	public void setPerfis(List<Perfil> perfis) {
		this.perfis = perfis;
	}

	@Temporal(TemporalType.TIMESTAMP)
	public Date getDataHoraCadastro() {
		return dataHoraCadastro == null ? new Date() : dataHoraCadastro;
	}

	public void setDataHoraCadastro(Date dataHoraCadastro) {
		this.dataHoraCadastro = dataHoraCadastro;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@UpdateTimestamp
	public Date getDataHoraModificacao() {
		return dataHoraModificacao;
	}

	public void setDataHoraModificacao(Date dataHoraModificacao) {
		this.dataHoraModificacao = dataHoraModificacao;
	}

	@OneToOne
	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

}