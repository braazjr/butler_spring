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

import br.com.onsmarttech.butler.models.base.Noticia;
import br.com.onsmarttech.butler.repositories.NoticiaRepository;

@RestController
@RequestMapping("/noticia")
public class NoticiaController {
	
	@Autowired
	private NoticiaRepository repository;

	@GetMapping("/buscarTodos")
	public ResponseEntity<?> buscarTodos() {
		List<Noticia> noticias = repository.findAll();
		
		return noticias != null ? ResponseEntity.ok(noticias) : ResponseEntity.noContent().build();
	}

	@GetMapping("/buscarPorId/{idNoticia}")
	public ResponseEntity<?> buscarPorId(@PathVariable Long idNoticia) {
		Noticia noticia = repository.findOne(idNoticia);
		
		return noticia != null ? ResponseEntity.ok(noticia) : ResponseEntity.noContent().build();
	}

	@PostMapping("/salvar")
	public ResponseEntity<?> salvarNoticia(@Valid @RequestBody Noticia noticia) {
		Noticia noticiaSalva = repository.save(noticia);

		return ResponseEntity.status(HttpStatus.CREATED).body(noticiaSalva);
	}

	@DeleteMapping("/deletarPorID/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void deletar(@PathVariable Long id) {
		repository.delete(id);
	}	
}
