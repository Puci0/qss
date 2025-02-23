package com.qss.demo.repositories;

import com.qss.demo.entity.Kategoria;
import com.qss.demo.entity.Podkategoria;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

@DataJpaTest
public class KategoriaRepositoryTest {

    @Autowired
    private KategoriaRepozytorium kategoriaRepozytorium;

    @Autowired
    private TestEntityManager entityManager;

    @Test
    public void getAllCategories() {

        Kategoria testKategoria = entityManager.find(Kategoria.class, 1);

        List<Kategoria> kategorie = kategoriaRepozytorium.findAllWithSubcategories();

        assertThat(kategorie).isNotNull();
        assertThat(kategorie).hasSize(8);
        assertThat(kategorie).contains(testKategoria);

        Kategoria elektronika = kategorie.stream()
                .filter(k -> k.getNazwa().equalsIgnoreCase("elektronika"))
                .findFirst()
                .orElse(null);

        assertThat(elektronika).isNotNull();
        assertThat(elektronika.getPodkategorie()).hasSize(2);

        assertThat(elektronika.getPodkategorie())
                .extracting(Podkategoria::getNazwa)
                .contains("Smartfony", "Laptopy");

        Kategoria sport = kategorie.stream()
                .filter(k -> k.getNazwa().equalsIgnoreCase("sport i rekreacja"))
                .findFirst()
                .orElse(null);

        assertThat(sport).isNotNull();
        assertThat(sport.getPodkategorie()).hasSize(2);
        assertThat(sport.getPodkategorie())
                .extracting(Podkategoria::getNazwa)
                .contains("Rowery", "Sprzęt fitness");

        for (Kategoria kategoria: kategorie) {
            System.out.println("Kategoria: " + kategoria.getNazwa());
            for (Podkategoria podkategoria: kategoria.getPodkategorie()) {
                System.out.println("Podkategorie: " + podkategoria.getNazwa());
            }
            System.out.println("---------------------------------------------- ");
        }
    }
}
