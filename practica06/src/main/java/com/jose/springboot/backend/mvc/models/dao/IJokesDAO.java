package com.jose.springboot.backend.mvc.models.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.jose.springboot.backend.mvc.models.entity.Jokes;

/**
 * Interface de Jokes DAO
 * Accede e los metodos de la clase CrudRepository para acceder a la tabla Jokes
 * 
 * @author Jose Pinilla
 */
public interface IJokesDAO extends CrudRepository<Jokes, Integer> {
	List<Jokes> findByCategoriesId(Integer categoryId);
	List<Jokes> findByLanguageId(Integer languageId);
}
