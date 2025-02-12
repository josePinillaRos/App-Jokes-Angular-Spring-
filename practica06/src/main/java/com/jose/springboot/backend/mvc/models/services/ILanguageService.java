package com.jose.springboot.backend.mvc.models.services;

import java.util.List;

import com.jose.springboot.backend.mvc.models.entity.Language;

/**
 * ILanguageService
 * Interfaz que define los métodos que implementará LanguageServiceImpl
 * 
 * @autor Jose Pinilla
 */
public interface ILanguageService {
	public List<Language> findAll();
	public Language findById(Integer id);
	public Language save(Language language);
	public void delete(Language language);
	public void deleteById(Integer id);
}
