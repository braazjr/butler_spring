package br.com.onsmarttech.butler.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.onsmarttech.butler.models.Condominio;

public interface CondominioRepository extends JpaRepository<Condominio, Long> {

}
