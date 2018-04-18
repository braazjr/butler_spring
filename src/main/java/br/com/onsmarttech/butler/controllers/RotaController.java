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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import br.com.onsmarttech.butler.models.buscontrol.Rota;
import br.com.onsmarttech.butler.repositories.RotaRepository;

@RestController
@RequestMapping("/rota")
public class RotaController {
	
	@Autowired
	private RotaRepository repository;

	@GetMapping
	public ResponseEntity<?> buscarRotas() {
		List<Rota> rotas = repository.findAll();
		
		return rotas != null ? ResponseEntity.ok(rotas) : ResponseEntity.noContent().build();
	}

	@PostMapping
	public ResponseEntity<?> salvarRota(@Valid @RequestBody Rota rota) {
		Rota rotaSalva = repository.save(rota);

		return ResponseEntity.status(HttpStatus.CREATED).body(rotaSalva);
	}

	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void deletar(@PathVariable Integer id) {
		repository.delete(id);
	}	
}
