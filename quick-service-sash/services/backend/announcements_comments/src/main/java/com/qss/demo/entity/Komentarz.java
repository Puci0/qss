package com.qss.demo.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
//@NoArgsConstructor
@Getter
@Setter
@ToString
@Table(name = "komentarz")
public class Komentarz {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_komentarza")
    private long idKomentarza;

    @Column(name = "id_uzytkownika")
    private long idUżytkownika;

    @ToString.Exclude
    @ManyToOne(cascade = {CascadeType.DETACH, CascadeType.MERGE,
                            CascadeType.PERSIST, CascadeType.REFRESH})
    @JoinColumn(name = "id_ogloszenia")
    private Ogloszenie ogloszenie;

    @Column(name = "tresc")
    private String tresc;

    @Column(name = "data_utworzenia")
    private LocalDateTime data_utworzenia;

    @Builder
    public Komentarz(long idUżytkownika, Ogloszenie ogloszenie, String tresc, LocalDateTime data_utworzenia) {
        this.idUżytkownika = idUżytkownika;
        this.ogloszenie = ogloszenie;
        this.tresc = tresc;
        this.data_utworzenia = data_utworzenia;
    }

    public long getIdKomentarza() {
        return idKomentarza;
    }

    public long getIdUżytkownika() {
        return idUżytkownika;
    }

    public Ogloszenie getOgloszenie() {
        return ogloszenie;
    }

    public String getTresc() {
        return tresc;
    }

    public LocalDateTime getData_utworzenia() {
        return data_utworzenia;
    }

    public Komentarz() {
    }
}
