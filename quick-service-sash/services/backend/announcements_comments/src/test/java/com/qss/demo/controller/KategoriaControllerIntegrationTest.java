package com.qss.demo.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

//@SpringBootTest
//@AutoConfigureMockMvc
//@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
//@DisplayName("KategoriaController integration tests")
public class KategoriaControllerIntegrationTest {

//    @Autowired
//    private MockMvc mockMvc;
//
//    @Autowired
//    private ObjectMapper objectMapper;
//
//    @Test
//    @Order(1)
//    @DisplayName("Test 1: Getting Kategoria list")
//    public void getKategoriaDTOs() throws Exception {
//
//        // sending GET request to "/api/kategorie"
//        ResultActions response = mockMvc.perform(get("/api/kategorie"));
//
//        // checking data correctness
//        response.andExpect(status().isOk())
//                .andDo(print());
//    }
}
