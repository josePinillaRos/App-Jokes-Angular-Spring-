package com.jose.springboot.backend.mvc.models.services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jose.springboot.backend.mvc.models.dao.IFlagsDAO;
import com.jose.springboot.backend.mvc.models.entity.Flags;

/**
 * FlagsServiceImpl
 * Implementa la interfaz IFlagsService
 * 
 * @autor Jose Pinilla
 */
@Service
public class FlagsServiceImpl implements IFlagsService {

    @Autowired
    private IFlagsDAO flagsDAO;
    
    @Override
    @Transactional(readOnly = true)
    public List<Flags> findAll() {
        return (List<Flags>) flagsDAO.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public Flags findById(Integer id) {
        return flagsDAO.findById(id).orElse(null);
    }

    @Override
    @Transactional
    public Flags save(Flags flags) {
        return flagsDAO.save(flags);
    }

    @Override
    @Transactional
    public void delete(Flags flags) {
        flagsDAO.delete(flags);
    }

    @Override
    @Transactional
    public void deleteById(Integer id) {
        Flags flag = flagsDAO.findById(id).orElse(null);

        if (flag != null) {
            flagsDAO.delete(flag);
        } else {
            throw new IllegalArgumentException("Flag con ID " + id + " no existe.");
        }
    }



	@Override
	@Transactional(readOnly = true)
	public int countJokesByFlagId(Integer id) {
		Flags flag = flagsDAO.findById(id).orElse(null);
	    return (flag != null && flag.getJokeses() != null) ? flag.getJokeses().size() : 0;
	}
}
