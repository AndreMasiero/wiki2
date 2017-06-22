package br.com.wiki.util;

import org.springframework.stereotype.Service;

@Service
public class TextosTela {
	
	static final String TITULO = "Wiki Masa - Powered by André Masiero";
	
	public String titulo(){
		return TITULO;
	}

}
