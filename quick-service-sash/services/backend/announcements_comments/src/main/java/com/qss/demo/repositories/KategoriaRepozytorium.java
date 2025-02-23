package com.qss.demo.repositories;

import com.qss.demo.entity.Kategoria;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface KategoriaRepozytorium extends JpaRepository<Kategoria, Long> {
    Kategoria findByNazwa(String nazwa);

    // podana metoda pobierze wszystkie kategorie łącznie z powiązanymi podkategoriami
    @EntityGraph(value = "Kategorie.podkategorie", type = EntityGraph.EntityGraphType.FETCH)
    @Query("SELECT k FROM Kategoria k")
    List<Kategoria> findAllWithSubcategories();
}
