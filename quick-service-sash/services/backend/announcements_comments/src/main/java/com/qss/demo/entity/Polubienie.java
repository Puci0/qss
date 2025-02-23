package com.qss.demo.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
//@NoArgsConstructor
@Getter
@Setter
@ToString
@Table(name = "polubienia")
public class Polubienie {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_polubienia")
    private long idPolubienia;

    @ToString.Exclude
    // domyślnie podczas pobierania obiektu "Polubienie" zostanie pobrany powiązany obiekt "Ogloszenie"
    @ManyToOne(cascade = {CascadeType.MERGE, CascadeType.DETACH,
                            CascadeType.MERGE, CascadeType.REFRESH})
    @JoinColumn(name = "id_ogloszenia")
    private Ogloszenie ogloszenie;

    @Column(name = "id_uzytkownika")
    private long idUzytkownika;

    @Column(name = "Typ")
    private char typ;

    @Builder
    public Polubienie(Ogloszenie ogloszenie, long idUzytkownika, char typ) {
        this.ogloszenie = ogloszenie;
        this.idUzytkownika = idUzytkownika;
        this.typ = typ;
    }

    public long getIdPolubienia() {
        return idPolubienia;
    }

    public Ogloszenie getOgloszenie() {
        return ogloszenie;
    }

    public long getIdUzytkownika() {
        return idUzytkownika;
    }

    public char getTyp() {
        return typ;
    }

    public Polubienie() {
    }
}
