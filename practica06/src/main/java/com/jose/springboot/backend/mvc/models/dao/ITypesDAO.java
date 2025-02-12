package com.jose.springboot.backend.mvc.models.dao;

import org.springframework.data.repository.CrudRepository;

import com.jose.springboot.backend.mvc.models.entity.Types;

/**
 * intertface ITypesDAO
 * Accede a la base de datos y realiza operaciones CRUD de la tabla Types
 * 
 * @autor Jose Pinilla
 */
public interface ITypesDAO extends CrudRepository<Types, Integer> {

}
