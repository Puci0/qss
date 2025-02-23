package com.qss.demo.services;

import com.qss.demo.entity.Komentarz;

import java.util.List;

public interface KomentarzService {
    List<Komentarz> findAll();
    Komentarz save(Komentarz komentarz);
    Komentarz update(Komentarz komentarz);
    void delete(Long id);
}
