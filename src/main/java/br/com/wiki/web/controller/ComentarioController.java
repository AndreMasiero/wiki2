package br.com.wiki.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.com.wiki.entity.Comentario;
import br.com.wiki.entity.Postagem;
import br.com.wiki.entity.UsuarioLogado;
import br.com.wiki.service.ComentarioService;
import br.com.wiki.service.PostagemService;
import br.com.wiki.service.UsuarioService;

@Controller
@RequestMapping("comentario")
public class ComentarioController {

	@Autowired
	private ComentarioService comentarioService;
	@Autowired
	private PostagemService postagemService;
	@Autowired
	private UsuarioService usuarioService;

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("comentario") @Validated Comentario comentario, BindingResult result,
			@RequestParam("permalink") String permalink,
			@AuthenticationPrincipal UsuarioLogado logado) {

		ModelAndView view = new ModelAndView();

		Postagem postagem = postagemService.findByPermalink(permalink);

		if (result.hasErrors()) {

			return new ModelAndView("post", "postagem", postagem);
		}
		
		comentario.setUsuario(usuarioService.findById(logado.getId()));

		comentario.setPostagem(postagem);

		comentarioService.save(comentario);

		return new ModelAndView("redirect:/" + permalink);
	}
}