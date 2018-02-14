package br.com.onsmarttech.butler.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.onsmarttech.butler.models.base.Bloco;

public interface BlocoRepository extends JpaRepository<Bloco, Long> {

}
