package br.com.onsmarttech.butler.models.base;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.validation.constraints.NotNull;

import org.springframework.data.annotation.Transient;

import br.com.onsmarttech.butler.models.security.Usuario;

@Entity
public class Morador {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(unique = true, length = 20)
	// @NotNull
	private String documento;
	private Boolean ativo;

	@Column(length = 14)
	// @NotNull
	private String celular;

	@Column(length = 50)
	// @NotNull
	private String email;

	@Column(length = 50)
	@NotNull
	private String nome;

	@Column(length = 14)
	// @NotNull
	private String telefone;

	@Column(length = 8, name = "placa_carro")
	private String placaCarro;

	private String observacao;
	private String parentesco;

	@Enumerated(EnumType.STRING)
	// @NotNull
	// @JoinColumn(name = "tipo_documento")
	private TipoDocumento tipoDocumento;

	@Enumerated(EnumType.STRING)
//	@NotNull
	// @JoinColumn(name = "tipo_morador")
	private TipoMorador tipoMorador;

	@Transient
	private String foto64;

	@Column(name = "data_hora_cadastro")
	private LocalDateTime dataHoraCadastro;

	@Column(name = "data_hora_modificacao")
	private LocalDateTime dataHoraModificacao;

	@OneToOne
	@JoinColumn(name = "id_usuario")
	@NotNull
	private Usuario usuario;

	@PrePersist
	void onCreate() {
		dataHoraCadastro = LocalDateTime.now();
		dataHoraModificacao = LocalDateTime.now();
		ativo = true;
	}

	@PreUpdate
	void onUpdate() {
		dataHoraModificacao = LocalDateTime.now();
	}

	public Morador() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDocumento() {
		return this.documento;
	}

	public void setDocumento(String documento) {
		this.documento = documento;
	}

	public Boolean getAtivo() {
		return this.ativo;
	}

	public void setAtivo(Boolean ativo) {
		this.ativo = ativo;
	}

	public String getCelular() {
		return this.celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getTelefone() {
		return this.telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getPlacaCarro() {
		return placaCarro;
	}

	public void setPlacaCarro(String placaCarro) {
		this.placaCarro = placaCarro;
	}

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	public String getParentesco() {
		return parentesco;
	}

	public void setParentesco(String parentesco) {
		this.parentesco = parentesco;
	}

	public TipoDocumento getTipoDocumento() {
		return tipoDocumento;
	}

	public void setTipoDocumento(TipoDocumento tipoDocumento) {
		this.tipoDocumento = tipoDocumento;
	}

	public TipoMorador getTipoMorador() {
		return tipoMorador;
	}

	public void setTipoMorador(TipoMorador tipoMorador) {
		this.tipoMorador = tipoMorador;
	}
	
	public String getFoto64() {
		return foto64;
	}
	
	public void setFoto64(String foto64) {
		this.foto64 = foto64;
	}

	public LocalDateTime getDataHoraCadastro() {
		return dataHoraCadastro;
	}

	public void setDataHoraCadastro(LocalDateTime dataHoraCadastro) {
		this.dataHoraCadastro = dataHoraCadastro;
	}

	public LocalDateTime getDataHoraModificacao() {
		return dataHoraModificacao;
	}

	public void setDataHoraModificacao(LocalDateTime dataHoraModificacao) {
		this.dataHoraModificacao = dataHoraModificacao;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
}