package br.com.wiki.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.wiki.entity.Categoria;
import br.com.wiki.service.CategoriaService;
import br.com.wiki.util.TextosTela;

@Controller
@RequestMapping("categoria")
public class CategoriaController {

	@Autowired
	private CategoriaService service;
	@Autowired
	private TextosTela textoTela;

	@RequestMapping(value = "/page/{page}", method = RequestMethod.GET)
	public ModelAndView pageCategorias(@PathVariable("page") Integer pagina,
			@ModelAttribute("categoria") Categoria value) {

		ModelAndView view = new ModelAndView("categoria/cadastro");

		Page<Categoria> page = service.findByPagination(pagina - 1, 5);

		view.addObject("titulo", textoTela.titulo());
		view.addObject("page", page);

		return view;
	}

	@RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
	public ModelAndView preUpdate(@PathVariable("id") Long id, ModelMap model) {

		Categoria categoria = service.findById(id);

		model.addAttribute("categoria", categoria);
		Page<Categoria> page = service.findByPagination(0, 5);
		model.addAttribute("page", page);
		// model.addAttribute("categorias", service.findAll());

		return new ModelAndView("categoria/cadastro", model);
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") Long id) {

		service.delete(id);

		return "redirect:/categoria/add";

	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("categoria") @Validated Categoria categoria, BindingResult result) {
		ModelAndView view = new ModelAndView();
		if (result.hasErrors()) {

			Page<Categoria> page = service.findByPagination(0, 5);

			view.addObject("page", page);
			view.addObject("titulo", textoTela.titulo());
			view.addObject("urlPagination", "/categoria/page");
			view.setViewName("categoria/cadastro");
			return view;
		}
		service.saveOrUpdate(categoria);

		view.setViewName("redirect:/categoria/add");
		return view;

	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView cadastro(@ModelAttribute("categoria") Categoria categoria) {

		ModelAndView view = new ModelAndView();

		Page<Categoria> page = service.findByPagination(0, 5);

		// view.addObject("categorias", service.findAll());
		view.addObject("page", page);
		view.addObject("titulo", textoTela.titulo());
		view.setViewName("categoria/cadastro");

		return view;

	}

}
