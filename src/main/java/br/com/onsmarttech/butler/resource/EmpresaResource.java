package br.com.onsmarttech.butler.resource;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
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
@RequestMapping("/empresas")
public class EmpresaResource {

	@Autowired
	private EmpresaRepository repository;

	@Autowired
	private EmpresaService service;

	@GetMapping
	@PreAuthorize("hasAuthority('ROLE_SISTEMAS_READ') or hasAuthority('ROLE_SISTEMAS_WRITE')")
	public Page<Empresa> listaEmpresas(Pageable pageable) {
		return repository.findAll(pageable);
	}

	@GetMapping("/{id}")
	@PreAuthorize("hasAuthority('ROLE_SISTEMAS_READ') or hasAuthority('ROLE_SISTEMAS_WRITE')")
	public ResponseEntity<?> buscarEmpresaPorId(@PathVariable Long id) {
		Empresa empresa = repository.findOne(id);

		return empresa != null ? ResponseEntity.ok(empresa) : ResponseEntity.notFound().build();
	}

	@PostMapping
	@PreAuthorize("hasAuthority('ROLE_SISTEMAS_WRITE')")
	public ResponseEntity<?> salvarEmpresa(@Valid @RequestBody Empresa empresa) {
		Empresa empresaSalva = repository.save(empresa);

		return ResponseEntity.status(HttpStatus.CREATED).body(empresaSalva);
	}

	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@PreAuthorize("hasAuthority('ROLE_SISTEMAS_WRITE')")
	public void deletar(@PathVariable Long id) {
		repository.delete(id);
	}

	@PutMapping("/{id}")
	@PreAuthorize("hasAuthority('ROLE_SISTEMAS_WRITE')")
	public ResponseEntity<?> atualizarEmpresa(@PathVariable Long id, @Valid @RequestBody Empresa empresa) {
		Empresa empresaSalva = service.atualizar(id, empresa);

		return ResponseEntity.ok(empresaSalva);
	}
}
