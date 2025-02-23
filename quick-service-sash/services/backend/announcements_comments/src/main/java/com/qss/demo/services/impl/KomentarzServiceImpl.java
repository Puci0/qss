package com.qss.demo.services.impl;

import com.qss.demo.entity.Komentarz;
import com.qss.demo.repositories.KomentarzRepozytorium;
import com.qss.demo.services.KomentarzService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KomentarzServiceImpl implements KomentarzService {

    private final KomentarzRepozytorium komentarzRepozytorium;

    public KomentarzServiceImpl(KomentarzRepozytorium komentarzRepozytorium) {
        this.komentarzRepozytorium = komentarzRepozytorium;
    }

    @Override
    public List<Komentarz> findAll() {
        return komentarzRepozytorium.findAll();
    }

    @Override
    public Komentarz save(Komentarz komentarz) {
        return komentarzRepozytorium.save(komentarz);
    }

    @Override
    public Komentarz update(Komentarz komentarz) {
        return null;
    }

    @Override
    public void delete(Long id) {
        komentarzRepozytorium.deleteById(id);
    }
}
