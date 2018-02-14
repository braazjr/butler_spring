package br.com.onsmarttech.butler.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import br.com.onsmarttech.butler.models.base.Bloco;
import br.com.onsmarttech.butler.repositories.BlocoRepository;

@Service
public class BlocoService {

	@Autowired
	private BlocoRepository repository;

	public Bloco atualizar(Long codigo, Bloco bloco) {
		Bloco blocoSalva = repository.findOne(codigo);

		if (blocoSalva == null) {
			throw new EmptyResultDataAccessException(1);
		}

		BeanUtils.copyProperties(bloco, blocoSalva, "id");

		return repository.save(blocoSalva);
	}
}
