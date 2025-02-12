package com.jose.springboot.backend.mvc.models.dao;

import org.springframework.data.repository.CrudRepository;

import com.jose.springboot.backend.mvc.models.entity.Categories;

/**
 * interface ICategoriesDAO
 * Interfaz que extiende de CrudRepository para acceder a los métodos CRUD de la entidad Categories
 * 
 * @author Jose Pinilla
 */
public interface ICategoriesDAO extends CrudRepository<Categories, Integer>{

}
