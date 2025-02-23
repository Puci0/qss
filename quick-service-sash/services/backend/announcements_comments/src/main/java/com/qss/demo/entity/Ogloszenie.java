package com.qss.demo.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
//@NoArgsConstructor
@Getter
@Setter
@ToString
@Table(name = "ogloszenie")
public class Ogloszenie {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_ogloszenia")
    private long idOgloszenia;

    @Column(name = "tytul")
    private String tytul;

    @Column(name = "opis")
    private String opis;

    @Column(name = "id_uzytkownika")
    private long idUzytkownika;

    @ToString.Exclude
    // domyślnie nie zostaną pobrane powiązane encje "polubienie"
    // wiązanie dwukierunkowe, umożliwia odwołanie się do powiązanych polubień
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "ogloszenie", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Polubienie> polubienia;

    @Column(name = "data_utworzenia")
    private LocalDateTime dataUtworzenia;

    @ToString.Exclude
    // przy usunięciu ogłoszenia z bazy, zostaną usunięte również jego komentarze
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "ogloszenie", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Komentarz> komentarze;

    @ToString.Exclude
    @ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.DETACH,
                                                    CascadeType.MERGE, CascadeType.REFRESH})
    @JoinTable(
            name = "ogloszenie_podkategoria",
            joinColumns = @JoinColumn(name = "id_ogloszenia"),
            inverseJoinColumns = @JoinColumn(name = "id_podkategorii")
    )
    private List<Podkategoria> podkategorie;

    public void addPolubienie(Polubienie polubienie) {

        if(polubienia == null) {
            polubienia = new ArrayList<>();
        }

        polubienia.add(polubienie);
    }

    public void addPodkategorie(Podkategoria podkategoria) {

        if(podkategorie == null) {
            podkategorie = new ArrayList<>();
        }

        podkategorie.add(podkategoria);
    }

    public void addKomentarz(Komentarz komentarz) {

        if(komentarze == null) {
            komentarze = new ArrayList<>();
        }

        komentarze.add(komentarz);
    }
    @Builder
    public Ogloszenie(long idUzytkownika, String tytul, String opis,  LocalDateTime dataUtworzenia) {
        this.tytul = tytul;
        this.opis = opis;
        this.idUzytkownika = idUzytkownika;
        this.dataUtworzenia = dataUtworzenia;
    }

    public long getIdOgloszenia() {
        return idOgloszenia;
    }

    public String getTytul() {
        return tytul;
    }

    public String getOpis() {
        return opis;
    }

    public long getIdUzytkownika() {
        return idUzytkownika;
    }

    public List<Polubienie> getPolubienia() {
        return polubienia;
    }

    public LocalDateTime getDataUtworzenia() {
        return dataUtworzenia;
    }

    public List<Komentarz> getKomentarze() {
        return komentarze;
    }

    public List<Podkategoria> getPodkategorie() {
        return podkategorie;
    }

    public Ogloszenie() {
    }
}
