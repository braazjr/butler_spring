package br.com.onsmarttech.butler.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import br.com.onsmarttech.butler.models.base.GetApartamentosMoradores;

@Repository
public interface GetApartamentosMoradoresRepository extends JpaRepository<GetApartamentosMoradores, Integer> {

	@Query("select v from GetApartamentosMoradores v where v.apartamentosMoradoresID.idApartamento = ?1")
	public List<GetApartamentosMoradores> buscarPorApartamento(Integer idApartamento);

	@Query("select v from GetApartamentosMoradores v where v.apartamentosMoradoresID.idMorador = ?1")
	public List<GetApartamentosMoradores> buscarPorMorador(Integer idMorador);

}
