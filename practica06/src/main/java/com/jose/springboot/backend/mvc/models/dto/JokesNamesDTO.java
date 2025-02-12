package com.jose.springboot.backend.mvc.models.dto;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * DTO para la entidad Jokes.
 * Se exponen los nombres respectivos de los campos.
 * 
 * @autor Jose Pinilla
 */
public class JokesNamesDTO implements Serializable {

    private static final long serialVersionUID = 1L;

    private int id;
    private String categoryName;
    private String languageName;
    private String typeName;
    private String text1;
    private String text2;
    private Set<String> flagsNames = new HashSet<>();

    public JokesNamesDTO() {
    }

    public JokesNamesDTO(
            int id,
            String categoryName,
            String languageName,
            String typeName,
            String text1,
            String text2,
            Set<String> flagsNames
    ) {
        this.id = id;
        this.categoryName = categoryName;
        this.languageName = languageName;
        this.typeName = typeName;
        this.text1 = text1;
        this.text2 = text2;
        this.flagsNames = flagsNames;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getLanguageName() {
        return languageName;
    }

    public void setLanguageName(String languageName) {
        this.languageName = languageName;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
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

    public Set<String> getFlagsNames() {
        return flagsNames;
    }

    public void setFlagsNames(Set<String> flagsNames) {
        this.flagsNames = flagsNames;
    }

    @Override
    public String toString() {
        return "JokesDTO ["
            + "id=" + id
            + ", category=" + categoryName
            + ", language=" + languageName
            + ", type=" + typeName
            + ", text1=" + text1
            + ", text2=" + text2
            + ", flags=" + flagsNames
            + "]";
    }
}
