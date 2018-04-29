package br.com.onsmarttech.butler.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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

	@GetMapping("/buscarTodos")
	public List<GetApartamentosMoradores> buscarTodos() {
		return repository.findAll();
	}

	@GetMapping("/buscarPorApartamento/{idApartamento}")
	public List<GetApartamentosMoradores> buscarPorApartamento(@PathVariable Integer idApartamento) {
		return repository.buscarPorApartamento(idApartamento);
	}

	@GetMapping("/buscarPorMorador/{idMorador}")
	public List<GetApartamentosMoradores> buscarPorMorador(@PathVariable Integer idMorador) {
		return repository.buscarPorMorador(idMorador);
	}
}
