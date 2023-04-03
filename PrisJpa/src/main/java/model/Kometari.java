package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the kometari database table.
 * 
 */
@Entity
@NamedQuery(name="Kometari.findAll", query="SELECT k FROM Kometari k")
public class Kometari implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idkometari;

	private String komentar;

	//bi-directional many-to-one association to Korisnik
	@ManyToOne
	private Korisnik korisnik;

	//bi-directional many-to-one association to Predstava
	@ManyToOne
	private Predstava predstava;

	public Kometari() {
	}

	public int getIdkometari() {
		return this.idkometari;
	}

	public void setIdkometari(int idkometari) {
		this.idkometari = idkometari;
	}

	public String getKomentar() {
		return this.komentar;
	}

	public void setKomentar(String komentar) {
		this.komentar = komentar;
	}

	public Korisnik getKorisnik() {
		return this.korisnik;
	}

	public void setKorisnik(Korisnik korisnik) {
		this.korisnik = korisnik;
	}

	public Predstava getPredstava() {
		return this.predstava;
	}

	public void setPredstava(Predstava predstava) {
		this.predstava = predstava;
	}

}