package com.qss.demo.repositories;

import com.qss.demo.entity.Podkategoria;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PodkategoriaRepozytorium extends JpaRepository<Podkategoria, Long> {

}
