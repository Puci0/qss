package com.qss.demo.services;

import com.qss.demo.dto.KategoriaDTO;
import com.qss.demo.entity.Kategoria;

import java.util.List;
import java.util.Optional;

public interface KategoriaService {

    List<KategoriaDTO> getCategoriesWithSubcategories();

    KategoriaDTO addCategoryWithSubCategories(KategoriaDTO kategoriaDTO);
}
