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

import br.com.onsmarttech.butler.models.buscontrol.Viagem;
import br.com.onsmarttech.butler.repositories.ViagemRepository;

@RestController
@RequestMapping("/viagem")
public class ViagemController {
	
	@Autowired
	private ViagemRepository repository;

	@GetMapping
	public ResponseEntity<?> buscarViagens() {
		List<Viagem> viagens = repository.findAll();
		
		return viagens != null ? ResponseEntity.ok(viagens) : ResponseEntity.noContent().build();
	}

	@GetMapping("/comPassageiros")
	public ResponseEntity<?> buscarViagensComPassageiros() {
		List<Viagem> viagens = repository.buscarViagensComPassageiros();
		
		return viagens != null ? ResponseEntity.ok(viagens) : ResponseEntity.noContent().build();
	}

	@PostMapping
	public ResponseEntity<?> salvarViagem(@Valid @RequestBody Viagem viagem) {
		Viagem viagemSalva = repository.save(viagem);

		return ResponseEntity.status(HttpStatus.CREATED).body(viagemSalva);
	}

	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void deletar(@PathVariable Integer id) {
		repository.delete(id);
	}	
}
