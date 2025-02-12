package com.jose.springboot.backend.mvc.models.services;

import java.util.List;

import com.jose.springboot.backend.mvc.models.entity.Categories;

/**
 * ICategoriesService
 * Interfaz que define los métodos que implementará CategoriesServiceImpl
 * 
 * @autor Jose Pinilla
 */
public interface ICategoriesService {
	public List<Categories> findAll();
	public Categories findById(Integer id);
	public Categories save(Categories categories);
	public void delete(Categories categories);
	public void deleteById(Integer id);
}
