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

import br.com.onsmarttech.butler.models.buscontrol.ViagemResidente;
import br.com.onsmarttech.butler.repositories.ViagemResidenteRepository;

@RestController
@RequestMapping("/viagemResidente")
public class ViagemResidenteController {
	
	@Autowired
	private ViagemResidenteRepository repository;

	@GetMapping
	public ResponseEntity<?> buscarViagemResidentes() {
		List<ViagemResidente> viagemResidentes = repository.findAll();
		
		return viagemResidentes != null ? ResponseEntity.ok(viagemResidentes) : ResponseEntity.noContent().build();
	}

	@GetMapping("/{idViagem}")
	public ResponseEntity<?> buscarViagemResidentesPorViagem(@PathVariable Integer idViagem) {
		List<ViagemResidente> viagemResidentes = repository.buscarViagemResidentesPorViagem(idViagem);
		
		return viagemResidentes != null ? ResponseEntity.ok(viagemResidentes) : ResponseEntity.noContent().build();
	}

	@PostMapping
	public ResponseEntity<?> salvarViagemResidente(@Valid @RequestBody ViagemResidente viagemResidente) {
		ViagemResidente viagemResidenteSalva = repository.save(viagemResidente);

		return ResponseEntity.status(HttpStatus.CREATED).body(viagemResidenteSalva);
	}

	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void deletar(@PathVariable Integer id) {
		repository.delete(id);
	}	
}
