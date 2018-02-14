package br.com.onsmarttech.butler.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import br.com.onsmarttech.butler.models.base.Empresa;
import br.com.onsmarttech.butler.repositories.EmpresaRepository;

@Service
public class EmpresaService {

	@Autowired
	private EmpresaRepository repository;

	public Empresa atualizar(Long codigo, Empresa empresa) {
		Empresa empresaSalva = repository.findOne(codigo);

		if (empresaSalva == null) {
			throw new EmptyResultDataAccessException(1);
		}

		BeanUtils.copyProperties(empresa, empresaSalva, "id");

		return repository.save(empresaSalva);
	}
}
