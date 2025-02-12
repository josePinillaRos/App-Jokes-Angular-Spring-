package com.jose.springboot.backend.mvc.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jose.springboot.backend.mvc.models.dto.TypesDTO;
import com.jose.springboot.backend.mvc.models.entity.Types;
import com.jose.springboot.backend.mvc.models.services.ITypesService;

/**
 * class TypesRestController
 * Clase controlador que expone los servicios REST para los tipos del chiste
 * 
 * @autor Jose Pinilla
 */
@CrossOrigin(origins = { "*" })
@RestController
@RequestMapping("/types")
public class TypesRestController {

    @Autowired
    private ITypesService typesService;

    /**
     * Devuelve todos los tipos en formato DTO
     * 
     * @return List<TypesDTO>
     */
    @GetMapping({ "/", "" })
    public List<TypesDTO> allTypes() {
        // Obtiene todos los tipos desde el servicio y los convierte a DTO
        List<Types> types = typesService.findAll();
        return types.stream()
                .map(type -> new TypesDTO(type.getId(), type.getType()))
                .collect(Collectors.toList());
    }
    
    /**
     * Obtiene un tipo por su id
     * @param id del tipo a obtener
     * @return TypesDTO tipo obtenido
     */
    @GetMapping("/{id}")
    public ResponseEntity<?> getTypeById(@PathVariable Integer id) {
        Types type = typesService.findById(id);
        if (type == null) {
            Map<String, Object> response = new HashMap<>();
            response.put("mensaje", "El tipo con ID " + id + " no existe en la base de datos.");
            return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(new TypesDTO(type.getId(), type.getType()), HttpStatus.OK);
    }
}

