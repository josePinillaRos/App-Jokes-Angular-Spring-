package com.jose.springboot.backend.mvc.models.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jose.springboot.backend.mvc.models.dao.ITypesDAO;
import com.jose.springboot.backend.mvc.models.entity.Types;
/**
 * TypesServiceImpl
 * Implementa la interfaz ITypesService
 * 
 * @autor Jose Pinilla
 */
@Service
public class TypesServiceImpl implements ITypesService {
	
	@Autowired
	private ITypesDAO typesDAO;
	
	@Override
	@Transactional(readOnly = true)
	public List<Types> findAll() {
		return (List<Types>) typesDAO.findAll();
	}

	@Override
	@Transactional(readOnly = true)
	public Types findById(Integer id) {
		return typesDAO.findById(id).orElse(null);
	}
	
	@Override
	@Transactional
	public Types save(Types types) {
		return typesDAO.save(types);
	}

	@Override
	@Transactional
	public void delete(Types types) {
		typesDAO.delete(types);
	}

	@Override
	@Transactional
	public void deleteById(Integer id) {
		typesDAO.deleteById(id);
	}
	
}
