package br.com.wiki.util;

import java.text.Normalizer;

public class MyReplaceString {

	public static String formatarPermalink(String value) {

		// Persintêcia com JPA! -> persintecia_com_jpa
		String link = value.trim();

		link = link.toLowerCase();

		link = Normalizer.normalize(link, Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "");

		link = link.replaceAll("\\s", "_");

		link = link.replaceAll("\\_+", "_");

		link = link.replaceAll("\\W", "");

		return link;

	}

}
