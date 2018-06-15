package br.com.onsmarttech.butler.models.base;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonIgnore;

import br.com.onsmarttech.butler.models.security.Usuario;

@Entity
public class Empresa {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(length = 18, unique = true)
	@NotNull
	@Size(min = 18, max = 18)
	private String cnpj;

	@Column(length = 50, unique = true, name = "nome_fantasia")
	@NotNull
	@Size(min = 3, max = 50)
	private String nomeFantasia;

	@Column(length = 50, unique = true, name = "nome_social")
	@NotNull
	@Size(min = 5, max = 50)
	private String nomeSocial;

	private boolean ativo;

	@Column(length = 30)
	@NotNull
	@Size(min = 5, max = 30)
	private String bairro;

	@Column(length = 9)
	@NotNull
	@Size(min = 9, max = 9)
	private String cep;

	@Column(length = 30)
	@NotNull
	@Size(min = 5, max = 30)
	private String cidade;

	@Column(length = 50)
	private String complemento;

	@Column(length = 50)
	@Size(min = 5, max = 50)
	private String email;

	@Column(length = 20)
	@NotNull
	@Size(min = 5, max = 20)
	private String estado;
	private Integer numero;

	@Column(length = 50)
	@NotNull
	@Size(min = 5, max = 50)
	private String rua;

	@Column(length = 13)
	@NotNull
	@Size(min = 13, max = 13)
	private String telefone;

	@JsonIgnore
	@OneToMany(mappedBy = "empresa")
	private List<Construtora> construtoras;

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
	}

	@PreUpdate
	void onUpdate() {
		dataHoraModificacao = LocalDateTime.now();
	}

	public Empresa() {
	}

	@Override
	public String toString() {
		return "Empresa [id=" + id + ", cnpj=" + cnpj + ", nomeFantasia=" + nomeFantasia + ", nomeSocial=" + nomeSocial
				+ ", ativo=" + ativo + ", bairro=" + bairro + ", cep=" + cep + ", cidade=" + cidade + ", complemento="
				+ complemento + ", email=" + email + ", estado=" + estado + ", numero=" + numero + ", rua=" + rua
				+ ", telefone=" + telefone + ", construtoras=" + construtoras + ", dataHoraCadastro=" + dataHoraCadastro
				+ ", dataHoraModificacao=" + dataHoraModificacao + ", usuario=" + usuario + "]";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCnpj() {
		return this.cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public String getNomeFantasia() {
		return this.nomeFantasia;
	}

	public void setNomeFantasia(String nomeFantasia) {
		this.nomeFantasia = nomeFantasia;
	}

	public String getNomeSocial() {
		return this.nomeSocial;
	}

	public void setNomeSocial(String nomeSocial) {
		this.nomeSocial = nomeSocial;
	}

	public boolean isAtivo() {
		return ativo;
	}

	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public Integer getNumero() {
		return numero;
	}

	public void setNumero(Integer numero) {
		this.numero = numero;
	}

	public String getRua() {
		return rua;
	}

	public void setRua(String rua) {
		this.rua = rua;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public List<Construtora> getConstrutoras() {
		return this.construtoras;
	}

	public void setConstrutoras(List<Construtora> construtoras) {
		this.construtoras = construtoras;
	}

	public Construtora addConstrutora(Construtora construtora) {
		getConstrutoras().add(construtora);
		construtora.setEmpresa(this);

		return construtora;
	}

	public Construtora removeConstrutora(Construtora construtora) {
		getConstrutoras().remove(construtora);
		construtora.setEmpresa(null);

		return construtora;
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