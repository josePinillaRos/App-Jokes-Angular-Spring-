package com.jose.springboot.backend.mvc.models.dao;

import org.springframework.data.repository.CrudRepository;

import com.jose.springboot.backend.mvc.models.entity.Language;

/**
 * interface ILanguageDAO
 * Accede a los datos de la tabla language de la base de datos
 * 
 * @autor Jose Pinilla
 */
public interface ILanguageDAO extends CrudRepository<Language, Integer> {

}
