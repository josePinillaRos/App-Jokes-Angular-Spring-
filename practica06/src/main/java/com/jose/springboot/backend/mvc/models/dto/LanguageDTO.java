package com.jose.springboot.backend.mvc.models.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

/**
 * LanguageDTO
 * Plantilla para mostrar los datos de los idiomas
 * 
 * @autor Jose Pinilla
 */
public class LanguageDTO {
	private Integer id;

	 @NotBlank(message = "El nombre no puede estar vacío.")
    private String name;
    
    @NotBlank(message = "El código no puede estar vacío.")
    @Size(min = 2, max = 2, message = "El código debe tener exactamente 2 caracteres.")
    private String code;


    public LanguageDTO() {
    }

    public LanguageDTO(Integer id, String name, String code) {
        this.id = id;
        this.name = name;
        this.code = code;
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
    
	public String getCode() {
		return code;
	}
	
	public void setCode(String code) {
		this.code = code;
	}
}
