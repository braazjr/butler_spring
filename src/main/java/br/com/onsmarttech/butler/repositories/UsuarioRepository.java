package br.com.onsmarttech.butler.repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import br.com.onsmarttech.butler.models.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {

	@Query("select u from Usuario u where u.username = ?1")
	public Optional<Usuario> findByUsername(String username);

}
