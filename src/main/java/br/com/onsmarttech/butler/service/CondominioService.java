package br.com.onsmarttech.butler.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import br.com.onsmarttech.butler.models.base.Condominio;
import br.com.onsmarttech.butler.repositories.CondominioRepository;

@Service
public class CondominioService {

	@Autowired
	private CondominioRepository repository;

	public Condominio atualizar(Long codigo, Condominio condominio) {
		Condominio condominioSalva = repository.findOne(codigo);

		if (condominioSalva == null) {
			throw new EmptyResultDataAccessException(1);
		}

		BeanUtils.copyProperties(condominio, condominioSalva, "id");

		return repository.save(condominioSalva);
	}
}
