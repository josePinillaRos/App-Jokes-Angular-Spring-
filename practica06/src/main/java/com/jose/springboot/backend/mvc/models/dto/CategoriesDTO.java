package com.jose.springboot.backend.mvc.models.dto;

/**
 * CategoriesDTO
 * Plantilla para mostrar los datos de las categorias
 * 
 * @autor Jose Pinilla
 */
public class CategoriesDTO {
    private Integer id;

    private String name;


    public CategoriesDTO() {
    }

    public CategoriesDTO(Integer id, String name) {
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
