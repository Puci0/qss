package com.qss.demo.dto;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class OgloszeniePodkategoriaDTO {

    private long id;
    private OgloszenieDTO ogloszenie;
    private PodkategoriaDTO podkategoria;

}
