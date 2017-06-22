package br.com.wiki.web.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import br.com.wiki.entity.Avatar;

public class AvatarValidator implements Validator {

	public boolean supports(Class<?> clazz) {
		
		return Avatar.class.equals(clazz);
	}

	public void validate(Object target, Errors errors) {
		
		Avatar avatar = (Avatar) target;
		
		if(avatar.getFile() != null){
			
			if(avatar.getFile().getSize() == 0){
				
				errors.rejectValue("file", "file", "Você deve selecionar uma imagem para seu avatar(até 100 kb)!");
			}
		}
	}

}
