package br.com.onsmarttech.butler.models;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.*;

import org.hibernate.annotations.UpdateTimestamp;

/**
 * The persistent class for the perfil database table.
 * 
 */
@Entity
//@Table(schema = "security")
@NamedQuery(name = "Perfil.findAll", query = "SELECT p FROM Perfil p")
public class Perfil implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long id;
	private String nome;

	private List<Objeto> objetos;

	private Date dataHoraCadastro;
	private Date dataHoraModificacao;
	private Usuario usuario;

	public Perfil() {
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true, nullable = false)
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(nullable = false, length = 15)
	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "perfil_objeto", joinColumns = @JoinColumn(name = "codigo_perfil"), inverseJoinColumns = @JoinColumn(name = "codigo_objeto"))
	public List<Objeto> getObjetos() {
		return objetos;
	}

	public void setObjetos(List<Objeto> objetos) {
		this.objetos = objetos;
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