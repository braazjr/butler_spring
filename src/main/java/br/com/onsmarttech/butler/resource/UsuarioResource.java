package br.com.onsmarttech.butler.resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.onsmarttech.butler.models.security.Usuario;
import br.com.onsmarttech.butler.repositories.UsuarioRepository;

@RestController
@RequestMapping("/usuario")
public class UsuarioResource {
	
	@Autowired
	private UsuarioRepository repository;

	@GetMapping("/{login}")
//	@PreAuthorize("hasAuthority('ROLE_SISTEMAS_READ') or hasAuthority('ROLE_SISTEMAS_WRITE')")
	public ResponseEntity<?> buscarUsuarioPorLogin(@PathVariable String login) {
		Usuario usuario = repository.findByLogin(login).get();

		return usuario != null ? ResponseEntity.ok(usuario) : ResponseEntity.notFound().build();
	}

}
