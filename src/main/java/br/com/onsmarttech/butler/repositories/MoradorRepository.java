package br.com.onsmarttech.butler.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.onsmarttech.butler.models.Morador;

public interface MoradorRepository extends JpaRepository<Morador, String> {

}
