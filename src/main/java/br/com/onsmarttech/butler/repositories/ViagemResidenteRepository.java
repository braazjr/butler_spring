package br.com.onsmarttech.butler.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import br.com.onsmarttech.butler.models.buscontrol.ViagemResidente;

@Repository
public interface ViagemResidenteRepository extends JpaRepository<ViagemResidente, Integer> {

	@Query("select vr from ViagemResidente vr where vr.viagem.id = ?1")
	public List<ViagemResidente> buscarViagemResidentesPorViagem(Integer idViagem);

}
