package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the predstava database table.
 * 
 */
@Entity
@NamedQuery(name="Predstava.findAll", query="SELECT p FROM Predstava p")
public class Predstava implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idpredstava;

	private String naziv;

	private String opis;

	private int trajanje;

	//bi-directional many-to-one association to Izvodjenje
	@OneToMany(mappedBy="predstava")
	private List<Izvodjenje> izvodjenjes;

	//bi-directional many-to-one association to Kategorijapredstave
	@OneToMany(mappedBy="predstava")
	private List<Kategorijapredstave> kategorijapredstaves;

	//bi-directional many-to-one association to Kometari
	@OneToMany(mappedBy="predstava")
	private List<Kometari> kometaris;

	//bi-directional many-to-one association to Korisnik
	@ManyToOne
	private Korisnik korisnik;

	//bi-directional many-to-one association to Uloga
	@OneToMany(mappedBy="predstava")
	private List<Uloga> ulogas;

	public Predstava() {
	}

	public int getIdpredstava() {
		return this.idpredstava;
	}

	public void setIdpredstava(int idpredstava) {
		this.idpredstava = idpredstava;
	}

	public String getNaziv() {
		return this.naziv;
	}

	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}

	public String getOpis() {
		return this.opis;
	}

	public void setOpis(String opis) {
		this.opis = opis;
	}

	public int getTrajanje() {
		return this.trajanje;
	}

	public void setTrajanje(int trajanje) {
		this.trajanje = trajanje;
	}

	public List<Izvodjenje> getIzvodjenjes() {
		return this.izvodjenjes;
	}

	public void setIzvodjenjes(List<Izvodjenje> izvodjenjes) {
		this.izvodjenjes = izvodjenjes;
	}

	public Izvodjenje addIzvodjenje(Izvodjenje izvodjenje) {
		getIzvodjenjes().add(izvodjenje);
		izvodjenje.setPredstava(this);

		return izvodjenje;
	}

	public Izvodjenje removeIzvodjenje(Izvodjenje izvodjenje) {
		getIzvodjenjes().remove(izvodjenje);
		izvodjenje.setPredstava(null);

		return izvodjenje;
	}

	public List<Kategorijapredstave> getKategorijapredstaves() {
		return this.kategorijapredstaves;
	}

	public void setKategorijapredstaves(List<Kategorijapredstave> kategorijapredstaves) {
		this.kategorijapredstaves = kategorijapredstaves;
	}

	public Kategorijapredstave addKategorijapredstave(Kategorijapredstave kategorijapredstave) {
		getKategorijapredstaves().add(kategorijapredstave);
		kategorijapredstave.setPredstava(this);

		return kategorijapredstave;
	}

	public Kategorijapredstave removeKategorijapredstave(Kategorijapredstave kategorijapredstave) {
		getKategorijapredstaves().remove(kategorijapredstave);
		kategorijapredstave.setPredstava(null);

		return kategorijapredstave;
	}

	public List<Kometari> getKometaris() {
		return this.kometaris;
	}

	public void setKometaris(List<Kometari> kometaris) {
		this.kometaris = kometaris;
	}

	public Kometari addKometari(Kometari kometari) {
		getKometaris().add(kometari);
		kometari.setPredstava(this);

		return kometari;
	}

	public Kometari removeKometari(Kometari kometari) {
		getKometaris().remove(kometari);
		kometari.setPredstava(null);

		return kometari;
	}

	public Korisnik getKorisnik() {
		return this.korisnik;
	}

	public void setKorisnik(Korisnik korisnik) {
		this.korisnik = korisnik;
	}

	public List<Uloga> getUlogas() {
		return this.ulogas;
	}

	public void setUlogas(List<Uloga> ulogas) {
		this.ulogas = ulogas;
	}

	public Uloga addUloga(Uloga uloga) {
		getUlogas().add(uloga);
		uloga.setPredstava(this);

		return uloga;
	}

	public Uloga removeUloga(Uloga uloga) {
		getUlogas().remove(uloga);
		uloga.setPredstava(null);

		return uloga;
	}

}