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

import com.jose.springboot.backend.mvc.models.dto.CategoriesDTO;
import com.jose.springboot.backend.mvc.models.entity.Categories;
import com.jose.springboot.backend.mvc.models.entity.Jokes;
import com.jose.springboot.backend.mvc.models.services.ICategoriesService;
import com.jose.springboot.backend.mvc.models.services.IJokesService;

import jakarta.validation.Valid;

/**
 * Clase CategoriesRestController que implementa un controlador REST para las
 * operaciones CRUD de las categorías de chistes.
 * 
 * @author Jose Pinilla
 */
@CrossOrigin(origins = { "*" })
@RestController
@RequestMapping("/categories")
public class CategoriesRestController {

    @Autowired
    private ICategoriesService categoriesService;
    @Autowired
    private IJokesService jokesService;

    /**
     * Método que retorna la lista de todas las categorías de chistes.
     * 
     * @return List<CategoriesDTO> - Lista de categorías de chistes.
     */
    @GetMapping({ "/", "" })
    public List<CategoriesDTO> allCategories() {
        List<Categories> categories = categoriesService.findAll();
        return categories.stream()
                .map(category -> new CategoriesDTO(category.getId(), category.getCategory()))
                .collect(Collectors.toList());
    }

    /**
     * Método que retorna una categoría de chistes por su ID.
     * 
     * @param id - ID de la categoría a buscar.
     * @return ResponseEntity<?> - Respuesta HTTP con la categoría de chistes en DTO
     */
    @GetMapping("/{id}")
    public ResponseEntity<?> getCategoryById(@PathVariable Integer id) {
        Categories category = categoriesService.findById(id);
        if (category == null) {
            Map<String, Object> response = new HashMap<>();
            response.put("mensaje", "La categoría con ID " + id + " no existe en la base de datos.");
            return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(new CategoriesDTO(category.getId(), category.getCategory()), HttpStatus.OK);
    }

    /**
     * Método que crea una nueva categoría de chistes.
     * 
     * @param categoriesDTO - DTO de la categoría a crear.
     * @param result - Resultado de la validación de la categoría.
     * @return ResponseEntity<?> - Respuesta HTTP con el resultado de la creación.
     */
    @PostMapping({ "/", "" })
    public ResponseEntity<?> createCategory(@Valid @RequestBody CategoriesDTO categoriesDTO, BindingResult result) {
        Map<String, Object> response = new HashMap<>();
        if (result.hasErrors()) {
            List<String> errors = result.getFieldErrors().stream()
                    .map(err -> "El campo '" + err.getField() + "' " + err.getDefaultMessage())
                    .toList();
            response.put("errors", errors);
            return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
        }

        try {
            Categories category = new Categories();
            category.setCategory(categoriesDTO.getName());
            Categories newCategory = categoriesService.save(category);
            response.put("mensaje", "La categoría ha sido creada con éxito!");
            response.put("category", new CategoriesDTO(newCategory.getId(), newCategory.getCategory()));
            return new ResponseEntity<>(response, HttpStatus.CREATED);
        } catch (DataAccessException e) {
            response.put("mensaje", "Error al realizar el insert en la base de datos");
            response.put("error", e.getMessage().concat(": ").concat(e.getMostSpecificCause().getMessage()));
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Método que actualiza una categoría de chistes por su ID.
     * 
     * @param categoriesDTO - DTO de la categoría a actualizar.
     * @param result - Resultado de la validación de la categor
     * @param id - ID de la categoría a actualizar.
     * @return ResponseEntity<?> - Respuesta HTTP con el resultado de la actualización.
     */
    @PutMapping("/{id}")
    public ResponseEntity<?> updateCategory(@Valid @RequestBody CategoriesDTO categoriesDTO, BindingResult result, @PathVariable Integer id) {
        Map<String, Object> response = new HashMap<>();
        if (result.hasErrors()) {
            List<String> errors = result.getFieldErrors().stream()
                    .map(err -> "El campo '" + err.getField() + "' " + err.getDefaultMessage())
                    .toList();
            response.put("errors", errors);
            return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
        }

        Categories existingCategory = categoriesService.findById(id);
        if (existingCategory == null) {
            response.put("mensaje", "Error: no se pudo editar, la categoría con ID " + id + " no existe.");
            return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
        }

        try {
            existingCategory.setCategory(categoriesDTO.getName());
            Categories updatedCategory = categoriesService.save(existingCategory);
            response.put("mensaje", "La categoría ha sido actualizada con éxito!");
            response.put("category", new CategoriesDTO(updatedCategory.getId(), updatedCategory.getCategory()));
            return new ResponseEntity<>(response, HttpStatus.OK);
        } catch (DataAccessException e) {
            response.put("mensaje", "Error al actualizar la categoría en la base de datos");
            response.put("error", e.getMessage().concat(": ").concat(e.getMostSpecificCause().getMessage()));
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Método que elimina una categoría de chistes por su ID.
     * Además de eliminar la categoría, elimina todos los chistes asociados a la
     * categoría.
     * 
     * @param id - ID de la categoría a eliminar.
     * @return ResponseEntity<?> - Respuesta HTTP con el resultado de la eliminacion
     */
    @DeleteMapping("/{id}/delete-with-jokes")
    public ResponseEntity<?> deleteCategoryWithJokes(@PathVariable Integer id) {
        Map<String, Object> response = new HashMap<>();
        Categories categoryToDelete = categoriesService.findById(id);

        if (categoryToDelete == null) {
            response.put("mensaje", "Error: no se pudo eliminar, la categoría con ID " + id + " no existe.");
            return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
        }

        try {
            // Eliminar todos los chistes asociados a la categoría
            List<Jokes> jokesToDelete = jokesService.findByCategoryId(id);
            jokesToDelete.forEach(jokesService::delete);

            // Eliminar la categoría después de eliminar los chistes
            categoriesService.deleteById(id);
            response.put("mensaje", "La categoría y sus chistes asociados han sido eliminados con éxito!");
            return new ResponseEntity<>(response, HttpStatus.OK);
        } catch (DataAccessException e) {
            response.put("mensaje", "Error al eliminar la categoría y sus chistes de la base de datos");
            response.put("error", e.getMessage().concat(": ").concat(e.getMostSpecificCause().getMessage()));
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Método que elimina una categoría de chistes por su ID.
     * Además de eliminar la categoría, actualiza los chistes asociados a la categoría
     * para que tengan categoría null.
     * @param id - ID de la categoría a eliminar.
     * @return ResponseEntity<?> - Respuesta HTTP con el resultado de la eliminación.
     */
    @DeleteMapping("/{id}/remove-from-jokes")
    public ResponseEntity<?> removeCategoryFromJokes(@PathVariable Integer id) {
        Map<String, Object> response = new HashMap<>();
        Categories categoryToDelete = categoriesService.findById(id);

        if (categoryToDelete == null) {
            response.put("mensaje", "Error: no se pudo eliminar, la categoría con ID " + id + " no existe.");
            return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
        }

        try {
            // Actualizar los chistes asociados a la categoría para establecer su categoría como null
            List<Jokes> jokesToUpdate = jokesService.findByCategoryId(id);
            jokesToUpdate.forEach(joke -> {
                joke.setCategories(null);
                jokesService.save(joke);
                response.put("mensaje", "Los chistes asociados a la categoría han sido actualizados para tener categoría null.");
            });

            // Eliminar la categoría después de actualizar los chistes
            categoriesService.deleteById(id);
            response.put("mensaje", "La categoría ha sido eliminada, y los chistes asociados han sido actualizados para tener categoría null.");
            return new ResponseEntity<>(response, HttpStatus.OK);
        } catch (DataAccessException e) {
            response.put("mensaje", "Error al eliminar la categoría de la base de datos");
            response.put("error", e.getMessage().concat(": ").concat(e.getMostSpecificCause().getMessage()));
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    /**
     * Método que cuenta la cantidad de chistes asociados a una categoría por su ID
     * @param id - ID de la categoría a contar chistes
     * @return ResponseEntity<?> - Respuesta HTTP con la cantidad de chistes asociados a la categor
     */
    @GetMapping("/{id}/count-jokes")
    public ResponseEntity<?> countJokesByCategory(@PathVariable Integer id) {
        Map<String, Object> response = new HashMap<>();
        Categories category = categoriesService.findById(id);

        if (category == null) {
            response.put("mensaje", "La categoría con ID " + id + " no existe en la base de datos.");
            return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
        }

        try {
            int jokesCount = jokesService.findByCategoryId(id).size();
            response.put("categoryId", id);
            response.put("jokesCount", jokesCount);
            return new ResponseEntity<>(response, HttpStatus.OK);
        } catch (Exception e) {
            response.put("mensaje", "Error al contar los chistes asociados a la categoría.");
            response.put("error", e.getMessage().concat(": ").concat(e.getCause().getMessage()));
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}

