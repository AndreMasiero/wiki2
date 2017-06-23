package br.com.wiki.web.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.wiki.entity.Autor;
import br.com.wiki.entity.Usuario;
import br.com.wiki.entity.UsuarioLogado;
import br.com.wiki.service.AutorService;
import br.com.wiki.service.UsuarioService;
import br.com.wiki.util.TextosTela;

@Controller
@RequestMapping("autor")
public class AutorController {

	@Autowired
	private AutorService autorService;
	@Autowired
	private TextosTela textoTela;
	@Autowired
	private UsuarioService usuarioService;

	@RequestMapping(value = "/page/{page}", method = RequestMethod.GET)
	public ModelAndView pageAutores(@PathVariable("page") Integer pagina) {
		ModelAndView view = new ModelAndView("autor/perfil");

		Page<Autor> page = autorService.findByPagination(pagina - 1, 5);

		view.addObject("page", page);

		view.addObject("urlPagination", "/autor/page");
		

		return view;
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") Long id) {

		autorService.delete(id);

		return "redirect:/autor/list";
	}

	@RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
	public ModelAndView preUpdate(@PathVariable("id") Long id) {

		ModelAndView view = new ModelAndView();

		Autor autor = autorService.findById(id);

		view.addObject("autor", autor);
		view.addObject("titulo", textoTela.titulo());
		view.setViewName("autor/cadastro");

		return view;
	}

	@RequestMapping(value = { "/perfil/{id}", "/list" }, method = RequestMethod.GET)
	public ModelAndView getAutor(@PathVariable("id") Optional<Long> id) {

		ModelAndView view = new ModelAndView("autor/perfil");

		if (id.isPresent()) {

			Autor autor = autorService.findById(id.get());
			view.addObject("titulo", textoTela.titulo());
			view.addObject("autores", Arrays.asList(autor));
			view.addObject("urlPagination", "/autor/page");
		} else {

			// List<Autor> autores = autorService.findAll();
			// view.addObject("autores", autores);
			Page<Autor> page = autorService.findByPagination(0, 5);
			view.addObject("titulo", textoTela.titulo());
			view.addObject("page", page);
			view.addObject("urlPagination", "/autor/page");
		}

		return view;
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("autor") @Validated Autor autor, BindingResult result, @AuthenticationPrincipal UsuarioLogado logado) {

		if (result.hasErrors()) {

			return "autor/cadastro";
		}
		
		//pega o id do usuario logado para inserir no autor
		if(logado.getId() != null){
			Usuario usuario = usuarioService.findById(logado.getId());
			autor.setUsuario(usuario);
		}

		autorService.save(autor);

		return "redirect:/autor/perfil/" + autor.getId();
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView addAutor(@ModelAttribute("autor") Autor autor,
			@AuthenticationPrincipal() UsuarioLogado logado) {
		
		System.err.println(logado.getId());
		
		autor = autorService.findByUsuario(logado.getId());
		
		if(autor == null){
			return new ModelAndView("autor/cadastro");
		}
		
		return new ModelAndView("redirect:/autor/perfil/"+autor.getId());
	}
}
