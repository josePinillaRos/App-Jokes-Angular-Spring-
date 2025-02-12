package com.jose.springboot.backend.mvc.models.dao;

import org.springframework.data.repository.CrudRepository;

import com.jose.springboot.backend.mvc.models.entity.Flags;

/**
 * interface IFlagsDAO
 * Interfaz que extiende de CrudRepository para acceder a los métodos CRUD de la entidad Flags
 * 
 * @author Jose Pinilla
 */
public interface IFlagsDAO extends CrudRepository<Flags, Integer> {

}
