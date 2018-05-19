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

import br.com.onsmarttech.butler.models.base.Morador;
import br.com.onsmarttech.butler.repositories.MoradorRepository;
import br.com.onsmarttech.butler.service.MoradorService;

@RestController
@RequestMapping("/morador")
public class MoradorController {

	@Autowired
	private MoradorRepository repository;

	@Autowired
	private MoradorService service;

	@GetMapping("/buscarTodos")
	public List<Morador> buscarTodos() {
		return repository.findAll();
	}

	// @JsonView(DataTablesOutput.View.class)
	// @PostMapping("/listar")
	// public DataTablesOutput<Morador> listaMoradores(@Valid @RequestBody DataTablesInput input) {
	// 	DataTablesOutput<Morador> moradores = repository.findAll(input);

	// 	if (moradores.getError() != null) {
	// 		throw new IllegalArgumentException(moradores.getError());
	// 	}

	// 	DataTablesOutput<Morador> result = new DataTablesOutput<>();
	// 	result.setData(moradores.getData().stream().collect(Collectors.toList()));
	// 	result.setDraw(moradores.getDraw());
	// 	result.setError(moradores.getError());
	// 	result.setRecordsFiltered(moradores.getRecordsFiltered());
	// 	result.setRecordsTotal(moradores.getRecordsTotal());

	// 	return result;
	// }

	@GetMapping("/buscarPorId/{id}")
	public ResponseEntity<?> buscarPorId(@PathVariable Long id) {
		Morador morador = repository.findOne(id);

		return morador != null ? ResponseEntity.ok(morador) : ResponseEntity.notFound().build();
	}

	@PostMapping("/salvar")
	public ResponseEntity<?> salvar(@Valid @RequestBody Morador morador) {
		Morador moradorSalvo = repository.save(morador);

		return ResponseEntity.status(HttpStatus.CREATED).body(moradorSalvo);
	}

	@DeleteMapping("/deletarPorId/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void deletar(@PathVariable Long id) {
		repository.delete(id);
	}

	@PutMapping("/atualizar/{id}")
	public ResponseEntity<?> atualizar(@PathVariable Long id, @Valid @RequestBody Morador morador) {
		Morador moradorSalvo = service.atualizar(id, morador);

		return ResponseEntity.ok(moradorSalvo);
	}
}
