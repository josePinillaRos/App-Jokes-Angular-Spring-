package com.jose.springboot.backend.mvc.models.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jose.springboot.backend.mvc.models.dao.ICategoriesDAO;
import com.jose.springboot.backend.mvc.models.entity.Categories;

/**
 * CategoriesServiceImpl
 * Implementa la interfaz ICategoriesService
 * 
 * @autor Jose Pinilla
 */
@Service
public class CategoriesServiceImpl implements ICategoriesService {

	@Autowired
	private ICategoriesDAO categoriesDAO;
	
	@Override
	@Transactional(readOnly = true)
	public List<Categories> findAll() {
		return (List<Categories>) categoriesDAO.findAll();
	}

	@Override
	@Transactional(readOnly = true)
	public Categories findById(Integer id) {
		return categoriesDAO.findById(id).orElse(null);
	}
	
	@Override
	@Transactional
	public Categories save(Categories categories) {
		return categoriesDAO.save(categories);
	}

	@Override
	@Transactional
	public void delete(Categories categories) {
		categoriesDAO.delete(categories);
		
	}

	@Override
	@Transactional
	public void deleteById(Integer id) {
		categoriesDAO.deleteById(id);
	}
}
