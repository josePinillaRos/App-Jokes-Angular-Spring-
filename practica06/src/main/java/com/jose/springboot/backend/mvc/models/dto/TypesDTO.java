package com.jose.springboot.backend.mvc.models.dto;

/**
 * TypesDTO
 * Plantilla para mostrar los datos de los tipos
 * 
 * @autor Jose Pinilla
 */
public class TypesDTO {
    private Integer id;

    private String name;


    public TypesDTO() {
    }

    public TypesDTO(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
