package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.Kategorija;
import model.Predstava;

public interface PredstavaRepository extends JpaRepository<Predstava, Integer>{

	@Query("select p from Predstava p inner join p.kategorijapredstaves kp where kp.kategorija = :k")
	List<Predstava> filtriraj(@Param("k")Kategorija kategorija);

}
