package com.jose.springboot.backend.mvc.models.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jose.springboot.backend.mvc.models.dao.ILanguageDAO;
import com.jose.springboot.backend.mvc.models.entity.Language;

/**
 * LanguageServiceImpl
 * Implementa la interfaz ILanguageService
 * 
 * @autor Jose Pinilla
 */
@Service
public class LanguageServiceImpl implements ILanguageService {

	@Autowired
	private ILanguageDAO languageDAO;
	
	@Override
	@Transactional(readOnly = true)
	public List<Language> findAll() {
		return (List<Language>) languageDAO.findAll();
	}

	@Override
	@Transactional(readOnly = true)
	public Language findById(Integer id) {
		return languageDAO.findById(id).orElse(null);
	}
	
	@Override
	@Transactional
	public Language save(Language language) {
		return languageDAO.save(language);
	}

	@Override
	@Transactional
	public void delete(Language language) {
		languageDAO.delete(language);
		
	}

	@Override
	@Transactional
	public void deleteById(Integer id) {
		languageDAO.deleteById(id);
	}
}
