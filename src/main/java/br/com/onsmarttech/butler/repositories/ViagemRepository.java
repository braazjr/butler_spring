package br.com.onsmarttech.butler.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import br.com.onsmarttech.butler.models.buscontrol.Viagem;

@Repository
public interface ViagemRepository extends JpaRepository<Viagem, Integer> {

	@Query("select v from Viagem v where v.residentes is not empty")
	public List<Viagem> buscarViagensComPassageiros();

}
