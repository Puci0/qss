package com.qss.demo.repositories;

import com.qss.demo.entity.Komentarz;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface KomentarzRepozytorium extends JpaRepository<Komentarz, Long> {
}
