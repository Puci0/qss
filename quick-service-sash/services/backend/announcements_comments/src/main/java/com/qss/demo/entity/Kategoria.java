package com.qss.demo.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.ArrayList;
import java.util.List;

//@NoArgsConstructor
//@Getter
//@Setter
@ToString
@Entity
@Table(name = "kategoria", schema = "public")
@NamedEntityGraph(
        name = "Kategorie.podkategorie",    // unikalna nazwa grafu
        attributeNodes = @NamedAttributeNode("podkategorie")    // relacje, które zostaną załadowane
)
public class Kategoria {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_kategorii")
    private long idKategorii;

    @Column(name = "nazwa", nullable = false, unique = true)
    private String nazwa;

    @ManyToMany( fetch = FetchType.LAZY, cascade = {CascadeType.DETACH, CascadeType.MERGE,
                                                        CascadeType.PERSIST, CascadeType.REFRESH})
    @JoinTable(
            name = "kategoria_podkategoria",
            joinColumns = @JoinColumn(name = "id_kategorii"),
            inverseJoinColumns = @JoinColumn(name = "id_podkategorii")
    )
    private List<Podkategoria> podkategorie;

    public Kategoria(String nazwa) {
        this.nazwa = nazwa;
    }

    public void addPodkategoria(Podkategoria podkategoria) {

        if(podkategorie == null) {
            podkategorie = new ArrayList<>();
        }

        podkategorie.add(podkategoria);
    }

    public long getIdKategorii() {
        return idKategorii;
    }

    public void setIdKategorii(long idKategorii) {
        this.idKategorii = idKategorii;
    }

    public List<Podkategoria> getPodkategorie() {
        return podkategorie;
    }

    public void setPodkategorie(List<Podkategoria> podkategorie) {
        this.podkategorie = podkategorie;
    }

    public String getNazwa() {
        return nazwa;
    }

    public void setNazwa(String nazwa) {
        this.nazwa = nazwa;
    }

    public Kategoria() {
    }
}
