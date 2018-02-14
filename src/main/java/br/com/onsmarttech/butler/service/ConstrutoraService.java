package br.com.onsmarttech.butler.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import br.com.onsmarttech.butler.models.base.Construtora;
import br.com.onsmarttech.butler.repositories.ConstrutoraRepository;

@Service
public class ConstrutoraService {

	@Autowired
	private ConstrutoraRepository repository;

	public Construtora atualizar(Long codigo, Construtora construtora) {
		Construtora construtoraSalva = repository.findOne(codigo);

		if (construtoraSalva == null) {
			throw new EmptyResultDataAccessException(1);
		}

		BeanUtils.copyProperties(construtora, construtoraSalva, "id");

		return repository.save(construtoraSalva);
	}
}
