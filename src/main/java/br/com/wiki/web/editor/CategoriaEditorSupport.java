package br.com.wiki.web.editor;

import java.util.Collection;

import org.springframework.beans.propertyeditors.CustomCollectionEditor;

import br.com.wiki.entity.Categoria;
import br.com.wiki.service.CategoriaService;

public class CategoriaEditorSupport extends CustomCollectionEditor {

	private CategoriaService service;

	public CategoriaEditorSupport(Class<? extends Collection> collectionType, CategoriaService service) {
		super(collectionType);
		this.service = service;
	}

	@Override
	protected Object convertElement(Object element) {

		// faz um cast de element para string e na sequencia o converte em Long
		Long id = Long.valueOf((String) element);

		Categoria categoria = service.findById(id);

		return super.convertElement(categoria);
	}

}
