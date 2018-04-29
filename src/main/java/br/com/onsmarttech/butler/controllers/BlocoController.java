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

import br.com.onsmarttech.butler.models.base.Bloco;
import br.com.onsmarttech.butler.repositories.BlocoRepository;
import br.com.onsmarttech.butler.service.BlocoService;

@RestController
@RequestMapping("/bloco")
public class BlocoController {

	@Autowired
	private BlocoRepository repository;

	@Autowired
	private BlocoService service;

	@GetMapping("/buscarTodos")
	public List<Bloco> buscarTodos() {
		return repository.findAll();
	}

	@GetMapping("/buscarPorId/{id}")
	public ResponseEntity<?> buscarPorId(@PathVariable Long id) {
		Bloco bloco = repository.findOne(id);

		return bloco != null ? ResponseEntity.ok(bloco) : ResponseEntity.notFound().build();
	}

	@GetMapping("/buscarPorCondominio/{idCondominio}")
	public ResponseEntity<?> buscarPorCondominio(@PathVariable Long idCondominio) {
		List<Bloco> blocos = repository.buscarPorCondominio(idCondominio);

		return blocos != null ? ResponseEntity.ok(blocos) : ResponseEntity.notFound().build();
	}

	@PostMapping("/salvar")
	public ResponseEntity<?> salvar(@Valid @RequestBody Bloco bloco) {
		Bloco blocoSalva = repository.save(bloco);

		return ResponseEntity.status(HttpStatus.CREATED).body(blocoSalva);
	}

	@DeleteMapping("/deletarPorID/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void deletar(@PathVariable Long id) {
		repository.delete(id);
	}

	@PutMapping("/atualizar/{id}")
	public ResponseEntity<?> atualizar(@PathVariable Long id, @Valid @RequestBody Bloco bloco) {
		Bloco blocoSalva = service.atualizar(id, bloco);

		return ResponseEntity.ok(blocoSalva);
	}
}
