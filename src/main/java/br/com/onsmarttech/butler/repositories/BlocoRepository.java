package br.com.onsmarttech.butler.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import br.com.onsmarttech.butler.models.base.Bloco;

@Repository
public interface BlocoRepository extends JpaRepository<Bloco, Long> {

    @Query("select b from Bloco b where b.condominio.id = ?1")
	public List<Bloco> buscarPorCondominio(Long idCondominio);

}
