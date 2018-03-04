package br.com.onsmarttech.butler.models.base;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.validation.constraints.NotNull;

@Entity
public class Morador {

	@Id
	@Column(unique = true, length = 20)
	@NotNull
	private String documento;
	private Boolean ativo;

	@Column(length = 14)
	@NotNull
	private String celular;

	@Column(length = 30)
	@NotNull
	private String email;

	@Column(length = 30)
	@NotNull
	private String nome;

	@Column(length = 14)
	@NotNull
	private String telefone;

	@Column(length = 8, name = "placa_carro")
	private String placaCarro;

	private String observacao;
	private String parentesco;

	@Enumerated
	@NotNull
	@JoinColumn(name = "tipo_documento")
	private TipoDocumento tipodocumento;

	@Enumerated
	@NotNull
	@JoinColumn(name = "tipo_morador")
	private TipoMorador tipomorador;

	@OneToMany
	@JoinTable(name = "apartamento_morador", joinColumns = @JoinColumn(name = "id_apartamento"), inverseJoinColumns = @JoinColumn(name = "id_morador"))
	private List<Apartamento> apartamentos;

	@Column(name = "data_hora_cadastro")
	private LocalDateTime dataHoraCadastro;

	@Column(name = "data_hora_modificacao")
	private LocalDateTime dataHoraModificacao;

	public Morador() {
	}

	@PrePersist
	private void onCreate() {
		ativo = true;
		dataHoraCadastro = LocalDateTime.now();
		dataHoraModificacao = LocalDateTime.now();
	}

	@PreUpdate
	private void onUpdate() {
		dataHoraModificacao = LocalDateTime.now();
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

	public TipoDocumento getTipodocumento() {
		return this.tipodocumento;
	}

	public void setTipodocumento(TipoDocumento tipodocumento) {
		this.tipodocumento = tipodocumento;
	}

	public TipoMorador getTipomorador() {
		return this.tipomorador;
	}

	public void setTipomorador(TipoMorador tipomorador) {
		this.tipomorador = tipomorador;
	}

	public List<Apartamento> getApartamentos() {
		return apartamentos;
	}

	public void setApartamentos(List<Apartamento> apartamentos) {
		this.apartamentos = apartamentos;
	}

	public Apartamento addApartamento(Apartamento apartamento) {
		getApartamentos().add(apartamento);
		apartamento.setMorador(this);

		return apartamento;
	}

	public Apartamento removeApartamento(Apartamento apartamento) {
		getApartamentos().remove(apartamento);
		apartamento.setMorador(null);

		return apartamento;
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

}