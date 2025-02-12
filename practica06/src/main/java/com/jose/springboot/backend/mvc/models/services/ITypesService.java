package com.jose.springboot.backend.mvc.models.services;

import java.util.List;

import com.jose.springboot.backend.mvc.models.entity.Types;

/**
 * ITypesService
 * Interfaz que define los métodos que implementará TypesServiceImpl
 * 
 * @autor Jose Pinilla
 */
public interface ITypesService {
	public List<Types> findAll();
	public Types findById(Integer id);
	public Types save(Types types);
	public void delete(Types types);
	public void deleteById(Integer id);
}
