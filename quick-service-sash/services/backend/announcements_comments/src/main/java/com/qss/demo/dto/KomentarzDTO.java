package com.qss.demo.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class KomentarzDTO {

    private long idKomentarza;
    private Long idUzytkownika;
    private Long idOgloszenia;
    private String tresc;
    private LocalDateTime data_utworzenia;
}
