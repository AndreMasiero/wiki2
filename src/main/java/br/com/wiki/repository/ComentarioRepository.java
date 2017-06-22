package br.com.wiki.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.wiki.entity.Comentario;

public interface ComentarioRepository extends JpaRepository<Comentario, Long> {

}
