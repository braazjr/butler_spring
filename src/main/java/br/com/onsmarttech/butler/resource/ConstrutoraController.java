package br.com.onsmarttech.butler.resource;

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

import br.com.onsmarttech.butler.models.Construtora;
import br.com.onsmarttech.butler.repositories.ConstrutoraRepository;
import br.com.onsmarttech.butler.service.ConstrutoraService;

@RestController
@RequestMapping("/construtoras")
public class ConstrutoraController {

	@Autowired
	private ConstrutoraRepository repository;

	@Autowired
	private ConstrutoraService service;

	@GetMapping
	public Page<Construtora> listaConstrutoras(Pageable pageable) {
		return repository.findAll(pageable);
	}

	@GetMapping("/{id}")
	public ResponseEntity<?> buscarConstrutoraPorId(@PathVariable Long id) {
		Construtora construtora = repository.findOne(id);

		return construtora != null ? ResponseEntity.ok(construtora) : ResponseEntity.notFound().build();
	}

	@PostMapping
	public ResponseEntity<?> salvarConstrutora(@Valid @RequestBody Construtora construtora) {
		Construtora construtoraSalva = repository.save(construtora);

		return ResponseEntity.status(HttpStatus.CREATED).body(construtoraSalva);
	}

	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void deletar(@PathVariable Long id) {
		repository.delete(id);
	}

	@PutMapping("/{id}")
	public ResponseEntity<?> salvarConstrutora(@PathVariable Long id, @Valid @RequestBody Construtora construtora) {
		Construtora construtoraSalva = service.atualizar(id, construtora);

		return ResponseEntity.ok(construtoraSalva);
	}
}
