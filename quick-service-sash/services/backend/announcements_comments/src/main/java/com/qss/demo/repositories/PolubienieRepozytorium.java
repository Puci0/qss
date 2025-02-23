package com.qss.demo.repositories;

import com.qss.demo.entity.Polubienie;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface PolubienieRepozytorium extends JpaRepository<Polubienie, Long> {
}
