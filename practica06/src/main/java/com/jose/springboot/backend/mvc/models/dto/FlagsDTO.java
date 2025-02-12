package com.jose.springboot.backend.mvc.models.dto;

/**
 * FlagsDTO
 * Plantilla para mostrar los datos de las banderas
 * 
 * @autor Jose Pinilla
 */
public class FlagsDTO {

    private Integer id;

    private String name;


    public FlagsDTO() {
    }

    public FlagsDTO(Integer id, String name) {
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

