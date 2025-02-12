package com.jose.springboot.backend.mvc.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
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

import com.jose.springboot.backend.mvc.models.dto.LanguageDTO;
import com.jose.springboot.backend.mvc.models.entity.Jokes;
import com.jose.springboot.backend.mvc.models.entity.Language;
import com.jose.springboot.backend.mvc.models.services.IJokesService;
import com.jose.springboot.backend.mvc.models.services.ILanguageService;

import jakarta.validation.Valid;

/**
 * class LanguageRestController
 * Controlador REST para gestionar las peticiones HTTP relacionadas con los idiomas.
 * 
 * @author Jose Pinilla
 */
@CrossOrigin(origins = { "*" })
@RestController
@RequestMapping("/languages")
public class LanguageRestController {

    @Autowired
    private ILanguageService languageService;

    @Autowired
    private IJokesService jokesService;

    /**
     * Método que retorna la lista de todos los idiomas en la base de datos.
     * @return List<LanguageDTO> - Lista de objetos LanguageDTO con los datos de los idiomas
     */
    @GetMapping({ "/", "" })
    public List<LanguageDTO> allLanguages() {
        List<Language> languages = languageService.findAll();
        return languages.stream()
                .map(language -> new LanguageDTO(language.getId(), language.getLanguage(), language.getCode()))
                .collect(Collectors.toList());
    }

    /**
     * Método que retorna un idioma específico por su ID.
     * @param id - ID del idioma a buscar
     * @return ResponseEntity<?> - Respuesta HTTP con el objeto LanguageDTO o un mensaje de error
     */
    @GetMapping("/{id}")
    public ResponseEntity<?> getLanguageById(@PathVariable Integer id) {
        Language language = languageService.findById(id);
        if (language == null) {
            Map<String, Object> response = new HashMap<>();
            response.put("mensaje", "El idioma con ID " + id + " no existe en la base de datos.");
            return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(new LanguageDTO(language.getId(), language.getLanguage(), language.getCode()), HttpStatus.OK);
    }

    /**
     * Método que crea un nuevo idioma en la base de datos.
     * @param languageDTO - Objeto LanguageDTO con los datos del idioma a crear
     * @param result - Objeto BindingResult para validar los datos del idioma
     * @return ResponseEntity<?> - Respuesta HTTP con un mensaje de éxito o error
     */
    @PostMapping({ "/", "" })
    public ResponseEntity<?> createLanguage(@Valid @RequestBody LanguageDTO languageDTO, BindingResult result) {
        Map<String, Object> response = new HashMap<>();
        if (result.hasErrors()) {
            List<String> errors = result.getFieldErrors().stream()
                    .map(err -> "El campo '" + err.getField() + "' " + err.getDefaultMessage())
                    .toList();
            response.put("errors", errors);
            return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
        }

        try {
            Language language = new Language();
            
            language.setLanguage(languageDTO.getName());
            language.setCode(languageDTO.getCode());
            
            Language newLanguage = languageService.save(language);
            
            response.put("mensaje", "El idioma ha sido creado con éxito!");
            response.put("language", new LanguageDTO(newLanguage.getId(), newLanguage.getLanguage(), newLanguage.getCode()));
            return new ResponseEntity<>(response, HttpStatus.CREATED);
        } catch (DataAccessException e) {
            response.put("mensaje", "Error al realizar el insert en la base de datos");
            response.put("error", e.getMessage().concat(": ").concat(e.getMostSpecificCause().getMessage()));
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Método que actualiza un idioma en la base de datos.
     * @param languageDTO DTO con los datos del idioma a actualizar
     * @param result Objeto BindingResult para validar los datos del idioma
     * @param id ID del idioma a actualizar
     * @return ResponseEntity<?> - Respuesta HTTP con un mensaje de éxito
     */
    @PutMapping("/{id}")
    public ResponseEntity<?> updateLanguage(@Valid @RequestBody LanguageDTO languageDTO, BindingResult result, @PathVariable Integer id) {
        Map<String, Object> response = new HashMap<>();
        if (result.hasErrors()) {
            List<String> errors = result.getFieldErrors().stream()
                    .map(err -> "El campo '" + err.getField() + "' " + err.getDefaultMessage())
                    .toList();
            response.put("errors", errors);
            return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
        }

        Language existingLanguage = languageService.findById(id);
        
        if (existingLanguage == null) {
            response.put("mensaje", "Error: no se pudo editar, el idioma con ID " + id + " no existe.");
            return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
        }

        try {
            existingLanguage.setLanguage(languageDTO.getName());
            existingLanguage.setCode(languageDTO.getCode());
            
            Language updatedLanguage = languageService.save(existingLanguage);
            
            response.put("mensaje", "El idioma ha sido actualizado con éxito!");
            response.put("language", new LanguageDTO(updatedLanguage.getId(), updatedLanguage.getLanguage(), updatedLanguage.getCode()));
            return new ResponseEntity<>(response, HttpStatus.OK);
        } catch (DataAccessException e) {
            response.put("mensaje", "Error al actualizar el idioma en la base de datos");
            response.put("error", e.getMessage().concat(": ").concat(e.getMostSpecificCause().getMessage()));
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Método que elimina un idioma de la base de datos. 
     * Además, elimina todos los chistes asociados al idioma.
     * @param id ID del idioma a eliminar
     * @return ResponseEntity<?> - Respuesta HTTP con un mensaje de éxito o error
     */
    @DeleteMapping("/{id}/delete-with-jokes")
    public ResponseEntity<?> deleteLanguageWithJokes(@PathVariable Integer id) {
        Map<String, Object> response = new HashMap<>();
        Language languageToDelete = languageService.findById(id);

        if (languageToDelete == null) {
            response.put("mensaje", "Error: no se pudo eliminar, el idioma con ID " + id + " no existe.");
            return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
        }

        try {
            // Elimina todos los chistes asociados al idioma
            List<Jokes> jokesToDelete = jokesService.findByLanguageId(id);
            jokesToDelete.forEach(jokesService::delete);

            // Eliminar el idioma después de eliminar los chistes
            languageService.deleteById(id);
            response.put("mensaje", "El idioma y sus chistes asociados han sido eliminados con éxito!");
            return new ResponseEntity<>(response, HttpStatus.OK);
        } catch (DataAccessException e) {
            response.put("mensaje", "Error al eliminar el idioma y sus chistes de la base de datos");
            response.put("error", e.getMessage().concat(": ").concat(e.getMostSpecificCause().getMessage()));
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Método que elimina un idioma de la base de datos.
     * Además, actualiza los chistes asociados al idioma para que tengan idioma null.
     * @param id ID del idioma a eliminar
     * @return ResponseEntity<?> - Respuesta HTTP con un mensaje de éxito o error
     */
    @DeleteMapping("/{id}/remove-from-jokes")
    public ResponseEntity<?> removeLanguageFromJokes(@PathVariable Integer id) {
        Map<String, Object> response = new HashMap<>();
        Language languageToDelete = languageService.findById(id);

        if (languageToDelete == null) {
            response.put("mensaje", "Error: no se pudo eliminar, el idioma con ID " + id + " no existe.");
            return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
        }

        try {
            // Actualizar los chistes asociados al idioma para establecer su idioma como null
            List<Jokes> jokesToUpdate = jokesService.findByLanguageId(id);
            jokesToUpdate.forEach(joke -> {
                joke.setLanguage(null);
                jokesService.save(joke);
            });

            // Eliminar el idioma después de actualizar los chistes
            languageService.deleteById(id);
            response.put("mensaje", "El idioma ha sido eliminado, y los chistes asociados han sido actualizados para tener idioma null.");
            return new ResponseEntity<>(response, HttpStatus.OK);
        } catch (DataAccessException e) {
            response.put("mensaje", "Error al eliminar el idioma de la base de datos");
            response.put("error", e.getMessage().concat(": ").concat(e.getMostSpecificCause().getMessage()));
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Método que cuenta la cantidad de chistes asociados a un idioma.
     * @param id ID del idioma a buscar
     * @return ResponseEntity<?> - Respuesta HTTP con la cantidad de chistes asociados al idioma
     */
    @GetMapping("/{id}/count-jokes")
    public ResponseEntity<?> countJokesByLanguage(@PathVariable Integer id) {
        Map<String, Object> response = new HashMap<>();
        Language language = languageService.findById(id);

        if (language == null) {
            response.put("mensaje", "El idioma con ID " + id + " no existe en la base de datos.");
            return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
        }

        try {
            int jokesCount = jokesService.findByLanguageId(id).size();
            response.put("languageId", id);
            response.put("jokesCount", jokesCount);
            return new ResponseEntity<>(response, HttpStatus.OK);
        } catch (Exception e) {
            response.put("mensaje", "Error al contar los chistes asociados al idioma.");
            response.put("error", e.getMessage().concat(": ").concat(e.getCause().getMessage()));
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}