package com.qss.demo.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class PolubienieDTO {

    private long idPolubienia;
    private Long idUzytkownika;
    private Long idOgloszenia;
    private char typ;
}
