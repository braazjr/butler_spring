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

import br.com.onsmarttech.butler.models.base.Construtora;
import br.com.onsmarttech.butler.repositories.ConstrutoraRepository;
import br.com.onsmarttech.butler.service.ConstrutoraService;

@RestController
@RequestMapping("/construtora")
public class ConstrutoraController {

	@Autowired
	private ConstrutoraRepository repository;

	@Autowired
	private ConstrutoraService service;

	@GetMapping("/buscarTodos")
	public List<Construtora> buscarTodos() {
		return repository.findAll();
	}

	@GetMapping("/buscarPorId/{id}")
	public ResponseEntity<?> buscarPorId(@PathVariable Long id) {
		Construtora construtora = repository.findOne(id);

		return construtora != null ? ResponseEntity.ok(construtora) : ResponseEntity.notFound().build();
	}

	@PostMapping("/salvar")
	public ResponseEntity<?> salvar(@Valid @RequestBody Construtora construtora) {
		Construtora construtoraSalva = repository.save(construtora);

		return ResponseEntity.status(HttpStatus.CREATED).body(construtoraSalva);
	}

	@DeleteMapping("/deletarPorId/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void deletar(@PathVariable Long id) {
		repository.delete(id);
	}

	@PutMapping("/atualizar/{id}")
	public ResponseEntity<?> atualizar(@PathVariable Long id, @Valid @RequestBody Construtora construtora) {
		Construtora construtoraSalva = service.atualizar(id, construtora);

		return ResponseEntity.ok(construtoraSalva);
	}
}
