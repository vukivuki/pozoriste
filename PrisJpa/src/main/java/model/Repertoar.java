package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the repertoar database table.
 * 
 */
@Entity
@NamedQuery(name="Repertoar.findAll", query="SELECT r FROM Repertoar r")
public class Repertoar implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idrepertoar;

	//bi-directional many-to-one association to Izvodjenje
	@OneToMany(mappedBy="repertoar")
	private List<Izvodjenje> izvodjenjes;

	//bi-directional many-to-one association to Korisnik
	@ManyToOne
	private Korisnik korisnik;

	public Repertoar() {
	}

	public int getIdrepertoar() {
		return this.idrepertoar;
	}

	public void setIdrepertoar(int idrepertoar) {
		this.idrepertoar = idrepertoar;
	}

	public List<Izvodjenje> getIzvodjenjes() {
		return this.izvodjenjes;
	}

	public void setIzvodjenjes(List<Izvodjenje> izvodjenjes) {
		this.izvodjenjes = izvodjenjes;
	}

	public Izvodjenje addIzvodjenje(Izvodjenje izvodjenje) {
		getIzvodjenjes().add(izvodjenje);
		izvodjenje.setRepertoar(this);

		return izvodjenje;
	}

	public Izvodjenje removeIzvodjenje(Izvodjenje izvodjenje) {
		getIzvodjenjes().remove(izvodjenje);
		izvodjenje.setRepertoar(null);

		return izvodjenje;
	}

	public Korisnik getKorisnik() {
		return this.korisnik;
	}

	public void setKorisnik(Korisnik korisnik) {
		this.korisnik = korisnik;
	}

}