package br.com.wiki.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import br.com.wiki.entity.Usuario;
import br.com.wiki.entity.UsuarioLogado;

@Service
public class UsuarioLogadoDetailService implements UserDetailsService {

	private static final Logger LOG = Logger.getLogger(UsuarioLogadoDetailService.class);

	@Autowired
	public UsuarioService usuarioService;

	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		Usuario usuario;

		try {
			usuario = usuarioService.findByEmail(username);
			LOG.info("Usuario encontrado: " + username);
		} catch (Exception e) {
			LOG.error("Usuario não encontrado: " + username);
			throw new UsernameNotFoundException("Usuário " + username + " não encontrado no sistema");
		}

		return new UsuarioLogado(usuario);
	}

}
