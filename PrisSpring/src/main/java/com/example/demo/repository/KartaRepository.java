package com.example.demo.repository;

import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.Karta;

public interface KartaRepository extends JpaRepository<Karta, Integer>{

	@Query("select SUM(k.cena) from Karta k where k.izvodjenje.datum BETWEEN :pocetak and :kraj")
	Double izracunajProfit(@Param("pocetak")Date pocetak, @Param("kraj")Date kraj);

}
