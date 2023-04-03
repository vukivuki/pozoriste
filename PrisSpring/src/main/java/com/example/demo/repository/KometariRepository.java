package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.Kometari;
import model.Predstava;

public interface KometariRepository extends JpaRepository<Kometari, Integer>{
	@Query("select k from Kometari k where k.predstava = :predstava")
    List<Kometari> findByPredstava(@Param("predstava")Predstava predstava);
}
