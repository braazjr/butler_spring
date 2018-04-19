package br.com.onsmarttech.butler.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.onsmarttech.butler.models.base.Noticia;

@Repository
public interface NoticiaRepository extends JpaRepository<Noticia, Long> {

}
