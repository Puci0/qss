package com.qss.demo.dto;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.List;

//@NoArgsConstructor
@AllArgsConstructor
public class OgloszenieDTO {

    private long idOgloszenia;
    private Long idUzytkownika;
    private String tytul;
    private String opis;
    private LocalDateTime dataUtworzenia;

    public long getIdOgloszenia() {
        return idOgloszenia;
    }

    public void setIdOgloszenia(long idOgloszenia) {
        this.idOgloszenia = idOgloszenia;
    }

    public LocalDateTime getDataUtworzenia() {
        return dataUtworzenia;
    }

    public void setDataUtworzenia(LocalDateTime dataUtworzenia) {
        this.dataUtworzenia = dataUtworzenia;
    }

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }

    public String getTytul() {
        return tytul;
    }

    public void setTytul(String tytul) {
        this.tytul = tytul;
    }

    public Long getIdUzytkownika() {
        return idUzytkownika;
    }

    public void setIdUzytkownika(Long idUzytkownika) {
        this.idUzytkownika = idUzytkownika;
    }

    public OgloszenieDTO() {
    }
}
