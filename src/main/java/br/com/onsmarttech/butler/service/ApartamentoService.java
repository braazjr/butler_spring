package br.com.onsmarttech.butler.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import br.com.onsmarttech.butler.models.Apartamento;
import br.com.onsmarttech.butler.repositories.ApartamentoRepository;

@Service
public class ApartamentoService {

	@Autowired
	private ApartamentoRepository repository;

	public Apartamento atualizar(Long codigo, Apartamento apartamento) {
		Apartamento apartamentoSalva = repository.findOne(codigo);

		if (apartamentoSalva == null) {
			throw new EmptyResultDataAccessException(1);
		}

		BeanUtils.copyProperties(apartamento, apartamentoSalva, "id");

		return repository.save(apartamentoSalva);
	}
}
