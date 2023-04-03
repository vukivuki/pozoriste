package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.Mesto;

public interface MestoRepository extends JpaRepository<Mesto, Integer>{

	@Query("select distinct m from Mesto m inner join m.sala.izvodjenjes i where i.idizvodjenje = :id and not exists (select k.mesto from Karta k where k.mesto=m and k.izvodjenje = i)")
	List<Mesto> slobodnaMesta(@Param("id")Integer idIzvodjenja);

}
