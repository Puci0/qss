package com.qss.demo.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.ArrayList;
import java.util.List;

@Entity
//@NoArgsConstructor
//@Getter
//@Setter
@ToString
@Table(name = "podkategoria", schema = "public")
public class Podkategoria {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_podkategorii")
    private long idPodkategorii;

    @Column(name = "nazwa", nullable = false, unique = true)
    private String nazwa;

    @ToString.Exclude
    @ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.DETACH, CascadeType.MERGE,
                                                    CascadeType.PERSIST, CascadeType.REFRESH})
    @JoinTable(
            name="ogloszenie_podkategoria",
            joinColumns = @JoinColumn(name = "id_podkategorii"),
            inverseJoinColumns = @JoinColumn(name = "id_ogloszenia")
    )
    private List<Ogloszenie> ogloszenia;

    public Podkategoria(String nazwa) {
        this.nazwa = nazwa;
    }

    public void addOgloszenie(Ogloszenie ogloszenie) {

        if(ogloszenia == null) {
            ogloszenia = new ArrayList<>();
        }

        ogloszenia.add(ogloszenie);
    }

    public long getIdPodkategorii() {
        return idPodkategorii;
    }

    public void setIdPodkategorii(long idPodkategorii) {
        this.idPodkategorii = idPodkategorii;
    }

    public List<Ogloszenie> getOgloszenia() {
        return ogloszenia;
    }

    public void setOgloszenia(List<Ogloszenie> ogloszenia) {
        this.ogloszenia = ogloszenia;
    }

    public String getNazwa() {
        return nazwa;
    }

    public void setNazwa(String nazwa) {
        this.nazwa = nazwa;
    }

    public Podkategoria() {
    }
}
