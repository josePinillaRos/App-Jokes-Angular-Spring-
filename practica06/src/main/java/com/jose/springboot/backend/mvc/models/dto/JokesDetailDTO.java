package com.jose.springboot.backend.mvc.models.dto;

import java.util.List;

/**
 * JokesDetailDTO
 * Plantilla para mostrar los datos de los chistes
 * 
 * @autor Jose Pinilla
 */
public class JokesDetailDTO {
    private int id;
    private Integer categoryId;
    private String categoryName;
    private Integer languageId;
    private String languageName;
    private Integer typeId;
    private String typeName;
    private List<Integer> flagsIds;
    private List<String> flagsNames;
    private String text1;
    private String text2;

    public JokesDetailDTO() { }

    public JokesDetailDTO(int id,
                          Integer categoryId,
                          String categoryName,
                          Integer languageId,
                          String languageName,
                          Integer typeId,
                          String typeName,
                          List<Integer> flagsIds,
                          List<String> flagsNames,
                          String text1,
                          String text2) {
        this.id = id;
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.languageId = languageId;
        this.languageName = languageName;
        this.typeId = typeId;
        this.typeName = typeName;
        this.flagsIds = flagsIds;
        this.flagsNames = flagsNames;
        this.text1 = text1;
        this.text2 = text2;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public Integer getLanguageId() {
        return languageId;
    }

    public void setLanguageId(Integer languageId) {
        this.languageId = languageId;
    }

    public String getLanguageName() {
        return languageName;
    }

    public void setLanguageName(String languageName) {
        this.languageName = languageName;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public List<Integer> getFlagsIds() {
        return flagsIds;
    }

    public void setFlagsIds(List<Integer> flagsIds) {
        this.flagsIds = flagsIds;
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

	public List<String> getFlagsNames() {
		return flagsNames;
	}

	public void setFlagsNames(List<String> flagsNames) {
		this.flagsNames = flagsNames;
	}
}