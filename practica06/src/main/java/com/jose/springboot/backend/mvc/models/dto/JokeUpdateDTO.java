package com.jose.springboot.backend.mvc.models.dto;

import java.util.List;

/**
 * JokeUpdateDTO
 * Plantilla para actualizar los datos de los chistes
 * 
 * @autor Jose Pinilla
 */
public class JokeUpdateDTO {
	private Integer id;
    private Integer categoryId;
    private Integer languageId;
    private Integer typeId;
    private String text1;
    private String text2;
    private List<Integer> flagses; // Lista de IDs de Flags seleccionados

    public JokeUpdateDTO() {
    }

    public JokeUpdateDTO(Integer id, Integer categoryId, Integer languageId, Integer typeId, String text1, String text2, List<Integer> flagses) {
        this.id = id;
        this.categoryId = categoryId;
        this.languageId = languageId;
        this.typeId = typeId;
        this.text1 = text1;
        this.text2 = text2;
        this.flagses = flagses;
    }

    // Getters y Setters
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Integer getLanguageId() {
        return languageId;
    }

    public void setLanguageId(Integer languageId) {
        this.languageId = languageId;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getText1() {
        return text1;
    }

    public void setText1(String text1) {
        this.text1 = text1;
    }

    public String getText2() {
        return text2;
    }

    public void setText2(String text2) {
        this.text2 = text2;
    }

    public List<Integer> getFlagses() {
        return flagses;
    }

    public void setFlagses(List<Integer> flagses) {
        this.flagses = flagses;
    }
}
