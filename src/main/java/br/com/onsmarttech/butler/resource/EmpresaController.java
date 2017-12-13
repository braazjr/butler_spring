package br.com.onsmarttech.butler.resource;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import br.com.onsmarttech.butler.models.Empresa;
import br.com.onsmarttech.butler.repositories.EmpresaRepository;
import br.com.onsmarttech.butler.service.EmpresaService;

@RestController
@RequestMapping("/empresas")
public class EmpresaController {

	@Autowired
	private EmpresaRepository repository;

	@Autowired
	private EmpresaService service;

	@GetMapping
	public ResponseEntity<List<Empresa>> listaEmpresas() {
		List<Empresa> empresas = repository.findAll();

		return empresas != null ? ResponseEntity.ok(empresas) : ResponseEntity.notFound().build();
	}

	@GetMapping("/{id}")
	public ResponseEntity<?> buscarEmpresaPorId(@PathVariable Long id) {
		Empresa empresa = repository.findOne(id);

		return empresa != null ? ResponseEntity.ok(empresa) : ResponseEntity.notFound().build();
	}

	@PostMapping
	public ResponseEntity<?> salvarEmpresa(@Valid Empresa empresa, BindingResult bindingResult) {
		Empresa empresaSalva = repository.save(empresa);

		if (bindingResult.hasErrors()) {
			return new ResponseEntity<List<ObjectError>>(bindingResult.getAllErrors(), HttpStatus.BAD_REQUEST);
		}

		return new ResponseEntity<Empresa>(empresaSalva, HttpStatus.OK);
	}

	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void deletar(@PathVariable Long id) {
		repository.delete(id);
	}

	@PutMapping("/{id}")
	public ResponseEntity<?> salvarEmpresa(@PathVariable Long id, @Valid Empresa empresa, BindingResult bindingResult) {
		Empresa empresaSalva = service.atualizar(id, empresa);

		return ResponseEntity.ok(empresaSalva);
	}
}
