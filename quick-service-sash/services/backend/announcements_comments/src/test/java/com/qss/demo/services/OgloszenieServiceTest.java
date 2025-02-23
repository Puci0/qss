package com.qss.demo.services;

import com.qss.demo.dto.OgloszenieDTO;
import com.qss.demo.entity.Ogloszenie;
import com.qss.demo.repositories.OgloszenieRepozytorium;
import com.qss.demo.services.impl.OgloszenieServiceImpl;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.modelmapper.ModelMapper;

import java.util.Arrays;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.*;


import static org.mockito.Mockito.when;

public class OgloszenieServiceTest {

    @Mock
    private OgloszenieRepozytorium ogloszenieRepozytorium;

    @Mock
    private ModelMapper mapper;

    @InjectMocks
    private OgloszenieServiceImpl ogloszenieService;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void getOgloszenia_shouldReturnListOfOgloszenieDTOs() {
//
//        Ogloszenie ogloszenieA = DataTest.createOgloszenieA();
//        Ogloszenie ogloszenieB = DataTest.createOgloszenieB();
//        Ogloszenie ogloszenieC = DataTest.createOgloszenieC();
//
//        OgloszenieDTO dtoA = new OgloszenieDTO();
//        OgloszenieDTO dtoB = new OgloszenieDTO();
//        OgloszenieDTO dtoC = new OgloszenieDTO();
//
//        when(ogloszenieRepozytorium.findAll()).thenReturn(Arrays.asList(ogloszenieA, ogloszenieB, ogloszenieC));
//        when(mapper.map(ogloszenieA, OgloszenieDTO.class)).thenReturn(dtoA);
//        when(mapper.map(ogloszenieB, OgloszenieDTO.class)).thenReturn(dtoB);
//        when(mapper.map(ogloszenieC, OgloszenieDTO.class)).thenReturn(dtoC);
//
//        List<OgloszenieDTO> result = ogloszenieService.getOgloszenia();
//
//        assertThat(result)
//                .hasSize(3)
//                .containsExactly(dtoA, dtoB, dtoC);
//
//        verify(ogloszenieRepozytorium, times(1)).findAll();
//        verify(mapper, times(1)).map(ogloszenieA, OgloszenieDTO.class);
//        verify(mapper, times(1)).map(ogloszenieB, OgloszenieDTO.class);
//        verify(mapper, times(1)).map(ogloszenieC, OgloszenieDTO.class);
    }
}
