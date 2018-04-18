package br.com.onsmarttech.butler.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import br.com.onsmarttech.butler.models.base.Documento;

@Repository
public interface DocumentoRepository extends JpaRepository<Documento, Long> {

	@Query("select d from Documento d where d.apartamento.id = ?1")
	List<Documento> buscarDocumentosPorApartamento(Long idApartamento);

}
