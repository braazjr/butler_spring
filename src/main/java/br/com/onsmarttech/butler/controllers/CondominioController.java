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

import br.com.onsmarttech.butler.models.base.Condominio;
import br.com.onsmarttech.butler.repositories.CondominioRepository;
import br.com.onsmarttech.butler.service.CondominioService;

@RestController
@RequestMapping("/condominio")
public class CondominioController {

	@Autowired
	private CondominioRepository repository;

	@Autowired
	private CondominioService service;

	@GetMapping("/buscarTodos")
	public List<Condominio> buscarTodos() {
		return repository.findAll();
	}

	@GetMapping("/buscarPorId/{id}")
	public ResponseEntity<?> buscarPorId(@PathVariable Long id) {
		Condominio condominio = repository.findOne(id);

		return condominio != null ? ResponseEntity.ok(condominio) : ResponseEntity.notFound().build();
	}

	@PostMapping("/salvar")
	public ResponseEntity<?> salvar(@Valid @RequestBody Condominio condominio) {
		Condominio condominioSalva = repository.save(condominio);

		return ResponseEntity.status(HttpStatus.CREATED).body(condominioSalva);
	}

	@DeleteMapping("/deletarPorID/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void deletar(@PathVariable Long id) {
		repository.delete(id);
	}

	@PutMapping("/atualizar/{id}")
	public ResponseEntity<?> atualizar(@PathVariable Long id, @Valid @RequestBody Condominio condominio) {
		Condominio condominioSalva = service.atualizar(id, condominio);

		return ResponseEntity.ok(condominioSalva);
	}
}
