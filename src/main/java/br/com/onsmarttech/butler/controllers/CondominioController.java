package br.com.onsmarttech.butler.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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

	@GetMapping
	public Page<Condominio> listaCondominios(Pageable pageable) {
		return repository.findAll(pageable);
	}

	@GetMapping("/buscarPorId/{id}")
	public ResponseEntity<?> buscarCondominioPorId(@PathVariable Long id) {
		Condominio condominio = repository.findOne(id);

		return condominio != null ? ResponseEntity.ok(condominio) : ResponseEntity.notFound().build();
	}

	@PostMapping
	public ResponseEntity<?> salvarCondominio(@Valid @RequestBody Condominio condominio) {
		Condominio condominioSalva = repository.save(condominio);

		return ResponseEntity.status(HttpStatus.CREATED).body(condominioSalva);
	}

	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void deletar(@PathVariable Long id) {
		repository.delete(id);
	}

	@PutMapping("/{id}")
	public ResponseEntity<?> salvarCondominio(@PathVariable Long id, @Valid @RequestBody Condominio condominio) {
		Condominio condominioSalva = service.atualizar(id, condominio);

		return ResponseEntity.ok(condominioSalva);
	}
}
