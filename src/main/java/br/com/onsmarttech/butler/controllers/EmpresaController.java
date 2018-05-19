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

import br.com.onsmarttech.butler.models.base.Empresa;
import br.com.onsmarttech.butler.repositories.EmpresaRepository;
import br.com.onsmarttech.butler.service.EmpresaService;

@RestController
@RequestMapping("/empresa")
public class EmpresaController {

	@Autowired
	private EmpresaRepository repository;

	@Autowired
	private EmpresaService service;

	@GetMapping("/buscarTodos")
	// @PreAuthorize("hasAuthority('ROLE_SISTEMAS_READ') or hasAuthority('ROLE_SISTEMAS_WRITE')")
	public List<Empresa> buscarTodos() {
		return repository.findAll();
	}

	@GetMapping("/buscarPorId/{id}")
	// @PreAuthorize("hasAuthority('ROLE_SISTEMAS_READ') or hasAuthority('ROLE_SISTEMAS_WRITE')")
	public ResponseEntity<?> buscarPorId(@PathVariable Long id) {
		Empresa empresa = repository.findOne(id);

		return empresa != null ? ResponseEntity.ok(empresa) : ResponseEntity.notFound().build();
	}

	@PostMapping("/salvar")
	// @PreAuthorize("hasAuthority('ROLE_SISTEMAS_WRITE')")
	public ResponseEntity<?> salvar(@Valid @RequestBody Empresa empresa) {
		Empresa empresaSalva = repository.save(empresa);

		return ResponseEntity.status(HttpStatus.CREATED).body(empresaSalva);
	}

	@DeleteMapping("/deletarPorId/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	// @PreAuthorize("hasAuthority('ROLE_SISTEMAS_WRITE')")
	public void deletar(@PathVariable Long id) {
		repository.delete(id);
	}

	@PutMapping("/atualizar/{id}")
	// @PreAuthorize("hasAuthority('ROLE_SISTEMAS_WRITE')")
	public ResponseEntity<?> atualizar(@PathVariable Long id, @Valid @RequestBody Empresa empresa) {
		Empresa empresaSalva = service.atualizar(id, empresa);

		return ResponseEntity.ok(empresaSalva);
	}
}
