package br.com.onsmarttech.butler.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.onsmarttech.butler.models.buscontrol.Rota;

@Repository
public interface RotaRepository extends JpaRepository<Rota, Integer> {

}
