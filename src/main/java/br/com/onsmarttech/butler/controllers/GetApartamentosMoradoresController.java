package br.com.onsmarttech.butler.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.onsmarttech.butler.models.base.GetApartamentosMoradores;
import br.com.onsmarttech.butler.repositories.GetApartamentosMoradoresRepository;

@RestController
@RequestMapping("/apartamentosMoradores")
public class GetApartamentosMoradoresController {

	@Autowired
	private GetApartamentosMoradoresRepository repository;

	@GetMapping
	@CrossOrigin
	public Page<GetApartamentosMoradores> findAll(Pageable pageable) {
		return repository.findAll(pageable);
	}

	@GetMapping("/buscarPorApartamento/{idApartamento}")
	@CrossOrigin
	public List<GetApartamentosMoradores> buscarPorApartamento(@PathVariable Integer idApartamento) {
		return repository.buscarPorApartamento(idApartamento);
	}

	@GetMapping("/buscarPorMorador/{idMorador}")
	@CrossOrigin
	public List<GetApartamentosMoradores> buscarPorMorador(@PathVariable Integer idMorador) {
		return repository.buscarPorMorador(idMorador);
	}
}
