package br.com.onsmarttech.butler.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import br.com.onsmarttech.butler.models.base.Morador;
import br.com.onsmarttech.butler.repositories.MoradorRepository;

@Service
public class MoradorService {

	@Autowired
	private MoradorRepository repository;

	public Morador atualizar(Long codigo, Morador morador) {
		Morador moradorSalva = repository.findOne(codigo);

		if (moradorSalva == null) {
			throw new EmptyResultDataAccessException(1);
		}

		BeanUtils.copyProperties(morador, moradorSalva, "id");

		return repository.save(moradorSalva);
	}
}
