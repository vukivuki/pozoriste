package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the korisnik database table.
 * 
 */
@Entity
@NamedQuery(name="Korisnik.findAll", query="SELECT k FROM Korisnik k")
public class Korisnik implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idkorisnik;

	private String email;

	private String ime;

	private String password;

	private String prezime;

	private String username;

	//bi-directional many-to-one association to Karta
	@OneToMany(mappedBy="korisnik")
	private List<Karta> kartas;

	//bi-directional many-to-one association to Kometari
	@OneToMany(mappedBy="korisnik")
	private List<Kometari> kometaris;

	//bi-directional many-to-many association to Uloga
	@ManyToMany(mappedBy="korisniks")
	private List<Uloga> ulogas;

	//bi-directional many-to-one association to Predstava
	@OneToMany(mappedBy="korisnik")
	private List<Predstava> predstavas;

	//bi-directional many-to-one association to Repertoar
	@OneToMany(mappedBy="korisnik")
	private List<Repertoar> repertoars;

	public Korisnik() {
	}

	public int getIdkorisnik() {
		return this.idkorisnik;
	}

	public void setIdkorisnik(int idkorisnik) {
		this.idkorisnik = idkorisnik;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getIme() {
		return this.ime;
	}

	public void setIme(String ime) {
		this.ime = ime;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPrezime() {
		return this.prezime;
	}

	public void setPrezime(String prezime) {
		this.prezime = prezime;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public List<Karta> getKartas() {
		return this.kartas;
	}

	public void setKartas(List<Karta> kartas) {
		this.kartas = kartas;
	}

	public Karta addKarta(Karta karta) {
		getKartas().add(karta);
		karta.setKorisnik(this);

		return karta;
	}

	public Karta removeKarta(Karta karta) {
		getKartas().remove(karta);
		karta.setKorisnik(null);

		return karta;
	}

	public List<Kometari> getKometaris() {
		return this.kometaris;
	}

	public void setKometaris(List<Kometari> kometaris) {
		this.kometaris = kometaris;
	}

	public Kometari addKometari(Kometari kometari) {
		getKometaris().add(kometari);
		kometari.setKorisnik(this);

		return kometari;
	}

	public Kometari removeKometari(Kometari kometari) {
		getKometaris().remove(kometari);
		kometari.setKorisnik(null);

		return kometari;
	}

	public List<Uloga> getUlogas() {
		return this.ulogas;
	}

	public void setUlogas(List<Uloga> ulogas) {
		this.ulogas = ulogas;
	}

	public List<Predstava> getPredstavas() {
		return this.predstavas;
	}

	public void setPredstavas(List<Predstava> predstavas) {
		this.predstavas = predstavas;
	}

	public Predstava addPredstava(Predstava predstava) {
		getPredstavas().add(predstava);
		predstava.setKorisnik(this);

		return predstava;
	}

	public Predstava removePredstava(Predstava predstava) {
		getPredstavas().remove(predstava);
		predstava.setKorisnik(null);

		return predstava;
	}

	public List<Repertoar> getRepertoars() {
		return this.repertoars;
	}

	public void setRepertoars(List<Repertoar> repertoars) {
		this.repertoars = repertoars;
	}

	public Repertoar addRepertoar(Repertoar repertoar) {
		getRepertoars().add(repertoar);
		repertoar.setKorisnik(this);

		return repertoar;
	}

	public Repertoar removeRepertoar(Repertoar repertoar) {
		getRepertoars().remove(repertoar);
		repertoar.setKorisnik(null);

		return repertoar;
	}

}