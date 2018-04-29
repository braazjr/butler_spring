package br.com.onsmarttech.butler.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import br.com.onsmarttech.butler.models.base.Apartamento;
import br.com.onsmarttech.butler.repositories.ApartamentoRepository;
import br.com.onsmarttech.butler.service.ApartamentoService;

@RestController
@RequestMapping("/apartamento")
public class ApartamentoController {

	@Autowired
	private ApartamentoRepository repository;

	@Autowired
	private ApartamentoService service;

	@GetMapping("/buscarTodos")
	public List<Apartamento> buscarTodos() {
		return repository.findAll();
	}

	@GetMapping("/buscarPorId/{id}")
	public ResponseEntity<?> buscarPorId(@PathVariable Long id) {
		Apartamento apartamento = repository.findOne(id);

		return apartamento != null ? ResponseEntity.ok(apartamento) : ResponseEntity.notFound().build();
	}

	@GetMapping("/buscarPorBloco/{idBloco}")
	public ResponseEntity<?> buscarPorBloco(@PathVariable Long idBloco) {
		List<Apartamento> apartamentos = repository.buscarPorBloco(idBloco);

		return apartamentos != null ? ResponseEntity.ok(apartamentos) : ResponseEntity.notFound().build();
	}

	@PostMapping("/salvar")
	public ResponseEntity<?> salvar(@Valid @RequestBody Apartamento apartamento) {
		Apartamento apartamentoSalva = repository.save(apartamento);

		return ResponseEntity.status(HttpStatus.CREATED).body(apartamentoSalva);
	}

	@DeleteMapping("/deletarPorID/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void deletar(@PathVariable Long id) {
		repository.delete(id);
	}

	@PutMapping("/atualizar/{id}")
	public ResponseEntity<?> atualizar(@PathVariable Long id, @Valid @RequestBody Apartamento apartamento) {
		Apartamento apartamentoSalva = service.atualizar(id, apartamento);

		return ResponseEntity.ok(apartamentoSalva);
	}
}
