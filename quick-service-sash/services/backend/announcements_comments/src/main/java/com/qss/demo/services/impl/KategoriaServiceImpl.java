package com.qss.demo.services.impl;

import com.qss.demo.dto.KategoriaDTO;
import com.qss.demo.entity.Kategoria;
import com.qss.demo.repositories.KategoriaRepozytorium;
import com.qss.demo.services.KategoriaService;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KategoriaServiceImpl implements KategoriaService {

    private final KategoriaRepozytorium kategoriaRepozytorium;
    private final ModelMapper modelMapper;

    public KategoriaServiceImpl(KategoriaRepozytorium kategoriaRepozytorium, ModelMapper modelMapper) {
        this.kategoriaRepozytorium = kategoriaRepozytorium;
        this.modelMapper = modelMapper;
    }

    // metoda pobiera wszystkie kategorie z podkategoriami
    @Override
    public List<KategoriaDTO> getCategoriesWithSubcategories() {

        modelMapper.typeMap(Kategoria.class, KategoriaDTO.class).addMappings(mapper -> {
            mapper.map(Kategoria::getIdKategorii, KategoriaDTO::setIdKategorii);
            mapper.map(Kategoria::getNazwa, KategoriaDTO::setNazwa);
            mapper.map(Kategoria::getPodkategorie, KategoriaDTO::setPodkategorie);
        });

        List<Kategoria> kategorie = kategoriaRepozytorium.findAllWithSubcategories();

        return kategorie.stream()
                .map((category) -> modelMapper.map(category, KategoriaDTO.class))
                .toList();
    }

    @Override
    public KategoriaDTO addCategoryWithSubCategories(KategoriaDTO kategoriaDTO) {

        kategoriaDTO.setIdKategorii(0);

        Kategoria kategoria = modelMapper.map(kategoriaDTO, Kategoria.class);

        Kategoria nowaKategoria = kategoriaRepozytorium.save(kategoria);

        return modelMapper.map(nowaKategoria, KategoriaDTO.class);
    }
}
