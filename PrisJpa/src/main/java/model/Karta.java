package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the karta database table.
 * 
 */
@Entity
@NamedQuery(name="Karta.findAll", query="SELECT k FROM Karta k")
public class Karta implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idkarta;

	private double cena;

	@Temporal(TemporalType.DATE)
	@Column(name="`datum rezervacije`")
	private Date datum_rezervacije;

	//bi-directional many-to-one association to Izvodjenje
	@ManyToOne
	private Izvodjenje izvodjenje;

	//bi-directional many-to-one association to Korisnik
	@ManyToOne
	private Korisnik korisnik;

	//bi-directional many-to-one association to Mesto
	@ManyToOne
	private Mesto mesto;

	public Karta() {
	}

	public int getIdkarta() {
		return this.idkarta;
	}

	public void setIdkarta(int idkarta) {
		this.idkarta = idkarta;
	}

	public double getCena() {
		return this.cena;
	}

	public void setCena(double cena) {
		this.cena = cena;
	}

	public Date getDatum_rezervacije() {
		return this.datum_rezervacije;
	}

	public void setDatum_rezervacije(Date datum_rezervacije) {
		this.datum_rezervacije = datum_rezervacije;
	}

	public Izvodjenje getIzvodjenje() {
		return this.izvodjenje;
	}

	public void setIzvodjenje(Izvodjenje izvodjenje) {
		this.izvodjenje = izvodjenje;
	}

	public Korisnik getKorisnik() {
		return this.korisnik;
	}

	public void setKorisnik(Korisnik korisnik) {
		this.korisnik = korisnik;
	}

	public Mesto getMesto() {
		return this.mesto;
	}

	public void setMesto(Mesto mesto) {
		this.mesto = mesto;
	}

}