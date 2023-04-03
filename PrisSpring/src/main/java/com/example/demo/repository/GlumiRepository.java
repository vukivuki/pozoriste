package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.Glumi;
import model.Predstava;

public interface GlumiRepository extends JpaRepository<Glumi, Integer>{
	@Query("select g from Glumi g where g.uloga.predstava = :p")
	List<Glumi> findByPredstava(@Param("p")Predstava p);
}
