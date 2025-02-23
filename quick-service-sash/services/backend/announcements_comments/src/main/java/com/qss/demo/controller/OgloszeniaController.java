package com.qss.demo.controller;

import com.qss.demo.dto.OgloszenieDTO;
import com.qss.demo.services.OgloszenieService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/api/ogloszenia")
//@CrossOrigin(origins = "http://localhost:4200")
public class OgloszeniaController {

    private final OgloszenieService ogloszenieService;

    public OgloszeniaController(OgloszenieService ogloszenieService) {
        this.ogloszenieService = ogloszenieService;
    }

    @GetMapping
    public ResponseEntity<List<OgloszenieDTO>> getOgloszenia(){

        List<OgloszenieDTO> ogloszenieDTOS = ogloszenieService.getOgloszenia();
        return new ResponseEntity<>(ogloszenieDTOS, HttpStatus.OK);
    }

    @GetMapping("/uzytkownik/{id}")
    public ResponseEntity<List<OgloszenieDTO>> getOgloszeniaByIdUzytkownika(@PathVariable("id") Long idUzytkownika) {

        List<OgloszenieDTO> ogloszenieDTOS = ogloszenieService.getOgloszeniaByIdUzytkownika(idUzytkownika);
        return new ResponseEntity<>(ogloszenieDTOS, HttpStatus.OK);
    }

    @PostMapping
    public ResponseEntity<OgloszenieDTO> createOgloszenie(@RequestBody OgloszenieDTO ogloszenieDTO) {

        OgloszenieDTO savedOgloszenie = ogloszenieService.save(ogloszenieDTO);

        return new ResponseEntity<>(savedOgloszenie, HttpStatus.CREATED);
    }
}
