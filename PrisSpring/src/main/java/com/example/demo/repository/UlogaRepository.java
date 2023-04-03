package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.Predstava;
import model.Uloga;

public interface UlogaRepository extends JpaRepository<Uloga, Integer>{
	@Query("select u from Uloga u where u.predstava = :predstava")
	List<Uloga> findByPredstava(@Param("predstava")Predstava p);
}
