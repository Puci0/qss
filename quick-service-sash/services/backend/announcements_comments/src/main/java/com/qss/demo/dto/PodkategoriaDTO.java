package com.qss.demo.dto;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//@NoArgsConstructor
@AllArgsConstructor
//@Getter
//@Setter
public class PodkategoriaDTO {

    private long idPodkategorii;
    private String nazwa;

    public long getIdPodkategorii() {
        return idPodkategorii;
    }

    public void setIdPodkategorii(long idPodkategorii) {
        this.idPodkategorii = idPodkategorii;
    }

    public String getNazwa() {
        return nazwa;
    }

    public void setNazwa(String nazwa) {
        this.nazwa = nazwa;
    }

    public PodkategoriaDTO() {
    }
}
