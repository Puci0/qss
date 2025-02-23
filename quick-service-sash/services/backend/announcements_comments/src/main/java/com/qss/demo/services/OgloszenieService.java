package com.qss.demo.services;

import com.qss.demo.dto.OgloszenieDTO;

import java.util.List;
import java.util.Optional;

public interface OgloszenieService {
    List<OgloszenieDTO> getOgloszenia();
    List<OgloszenieDTO> getOgloszeniaByIdUzytkownika(Long idUzytkownika);
    OgloszenieDTO save(OgloszenieDTO ogloszenieDTO);
}
