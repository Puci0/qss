package com.qss.demo.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

//@NoArgsConstructor
@AllArgsConstructor
//@Getter
//@Setter
public class KategoriaDTO {

    private long idKategorii;
    private String nazwa;
    private List<PodkategoriaDTO> podkategorie;

    public long getIdKategorii() {
        return idKategorii;
    }

    public void setIdKategorii(long idKategorii) {
        this.idKategorii = idKategorii;
    }

    public List<PodkategoriaDTO> getPodkategorie() {
        return podkategorie;
    }

    public void setPodkategorie(List<PodkategoriaDTO> podkategorie) {
        this.podkategorie = podkategorie;
    }

    public String getNazwa() {
        return nazwa;
    }

    public void setNazwa(String nazwa) {
        this.nazwa = nazwa;
    }

    public KategoriaDTO() {
    }
}
