package br.com.onsmarttech.butler.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import br.com.onsmarttech.butler.models.base.Apartamento;

public interface ApartamentoRepository extends JpaRepository<Apartamento, Long> {

    @Query("select a from Apartamento a where a.bloco.id = ?1")
	public List<Apartamento> buscarPorBloco(Long idBloco);

}
