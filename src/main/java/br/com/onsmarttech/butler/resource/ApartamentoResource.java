package br.com.onsmarttech.butler.resource;

import java.util.List;

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

import br.com.onsmarttech.butler.models.base.Apartamento;
import br.com.onsmarttech.butler.repositories.ApartamentoRepository;
import br.com.onsmarttech.butler.service.ApartamentoService;

@RestController
@RequestMapping("/apartamento")
public class ApartamentoResource {

	@Autowired
	private ApartamentoRepository repository;

	@Autowired
	private ApartamentoService service;

	@GetMapping
	public Page<Apartamento> listaApartamentos(Pageable pageable) {
		return repository.findAll(pageable);
	}

	@GetMapping("/buscarPorId/{id}")
	public ResponseEntity<?> buscarApartamentoPorId(@PathVariable Long id) {
		Apartamento apartamento = repository.findOne(id);

		return apartamento != null ? ResponseEntity.ok(apartamento) : ResponseEntity.notFound().build();
	}

	@GetMapping("/buscarPorBloco/{idBloco}")
	public ResponseEntity<?> buscarPorBloco(@PathVariable Long idBloco) {
		List<Apartamento> apartamentos = repository.buscarPorBloco(idBloco);

		return apartamentos != null ? ResponseEntity.ok(apartamentos) : ResponseEntity.notFound().build();
	}

	@PostMapping
	public ResponseEntity<?> salvarApartamento(@Valid @RequestBody Apartamento apartamento) {
		Apartamento apartamentoSalva = repository.save(apartamento);

		return ResponseEntity.status(HttpStatus.CREATED).body(apartamentoSalva);
	}

	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void deletar(@PathVariable Long id) {
		repository.delete(id);
	}

	@PutMapping("/{id}")
	public ResponseEntity<?> salvarApartamento(@PathVariable Long id, @Valid @RequestBody Apartamento apartamento) {
		Apartamento apartamentoSalva = service.atualizar(id, apartamento);

		return ResponseEntity.ok(apartamentoSalva);
	}
}
