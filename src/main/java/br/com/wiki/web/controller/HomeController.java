package br.com.wiki.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

import br.com.wiki.entity.Categoria;
import br.com.wiki.entity.Comentario;
import br.com.wiki.entity.Postagem;
import br.com.wiki.service.CategoriaService;
import br.com.wiki.service.PostagemService;
import br.com.wiki.util.TextosTela;

@Controller
public class HomeController {

	@Autowired
	private PostagemService postagemService;

	@Autowired
	private TextosTela textoTela;

	@Autowired
	private CategoriaService categoriaService;

	@RequestMapping(value = "/search/texto/{texto}/page/{page}", method = RequestMethod.GET)
	public ModelAndView search(@PathVariable("texto") String texto, @PathVariable("page") Integer pagina,
			ModelMap model) {

		Page<Postagem> page = postagemService.findByTexto(pagina - 1, 5, texto);
		List<Categoria> categoria = categoriaService.findAll();

		model.addAttribute("page", page);
		if (texto.equals("")) {
			model.addAttribute("titulo", textoTela.titulo());
			model.addAttribute("menuCategorias", categoria);
			model.addAttribute("urlPagination", "/search/texto/" + texto + "/page");
		} else {
			model.addAttribute("titulo", textoTela.titulo());
			model.addAttribute("menuCategorias", categoria);
			model.addAttribute("urlPagination", "/page");
		}

		return new ModelAndView("posts", model);
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView search(@RequestParam("texto") String texto, ModelMap model) {

		Page<Postagem> page = postagemService.findByTexto(0, 5, texto);
		List<Categoria> categoria = categoriaService.findAll();

		model.addAttribute("page", page);
		if (texto.equals("")) {
			model.addAttribute("titulo", textoTela.titulo());
			model.addAttribute("menuCategorias", categoria);
			model.addAttribute("urlPagination", "/page");
		} else {
			model.addAttribute("titulo", textoTela.titulo());
			model.addAttribute("menuCategorias", categoria);
			model.addAttribute("urlPagination", "/search/texto/" + texto + "/page");
		}

		return new ModelAndView("posts", model);
	}

	@RequestMapping(value = "/{permalink}", method = RequestMethod.GET)
	public ModelAndView openPostagem(@ModelAttribute("comentario") Comentario comentario,
			@PathVariable("permalink") String permalink, ModelMap model) throws NoHandlerFoundException {

		Postagem postagem = postagemService.findByPermalink(permalink);
		List<Categoria> categoria = categoriaService.findAll();

		if (postagem == null) {
			throw new NoHandlerFoundException(null, null, null);
		}

		model.addAttribute("postagem", postagem);
		model.addAttribute("menuCategorias", categoria);
		model.addAttribute("titulo", textoTela.titulo());

		return new ModelAndView("post", model);

	}

	@RequestMapping(value = "/autor/{id}/page/{page}", method = RequestMethod.GET)
	public ModelAndView postsByAutor(@PathVariable("id") Long id, @PathVariable("page") Integer pagina,
			ModelMap model) {

		// List<Postagem> postagens = postagemService.findByAutor(nome);//
		// model.addAttribute("postagens", postagens);
		List<Categoria> categoria = categoriaService.findAll();

		Page<Postagem> page = postagemService.findByPaginationByAutor(pagina - 1, 5, id);
		model.addAttribute("page", page);
		model.addAttribute("menuCategorias", categoria);
		model.addAttribute("titulo", textoTela.titulo());
		model.addAttribute("urlPagination", "/autor/" + id + "/page");

		return new ModelAndView("posts", model);
	}

	@RequestMapping(value = "/page/{page}", method = RequestMethod.GET)
	public ModelAndView pageHome(@PathVariable("page") Integer pagina, ModelMap model) throws NoHandlerFoundException {

		Page<Postagem> page = postagemService.findByPagination(pagina - 1, 5);
		List<Categoria> categoria = categoriaService.findAll();

		if (page.getContent().isEmpty()) {
			throw new NoHandlerFoundException(null, null, null);
		}

		model.addAttribute("page", page);
		model.addAttribute("menuCategorias", categoria);
		model.addAttribute("titulo", textoTela.titulo());
		model.addAttribute("urlPagination", "/page");

		return new ModelAndView("posts", model);
	}

	@RequestMapping(value = "/categoria/{link}/page/{page}", method = RequestMethod.GET)
	public ModelAndView postsByCategoria(@PathVariable("page") Integer pagina, @PathVariable("link") String link,
			ModelMap model) {

		// List<Postagem> postagens = postagemService.findByCategoria(link);
		// model.addAttribute("postagens", postagens);
		List<Categoria> categoria = categoriaService.findAll();

		Page<Postagem> page = postagemService.findByPaginationByCategoria(pagina - 1, 5, link);
		model.addAttribute("page", page);
		model.addAttribute("menuCategorias", categoria);
		model.addAttribute("titulo", textoTela.titulo());
		model.addAttribute("urlPagination", "/categoria/" + link + "/page");

		return new ModelAndView("posts", model);
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(ModelMap model) {

		// List<Postagem> postagens = postagemService.findAll();
		// model.addAttribute("postagens", postagens);

		List<Categoria> categoria = categoriaService.findAll();
		Page<Postagem> page = postagemService.findByPagination(0, 5);

		model.addAttribute("page", page);
		model.addAttribute("menuCategorias", categoria);
		model.addAttribute("urlPagination", "/page");
		model.addAttribute("titulo", textoTela.titulo());

		return new ModelAndView("posts", model);
	}

	@RequestMapping(value = "/categoria/{link}", method = RequestMethod.GET)
	public ModelAndView postsByCategoria(@PathVariable("link") String link, ModelMap model) {

		// List<Postagem> postagens = postagemService.findByCategoria(link);
		// model.addAttribute("postagens", postagens);
		List<Categoria> categoria = categoriaService.findAll();

		Page<Postagem> page = postagemService.findByPaginationByCategoria(0, 5, link);
		model.addAttribute("page", page);
		model.addAttribute("menuCategorias", categoria);
		model.addAttribute("titulo", textoTela.titulo());
		model.addAttribute("urlPagination", "/categoria/" + link + "/page");

		return new ModelAndView("posts", model);
	}

}
