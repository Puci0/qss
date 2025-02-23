package com.qss.demo.services.impl;

import com.qss.demo.dto.OgloszenieDTO;
import com.qss.demo.entity.Ogloszenie;
import com.qss.demo.repositories.OgloszenieRepozytorium;
import com.qss.demo.services.OgloszenieService;
import jakarta.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class OgloszenieServiceImpl implements OgloszenieService {

    private final OgloszenieRepozytorium ogloszenieRepozytorium;
    private final ModelMapper mapper;

    public OgloszenieServiceImpl(OgloszenieRepozytorium ogloszenieRepozytorium, ModelMapper mapper) {
        this.ogloszenieRepozytorium = ogloszenieRepozytorium;
        this.mapper = mapper;
    }

    @Override
    public List<OgloszenieDTO> getOgloszenia() {
        return ogloszenieRepozytorium.findAll().stream()
                .map(ogloszenie -> mapper.map(ogloszenie, OgloszenieDTO.class))
                .collect(Collectors.toList());
    }

    @Override
    public List<OgloszenieDTO> getOgloszeniaByIdUzytkownika(Long idUzytkownika) {
        return ogloszenieRepozytorium.findByIdUzytkownika(idUzytkownika).stream()
                .map(ogloszenie -> mapper.map(ogloszenie, OgloszenieDTO.class))
                .collect(Collectors.toList());
    }


    @Override
    public OgloszenieDTO save(OgloszenieDTO ogloszenieDTO) {
        Ogloszenie ogloszenie = mapper.map(ogloszenieDTO, Ogloszenie.class);
        ogloszenieRepozytorium.save(ogloszenie);

        return mapper.map(ogloszenie, OgloszenieDTO.class);
    }
}
