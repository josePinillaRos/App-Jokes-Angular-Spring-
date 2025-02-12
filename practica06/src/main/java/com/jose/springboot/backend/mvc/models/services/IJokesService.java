package com.jose.springboot.backend.mvc.models.services;

import java.util.List;

import com.jose.springboot.backend.mvc.models.entity.Jokes;

/**
 * IJokesService
 * Interfaz que define los métodos que implementará JokesServiceImpl
 * 
 * @autor Jose Pinilla
 */
public interface IJokesService {
	public List<Jokes> findAll();
	public Jokes findById(Integer id);
	public Jokes save(Jokes jokes);
	public void delete(Jokes jokes);
	public void deleteById(Integer id);
	List<Jokes> findByCategoryId(Integer categoryId);
	List<Jokes> findByLanguageId(Integer languageId);
}
