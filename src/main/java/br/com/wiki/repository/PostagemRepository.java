package br.com.wiki.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import br.com.wiki.entity.Postagem;

public interface PostagemRepository extends JpaRepository<Postagem, Long> {

	Page<Postagem> findAllByOrderByDataPostagemDesc(Pageable pageable);

	Postagem findByPermalink(String permalink);

	List<Postagem> findByCategoriasPermalink(String link);

	List<Postagem> findByAutorNome(String nome);

	Page<Postagem> findAllByCategoriasPermalinkOrderByDataPostagemDesc(Pageable pageable, String permalink);

	Page<Postagem> findAllByAutorIdOrderByDataPostagemDesc(Pageable pageable, Long id);

	Page<Postagem> findByTextoContainingIgnoreCaseOrderByDataPostagemDesc(String texto, Pageable pageable);

	Page<Postagem> findAllByTituloContainingIgnoreCaseOrderByDataPostagemDesc(Pageable pageable, String titulo);

	@Transactional(readOnly = false)
	@Query(value = "SELECT * FROM postagens p, categorias c, postagens_has_categorias pc WHERE p.id = pc.postagem_id AND c.id = pc.categoria_id order by p.titlo asc", nativeQuery = true)
	List<Postagem> findAllByCategoria();

	Page<Postagem> findAllByAutorIdAndTituloContainingIgnoreCaseOrderByDataPostagemDesc(Pageable pageable, Long id,
			String titulo);

}
