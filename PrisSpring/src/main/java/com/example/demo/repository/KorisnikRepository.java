package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import model.Korisnik;

public interface KorisnikRepository extends JpaRepository<Korisnik, Integer>{
	@Query("select k from Korisnik k where k.username like 'admin%'")
	List<Korisnik> findAllByAdmins();
	
	Korisnik findByUsernameAndPassword(String user,String password);
	
	Korisnik findByUsername(String username);

}
