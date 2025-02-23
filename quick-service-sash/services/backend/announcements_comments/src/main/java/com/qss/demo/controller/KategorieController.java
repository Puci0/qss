package com.qss.demo.controller;

import com.qss.demo.dto.KategoriaDTO;
import com.qss.demo.services.KategoriaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/kategorie")
public class KategorieController {

    private final KategoriaService kategoriaService;

    @Autowired
    public KategorieController(KategoriaService kategoriaService) {
        this.kategoriaService = kategoriaService;
    }

    @GetMapping
    public ResponseEntity<List<KategoriaDTO>> getKategorieWithSubcategories() {

        List<KategoriaDTO> kategoriaDTOS = kategoriaService.getCategoriesWithSubcategories();

        return ResponseEntity.ok(kategoriaDTOS);
    }

    @PostMapping
    public ResponseEntity<KategoriaDTO> addCategory(@RequestBody KategoriaDTO kategoriaDTO) {

        KategoriaDTO newKategoriaDTO = kategoriaService.addCategoryWithSubCategories(kategoriaDTO);

        return ResponseEntity.status(HttpStatus.CREATED).body(newKategoriaDTO);
    }
}
