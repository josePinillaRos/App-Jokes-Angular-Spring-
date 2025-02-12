package com.jose.springboot.backend.mvc.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

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

import com.jose.springboot.backend.mvc.models.dto.FlagsDTO;
import com.jose.springboot.backend.mvc.models.entity.Flags;
import com.jose.springboot.backend.mvc.models.entity.Jokes;
import com.jose.springboot.backend.mvc.models.services.IFlagsService;

import jakarta.validation.Valid;

/**
 * class FlagsRestController
 * Controlador REST para Flags.
 * 
 * @author Jose Pinilla
 */
@CrossOrigin(origins = { "*" })
@RestController
@RequestMapping("/flags")
public class FlagsRestController {

    @Autowired
    private IFlagsService flagsService;

    /**
     * Devuelve todos los Flags en forma de FlagsDTO.
     * 
     * @return List<FlagsDTO>
     */
    @GetMapping({"/", ""})
    public List<FlagsDTO> allFlags() {

        // Obtenemos la lista de entidades Flags desde el servicio
        List<Flags> flagsList = flagsService.findAll();

        // Creamos una lista para almacenar FlagsDTO
        List<FlagsDTO> flagsDTOList = new ArrayList<>();

        // Recorremos cada Flags y lo convertimos a FlagsDTO
        flagsList.forEach(flag -> {

            // Obtenemos el campo "flag" como "name" en el DTO
            String flagName = flag.getFlag();

            // Creamos el DTO
            FlagsDTO flagsDTO = new FlagsDTO(
                    flag.getId(), // El DTO usa Long, la entidad usa int
                    flagName
            );

            flagsDTOList.add(flagsDTO);
        });

        // Devolvemos la lista de DTO
        return flagsDTOList;
    }

    /**
     * Devuelve un FlagsDTO por su ID.
     * 
     * @param id Integer ID del Flag
     * @return ResponseEntity<?> Respuesta HTTP con el FlagDTO
     */
    @GetMapping("/{id}")
    public ResponseEntity<?> flagById(@PathVariable Integer id) {
        Flags flag = null;
        Map<String, Object> response = new HashMap<>();

        try {
            flag = flagsService.findById(id);
        } catch (DataAccessException e) {
            response.put("mensaje", "Error al realizar la consulta en la base de datos");
            response.put("error", e.getMessage().concat(": ").concat(e.getMostSpecificCause().getMessage()));
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }

        if (flag == null) {
            response.put("mensaje", "El flag ID: ".concat(id.toString()).concat(" no existe en la base de datos!"));
            return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
        }

        // Convertimos la entidad Flags a un FlagsDTO
        String flagName = flag.getFlag();

        FlagsDTO flagsDTO = new FlagsDTO(
                flag.getId(),
                flagName
        );

        return new ResponseEntity<>(flagsDTO, HttpStatus.OK);
    }

    /**
     * Inserta un nuevo Flag recibiendo la entidad Flags.
     * 
     * @param flag Flags Entidad Flags a insertar
     * @param result BindingResult Resultado de la validación
     * @return ResponseEntity<?> Respuesta HTTP con el resultado del insert
     */
    @PostMapping({"/", ""})
    public ResponseEntity<?> insertFlag(@Valid @RequestBody Flags flag, BindingResult result) {
        Flags flagNuevo = null;
        Map<String, Object> response = new HashMap<>();

        // Validamos si hay errores en los datos enviados
        if (result.hasErrors()) {
            List<String> errors = result.getFieldErrors().stream()
                    .map(err -> "El campo '" + err.getField() + "' " + err.getDefaultMessage())
                    .toList();
            response.put("errors", errors);
            return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
        }

        try {
            // Guardamos el nuevo Flags en la base de datos
            flagNuevo = flagsService.save(flag);
        } catch (DataAccessException e) {
            response.put("mensaje", "Error al realizar el insert en la base de datos");
            response.put("error", e.getMessage().concat(": ").concat(e.getMostSpecificCause().getMessage()));
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }

        // Respuesta exitosa
        response.put("mensaje", "El flag ha sido creado con éxito!");
        response.put("flag", flagNuevo);
        return new ResponseEntity<>(response, HttpStatus.CREATED);
    }

    /**
     * Edita un Flag existente recibiendo la entidad Flags.
     * 
     * @param flag Flags Entidad Flags a editar
     * @param result BindingResult Resultado de la validación
     * @param id Integer ID del Flag a editar
     * @return ResponseEntity<?> Respuesta HTTP con el resultado de la edición
     */
    @PutMapping("/{id}")
    public ResponseEntity<?> editFlag(@Valid @RequestBody Flags flag, 
                                      BindingResult result, 
                                      @PathVariable Integer id) {
        Flags flagActual = flagsService.findById(id);
        Flags flagActualizado = null;
        Map<String, Object> response = new HashMap<>();

        // Validación de errores
        if (result.hasErrors()) {
            List<String> errors = result.getFieldErrors().stream()
                    .map(err -> "El campo '" + err.getField() + "' " + err.getDefaultMessage())
                    .toList();
            response.put("errors", errors);
            return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
        }

        // Verificamos si el flag existe
        if (flagActual == null) {
            response.put("mensaje", "Error: no se pudo editar, el flag ID: "
                    + id + " no existe en la base de datos!");
            return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
        }

        try {
            // Actualizamos el flag
            flagActual.setFlag(flag.getFlag());

            // Preservamos las relaciones con los jokes
            if (flag.getJokeses() != null && !flag.getJokeses().isEmpty()) {
                Set<Jokes> jokesRelacionados = new HashSet<>(flagActual.getJokeses());
                jokesRelacionados.addAll(flag.getJokeses());
                flagActual.setJokeses(jokesRelacionados);
            }

            // Guardamos el flag actualizado
            flagActualizado = flagsService.save(flagActual);

            // Creamos un DTO limpio para la respuesta
            FlagsDTO flagsDTO = new FlagsDTO(
                    flagActualizado.getId(),
                    flagActualizado.getFlag()
            );

            response.put("mensaje", "El flag ha sido actualizado con éxito!");
            response.put("flag", flagsDTO);
            return new ResponseEntity<>(response, HttpStatus.OK);

        } catch (DataAccessException e) {
            response.put("mensaje", "Error al actualizar el flag en la base de datos");
            response.put("error", e.getMessage().concat(": ").concat(e.getMostSpecificCause().getMessage()));
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    /**
     * Elimina un Flag por su ID.
     * 
     * @param id Integer ID del Flag a eliminar
     * @return ResponseEntity<?> Respuesta HTTP con el resultado de la eliminación
     */
    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteFlagById(@PathVariable Integer id) {
        Flags flagBorrado = flagsService.findById(id);
        Map<String, Object> response = new HashMap<>();

        // Verificamos si el Flag existe
        if (flagBorrado == null) {
            response.put("mensaje", "Error: no se pudo eliminar, el flag ID: "
                    .concat(id.toString())
                    .concat(" no existe en la base de datos!"));
            return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
        }

        try {
            flagsService.deleteById(id);
        } catch (DataAccessException e) {
            response.put("mensaje", "Error al eliminar el flag de la base de datos");
            response.put("error", e.getMessage().concat(": ").concat(e.getMostSpecificCause().getMessage()));
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }

        // Respuesta exitosa
        response.put("mensaje", "El flag ha sido eliminado con éxito!");
        return new ResponseEntity<>(response, HttpStatus.OK);
    }
    
    /**
     * Cuenta la cantidad de chistes asociados a un flag.
     * @param id ID del flag
     * @return ResponseEntity<?> Respuesta HTTP con la cantidad de chistes asociados al flag
     */
    @GetMapping("/{id}/count-jokes")
    public ResponseEntity<?> countJokesByFlag(@PathVariable Integer id) {
        Map<String, Object> response = new HashMap<>();
        Flags flag = flagsService.findById(id);

        if (flag == null) {
            response.put("mensaje", "El flag ID: " + id + " no existe en la base de datos!");
            return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
        }

        int jokeCount = flagsService.countJokesByFlagId(id);

        response.put("jokesCount", jokeCount);
        response.put("mensaje", "El flag tiene " + jokeCount + " chistes asociados.");
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

}