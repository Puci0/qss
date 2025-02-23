package com.qss.demo.repositories;

import com.qss.demo.entity.Ogloszenie;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface OgloszenieRepozytorium extends JpaRepository<Ogloszenie, Long> {

    @EntityGraph(attributePaths = {"polubienia"})
    @Query("SELECT o FROM Ogloszenie o")
    List<Ogloszenie> findAllWithPolubienia();

    @Query("Select o FROM Ogloszenie o WHERE o.idUzytkownika = :idUzytkownika")
    List<Ogloszenie> findByIdUzytkownika(@Param("idUzytkownika") Long idUzytkownika);

    @Query("Select o FROM Ogloszenie o JOIN o.podkategorie p WHERE p.idPodkategorii = :idPodkategorii")
    List<Ogloszenie> getOgloszeniaByIdPodkategorii(@Param("idPodkategorii") Long idPodkategorii);

    @Query("SELECT o FROM Ogloszenie o JOIN o.podkategorie p WHERE p.nazwa = :podkategoria")
    List<Ogloszenie> getOgloszeniaByNazwaPodkategorii(@Param("podkategoria") String podkategoria);

    @Query("SELECT o FROM Ogloszenie o WHERE o.dataUtworzenia > :data")
    List<Ogloszenie> getOgloszeniaByDataDodaniaAfter(@Param("data") LocalDateTime data);
}
