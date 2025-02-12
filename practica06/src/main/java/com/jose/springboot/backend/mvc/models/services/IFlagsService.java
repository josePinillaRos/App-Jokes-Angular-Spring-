package com.jose.springboot.backend.mvc.models.services;

import java.util.List;

import com.jose.springboot.backend.mvc.models.entity.Flags;

/**
 * IFlagsService
 * Interfaz que define los métodos que implementará FlagsServiceImpl
 * 
 * @autor Jose Pinilla
 */
public interface IFlagsService {
	public List<Flags> findAll();
	public Flags findById(Integer id);
	public Flags save(Flags flags);
	public void delete(Flags flags);
	public void deleteById(Integer id);
	public int countJokesByFlagId(Integer id);
}
