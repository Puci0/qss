package com.qss.demo.repositories;

import com.qss.demo.dto.OgloszenieDTO;
import com.qss.demo.entity.Ogloszenie;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.Assert.assertNotNull;

@RunWith(SpringRunner.class)
@DataJpaTest
public class OgloszenieRepositoryTest {

    @Autowired
    private OgloszenieRepozytorium ogloszenieRepozytorium;

    @Test
    //sprawdza czy dane sa dobrze pobierane z bazy
    public void shouldFindAllOgloszenia() {
        List<Ogloszenie> ogloszenia = ogloszenieRepozytorium.findAll();

        assertNotNull(ogloszenia);
        assertThat(ogloszenia).asList().hasSize(8);

        assertThat(ogloszenia).extracting(Ogloszenie::getTytul)
                .contains(
                        "Sprzedam iPhone 12",
                        "Nowy laptop Dell",
                        "Sofa skórzana",
                        "Kurtka zimowa",
                        "Rower górski",
                        "Toyota Corolla",
                        "Książka Fantasy",
                        "Zestaw kosmetyków"
                );

        assertThat(ogloszenia).extracting(Ogloszenie::getOpis)
                .contains(
                        "Używany telefon w dobrym stanie",
                        "Laptop idealny do pracy biurowej",
                        "Wygodna sofa do salonu",
                        "Stylowa kurtka na zimę",
                        "Lekki rower do jazdy terenowej",
                        "Samochód w dobrym stanie, bezwypadkowy",
                        "Nowa książka z gatunku fantasy",
                        "Idealny na prezent"
                );

    }

    @Test
    public void shouldFindOgloszenieById() {
        Optional<Ogloszenie> ogloszenie = ogloszenieRepozytorium.findById(1L);

        assertNotNull(ogloszenie);
        assertThat(ogloszenie.get().getIdUzytkownika()).isEqualTo(1L);
        assertThat(ogloszenie.get().getOpis()).isEqualTo("Używany telefon w dobrym stanie");
        assertThat(ogloszenie.get().getTytul()).isEqualTo("Sprzedam iPhone 12");
        assertThat(ogloszenie.get().getDataUtworzenia()).isEqualTo(LocalDateTime.of(2024,12,1,10, 0,0,0));
   }

   @Test
   public void shouldNotFindOgloszenieById() {
       Optional<Ogloszenie> ogloszenie = ogloszenieRepozytorium.findById(999L);
       assertThat(ogloszenie).isEmpty();
   }

   @Test
    public void shouldSaveOgloszenie() {
       Ogloszenie ogloszenie1 = new Ogloszenie(1L, "tytul1", "opis1", LocalDateTime.now());
       Ogloszenie savedOgloszenie = ogloszenieRepozytorium.save(ogloszenie1);

       Optional<Ogloszenie> fetchedOgloszenie = ogloszenieRepozytorium.findById(savedOgloszenie.getIdOgloszenia());

       assertThat(fetchedOgloszenie).isPresent();

       assertThat(fetchedOgloszenie.get().getTytul()).isEqualTo("tytul1");
       assertThat(fetchedOgloszenie.get().getOpis()).isEqualTo("opis1");
       assertThat(fetchedOgloszenie.get().getDataUtworzenia()).isNotNull();
       assertThat(fetchedOgloszenie.get().getIdOgloszenia()).isNotNull();
   }
}
