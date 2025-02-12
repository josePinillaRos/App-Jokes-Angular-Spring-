package com.jose.springboot.backend.mvc.models.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jose.springboot.backend.mvc.models.dao.IJokesDAO;
import com.jose.springboot.backend.mvc.models.entity.Jokes;

/**
 * JokesServiceImpl
 * Implementa la interfaz IJokesService
 * 
 * @autor Jose Pinilla
 */
@Service
public class JokesServiceImpl implements IJokesService {

	@Autowired
	private IJokesDAO jokesDAO;
	
	@Override
	@Transactional(readOnly = true)
	public List<Jokes> findAll() {
		return (List<Jokes>) jokesDAO.findAll();
	}

	@Override
	@Transactional(readOnly = true)
	public Jokes findById(Integer id) {
		return jokesDAO.findById(id).orElse(null);
	}
	
	@Override
	@Transactional
	public Jokes save(Jokes jokes) {
		return jokesDAO.save(jokes);
	}

	@Override
	@Transactional
	public void delete(Jokes jokes) {
		jokesDAO.delete(jokes);
		
	}

	@Override
	@Transactional
	public void deleteById(Integer id) {
		jokesDAO.deleteById(id);
	}

	@Override
	public List<Jokes> findByCategoryId(Integer categoryId) {
		return jokesDAO.findByCategoriesId(categoryId);
	}

	@Override
	public List<Jokes> findByLanguageId(Integer languageId) {
		return jokesDAO.findByLanguageId(languageId);
	}
}
