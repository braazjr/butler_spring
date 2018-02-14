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

import br.com.onsmarttech.butler.models.base.Bloco;
import br.com.onsmarttech.butler.repositories.BlocoRepository;
import br.com.onsmarttech.butler.service.BlocoService;

@RestController
@RequestMapping("/blocos")
public class BlocoController {

	@Autowired
	private BlocoRepository repository;

	@Autowired
	private BlocoService service;

	@GetMapping
	public Page<Bloco> listaBlocos(Pageable pageable) {
		return repository.findAll(pageable);
	}

	@GetMapping("/{id}")
	public ResponseEntity<?> buscarBlocoPorId(@PathVariable Long id) {
		Bloco bloco = repository.findOne(id);

		return bloco != null ? ResponseEntity.ok(bloco) : ResponseEntity.notFound().build();
	}

	@PostMapping
	public ResponseEntity<?> salvarBloco(@Valid @RequestBody Bloco bloco) {
		Bloco blocoSalva = repository.save(bloco);

		return ResponseEntity.status(HttpStatus.CREATED).body(blocoSalva);
	}

	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void deletar(@PathVariable Long id) {
		repository.delete(id);
	}

	@PutMapping("/{id}")
	public ResponseEntity<?> salvarBloco(@PathVariable Long id, @Valid @RequestBody Bloco bloco) {
		Bloco blocoSalva = service.atualizar(id, bloco);

		return ResponseEntity.ok(blocoSalva);
	}
}
