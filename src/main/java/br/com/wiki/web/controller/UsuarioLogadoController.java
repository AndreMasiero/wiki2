package br.com.wiki.web.controller;

import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import br.com.wiki.entity.UsuarioLogado;

@ControllerAdvice
public class UsuarioLogadoController {

	@ModelAttribute("logado")//logado é o atributo que terei acesso ao objeto logado(${lohado.email} por exemplo
	public UsuarioLogado getUsuarioLogado(Authentication authentication) {
		
		//se logado, colca a variavel UsuarioLogado no contexto da aplicação
		//para que se tenha acesso a qualquer momento este objeto usuario, em qualquer pagina, 
		return (authentication == null) ? null : (UsuarioLogado) authentication.getPrincipal();
	}
}
