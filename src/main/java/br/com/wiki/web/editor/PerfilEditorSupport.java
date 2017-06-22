package br.com.wiki.web.editor;

import java.beans.PropertyEditorSupport;

import br.com.wiki.entity.Perfil;

public class PerfilEditorSupport extends PropertyEditorSupport {

	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		if (text.equals("ADMIN")) {
			super.setValue(Perfil.ADMIN);
		} else if (text.equals("AUTOR")) {
			super.setValue(Perfil.AUTOR);
		} else {
			super.setValue(Perfil.LEITOR);
		}
	}

}
