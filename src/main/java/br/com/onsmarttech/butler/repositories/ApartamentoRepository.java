package br.com.onsmarttech.butler.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.onsmarttech.butler.models.base.Apartamento;

public interface ApartamentoRepository extends JpaRepository<Apartamento, Long> {

}
