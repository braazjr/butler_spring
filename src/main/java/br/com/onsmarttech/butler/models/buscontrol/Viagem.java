package br.com.onsmarttech.butler.models.buscontrol;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import br.com.onsmarttech.butler.models.security.Usuario;

@Entity
@Table(schema = "buscontrol")
public class Viagem {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@OneToOne
	@JoinColumn(name = "id_rota")
	@NotNull
	private Rota rota;

	@OneToOne
	@JoinColumn(name = "id_usuario")
	@NotNull
	private Usuario usuario;

	@NotNull
	private LocalDate data;

	@NotNull
	private LocalDateTime horario;

	@OneToMany(mappedBy = "viagem", cascade = CascadeType.ALL)
	private List<ViagemResidente> residentes;

	public Viagem() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Rota getRota() {
		return rota;
	}

	public void setRota(Rota rota) {
		this.rota = rota;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public LocalDate getData() {
		return data;
	}

	public void setData(LocalDate data) {
		this.data = data;
	}

	public LocalDateTime getHorario() {
		return horario;
	}

	public void setHorario(LocalDateTime horario) {
		this.horario = horario;
	}

	public List<ViagemResidente> getResidentes() {
		return residentes;
	}

	public void setResidentes(List<ViagemResidente> residentes) {
		this.residentes = residentes;
	}

}