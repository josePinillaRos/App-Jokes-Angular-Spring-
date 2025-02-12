package com.jose.springboot.backend.mvc.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jose.springboot.backend.mvc.models.dto.JokeUpdateDTO;
import com.jose.springboot.backend.mvc.models.dto.JokesNamesDTO;
import com.jose.springboot.backend.mvc.models.entity.Categories;
import com.jose.springboot.backend.mvc.models.entity.Flags;
import com.jose.springboot.backend.mvc.models.entity.Jokes;
import com.jose.springboot.backend.mvc.models.entity.Language;
import com.jose.springboot.backend.mvc.models.entity.Types;
import com.jose.springboot.backend.mvc.models.services.ICategoriesService;
import com.jose.springboot.backend.mvc.models.services.IFlagsService;
import com.jose.springboot.backend.mvc.models.services.IJokesService;
import com.jose.springboot.backend.mvc.models.services.ILanguageService;
import com.jose.springboot.backend.mvc.models.services.ITypesService;

import jakarta.validation.Valid;

/**
 * clase JokesRestController
 * Controlador REST para manejar las peticiones de la API de chistes.
 * 
 * @autor Jose Pinilla
 */
@CrossOrigin(origins = { "*" })
@RestController
@RequestMapping("/jokes")
public class JokesRestController {

	@Autowired
	private IJokesService jokesService;
	
	@Autowired
	private IFlagsService flagsService;
	
	@Autowired
	private ITypesService typeService;
	
	@Autowired
	private ILanguageService languageService;
	
	@Autowired
	private ICategoriesService categoryService;
	
	/**
	 * Método que devuelve todos los chistes chistes.
	 * 
	 * @return List<JokesNamesDTO> Lista de chistes.
	 */
	@GetMapping({"/", ""})
    public List<JokesNamesDTO> allJokes() {

        List<Jokes> jokes = jokesService.findAll();

        List<JokesNamesDTO> jokesDTOList = new ArrayList<>();

        jokes.forEach(joke -> {

            String categoryName = (joke.getCategories() != null) 
                    ? joke.getCategories().getCategory()
                    : null;

            String languageName = (joke.getLanguage() != null) 
                    ? joke.getLanguage().getLanguage() 
                    : null;

            String typeName = (joke.getTypes() != null) 
                    ? joke.getTypes().getType()
                    : null;

            Set<String> flagsNames = new HashSet<>();
            if (joke.getFlagses() != null) {
                flagsNames = joke.getFlagses()
                        .stream()
                        .map(Flags::getFlag) 
                        .collect(Collectors.toSet());
            }

            // DTO con los nombres
            JokesNamesDTO jokesDTO = new JokesNamesDTO(
                joke.getId(),
                categoryName,
                languageName,
                typeName,
                joke.getText1(),
                joke.getText2(),
                flagsNames
            );

            jokesDTOList.add(jokesDTO);
        });

        return jokesDTOList;
    }

	/**
	 * Método que devuelve un chiste por su ID.
	 * @param id ID del chiste
	 * @return ResponseEntity<?> Respuesta HTTP 
	 */
	@GetMapping("/{id}")
	public ResponseEntity<?> jokeById(@PathVariable Integer id) {
	    Map<String, Object> response = new HashMap<>();
	    Jokes joke = jokesService.findById(id);

	    if (joke == null) {
	        response.put("mensaje", "El chiste ID: " + id + " no existe en la base de datos!");
	        return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
	    }

	    String categoryName = (joke.getCategories() != null) ? joke.getCategories().getCategory() : "N/A";
	    String languageName = (joke.getLanguage() != null) ? joke.getLanguage().getLanguage() : "N/A";
	    String typeName = (joke.getTypes() != null) ? joke.getTypes().getType() : "N/A";

	    Set<String> flagsNames = joke.getFlagses().stream()
	            .map(Flags::getFlag)
	            .collect(Collectors.toSet());

	    JokesNamesDTO jokesDTO = new JokesNamesDTO();
	    jokesDTO.setId(joke.getId());
	    jokesDTO.setCategoryName(categoryName);
	    jokesDTO.setLanguageName(languageName);
	    jokesDTO.setTypeName(typeName);
	    jokesDTO.setText1(joke.getText1());
	    jokesDTO.setText2(joke.getText2());
	    jokesDTO.setFlagsNames(flagsNames);

	    return new ResponseEntity<>(jokesDTO, HttpStatus.OK);
	}


	/**
	 * Método que inserta un chiste en la base de datos.
	 * @param jokeDTO DTO con los datos del chiste
	 * @param result Resultado de la validación
	 * @return ResponseEntity<?> Respuesta HTTP
	 */
	@PostMapping({"/", ""})
	public ResponseEntity<?> insertJoke(@Valid @RequestBody JokeUpdateDTO jokeDTO, BindingResult result) {
	    Map<String, Object> response = new HashMap<>();

	    // Validación de errores de BindingResult
	    if (result.hasErrors()) {
	        List<String> errors = result.getFieldErrors().stream()
	                .map(err -> "El campo '" + err.getField() + "' " + err.getDefaultMessage())
	                .toList();
	        response.put("errors", errors);
	        return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
	    }

	    try {
	        // Validación de texto en función del tipo (typeId)
	        if (jokeDTO.getTypeId() == 1) {
	            if (jokeDTO.getText1() == null || jokeDTO.getText1().isEmpty()) {
	                response.put("mensaje", "Error: Para el tipo 1, 'text1' debe estar lleno.");
	                return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
	            }
	            if (jokeDTO.getText2() != null && !jokeDTO.getText2().isEmpty()) {
	                response.put("mensaje", "Error: Para el tipo 1, 'text2' debe estar vacío.");
	                return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
	            }
	        } else if (jokeDTO.getTypeId() == 2) {
	            if (jokeDTO.getText1() == null || jokeDTO.getText1().isEmpty()) {
	                response.put("mensaje", "Error: Para el tipo 2, 'text1' debe estar lleno.");
	                return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
	            }
	            if (jokeDTO.getText2() == null || jokeDTO.getText2().isEmpty()) {
	                response.put("mensaje", "Error: Para el tipo 2, 'text2' debe estar lleno.");
	                return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
	            }
	        }

	        Jokes joke = new Jokes();
	        joke.setText1(jokeDTO.getText1());
	        joke.setText2(jokeDTO.getText2());

	        Categories category = categoryService.findById(jokeDTO.getCategoryId());
	        if (category == null) {
	            response.put("mensaje", "Error: La categoría especificada no existe.");
	            return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
	        }
	        joke.setCategories(category);

	        Language language = languageService.findById(jokeDTO.getLanguageId());
	        if (language == null) {
	            response.put("mensaje", "Error: El idioma especificado no existe.");
	            return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
	        }
	        joke.setLanguage(language);

	        Types type = typeService.findById(jokeDTO.getTypeId());
	        if (type == null) {
	            response.put("mensaje", "Error: El tipo especificado no existe.");
	            return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
	        }
	        joke.setTypes(type);

	        Set<Flags> flagsEntities = new HashSet<>();
	        if (jokeDTO.getFlagses() != null) {
	            for (Integer flagId : jokeDTO.getFlagses()) {
	                Flags flag = flagsService.findById(flagId);
	                if (flag != null) {
	                    flagsEntities.add(flag);
	                } else {
	                    response.put("mensaje", "Error: El flag con ID " + flagId + " no existe.");
	                    return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
	                }
	            }
	        }
	        joke.setFlagses(flagsEntities);

	        Jokes jokeNuevo = jokesService.save(joke);

	        // Crear un DTO para la respuesta
	        JokesNamesDTO jokesDTO = new JokesNamesDTO(
	                jokeNuevo.getId(),
	                jokeNuevo.getCategories() != null ? jokeNuevo.getCategories().getCategory() : null,
	                jokeNuevo.getLanguage() != null ? jokeNuevo.getLanguage().getLanguage() : null,
	                jokeNuevo.getTypes() != null ? jokeNuevo.getTypes().getType() : null,
	                jokeNuevo.getText1(),
	                jokeNuevo.getText2(),
	                jokeNuevo.getFlagses().stream()
	                        .map(Flags::getFlag)
	                        .collect(Collectors.toSet())
	        );

	        response.put("mensaje", "El chiste ha sido creado con éxito!");
	        response.put("joke", jokesDTO);
	        return new ResponseEntity<>(response, HttpStatus.CREATED);

	    } catch (DataAccessException e) {
	        response.put("mensaje", "Error al realizar el insert en la base de datos.");
	        response.put("error", e.getMessage().concat(": ").concat(e.getMostSpecificCause().getMessage()));
	        return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	}


	/**
	 * Método que edita un chiste en la base
	 * @param jokeDTO DTO con los datos del chiste
	 * @param result Resultado de la validación
	 * @param id ID del chiste
	 * @return ResponseEntity<?> Respuesta HTTP
	 */
	@PutMapping("/{id}")
	public ResponseEntity<?> editJoke(@Valid @RequestBody JokeUpdateDTO jokeDTO,
	                                  BindingResult result,
	                                  @PathVariable Integer id) {
	    Map<String, Object> response = new HashMap<>();

	    if (result.hasErrors()) {
	        List<String> errors = result.getFieldErrors().stream()
	                .map(err -> "El campo '" + err.getField() + "' " + err.getDefaultMessage())
	                .toList();
	        response.put("errors", errors);
	        return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
	    }

	    Jokes jokeActual = jokesService.findById(id);
	    if (jokeActual == null) {
	        response.put("mensaje", "Error: no se pudo editar, el chiste ID: "
	                + id + " no existe en la base de datos!");
	        return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
	    }

	    try {
	        if (jokeDTO.getTypeId() == 1) {
	            if (jokeDTO.getText1() == null || jokeDTO.getText1().isEmpty()) {
	                response.put("mensaje", "Error: Para el tipo 1, 'text1' debe estar lleno.");
	                return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
	            }
	            if (jokeDTO.getText2() != null && !jokeDTO.getText2().isEmpty()) {
	                response.put("mensaje", "Error: Para el tipo 1, 'text2' debe estar vacío.");
	                return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
	            }
	        } else if (jokeDTO.getTypeId() == 2) {
	            if (jokeDTO.getText1() == null || jokeDTO.getText1().isEmpty()) {
	                response.put("mensaje", "Error: Para el tipo 2, 'text1' debe estar lleno.");
	                return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
	            }
	            if (jokeDTO.getText2() == null || jokeDTO.getText2().isEmpty()) {
	                response.put("mensaje", "Error: Para el tipo 2, 'text2' debe estar lleno.");
	                return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
	            }
	        }

	        jokeActual.setText1(jokeDTO.getText1());
	        jokeActual.setText2(jokeDTO.getText2());
	        jokeActual.setCategories(categoryService.findById(jokeDTO.getCategoryId()));
	        jokeActual.setLanguage(languageService.findById(jokeDTO.getLanguageId()));
	        jokeActual.setTypes(typeService.findById(jokeDTO.getTypeId()));

	        Set<Flags> flagsEntities = new HashSet<>();
	        if (jokeDTO.getFlagses() != null) {
	            for (Integer flagId : jokeDTO.getFlagses()) {
	                Flags flag = flagsService.findById(flagId);
	                if (flag != null) {
	                    flagsEntities.add(flag);
	                }
	            }
	        }
	        jokeActual.setFlagses(flagsEntities);

	        Jokes jokeActualizado = jokesService.save(jokeActual);

	        JokesNamesDTO jokesDTO = new JokesNamesDTO(
	                jokeActualizado.getId(),
	                jokeActualizado.getCategories() != null ? jokeActualizado.getCategories().getCategory() : null,
	                jokeActualizado.getLanguage() != null ? jokeActualizado.getLanguage().getLanguage() : null,
	                jokeActualizado.getTypes() != null ? jokeActualizado.getTypes().getType() : null,
	                jokeActualizado.getText1(),
	                jokeActualizado.getText2(),
	                jokeActualizado.getFlagses().stream()
	                        .map(Flags::getFlag)
	                        .collect(Collectors.toSet())
	        );

	        response.put("mensaje", "El chiste ha sido actualizado con éxito!");
	        response.put("joke", jokesDTO);
	        return new ResponseEntity<>(response, HttpStatus.CREATED);

	    } catch (DataAccessException e) {
	        response.put("mensaje", "Error al actualizar el chiste en la base de datos");
	        response.put("error", e.getMessage().concat(": ").concat(e.getMostSpecificCause().getMessage()));
	        return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	}

	/**
	 * Método que elimina un chiste por su ID.
	 * @param id ID del chiste
	 * @return ResponseEntity<?> Respuesta HTTP
	 */
	@DeleteMapping("/{id}")
	public ResponseEntity<?> deleteJokeById(@PathVariable Integer id) {
	    Jokes jokeBorrado = jokesService.findById(id);
	    Map<String, Object> response = new HashMap<>();

	    if (jokeBorrado == null) {
	        response.put("mensaje", "Error: no se pudo eliminar, el chiste ID: ".concat(id.toString())
	                .concat(" no existe en la base de datos!"));
	        return new ResponseEntity<Map<String, Object>>(response, HttpStatus.NOT_FOUND);
	    }
	    
	    try {
	        jokesService.deleteById(id);
	    } catch (DataAccessException e) {
	        response.put("mensaje", "Error al eliminar el chiste de la base de datos");
	        response.put("error", e.getMessage().concat(": ").concat(e.getMostSpecificCause().getMessage()));
	        return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	    response.put("mensaje", "El chiste ha sido eliminado con éxito!");
	    return new ResponseEntity<Map<String, Object>>(response, HttpStatus.OK);
	}
}
