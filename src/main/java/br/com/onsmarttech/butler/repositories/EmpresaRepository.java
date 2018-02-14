package br.com.onsmarttech.butler.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.onsmarttech.butler.models.base.Empresa;

public interface EmpresaRepository extends JpaRepository<Empresa, Long> {

}
