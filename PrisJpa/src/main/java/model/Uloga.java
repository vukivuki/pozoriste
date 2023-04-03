package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the uloga database table.
 * 
 */
@Entity
@NamedQuery(name="Uloga.findAll", query="SELECT u FROM Uloga u")
public class Uloga implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int iduloga;

	private String ime;

	//bi-directional many-to-one association to Glumi
	@OneToMany(mappedBy="uloga")
	private List<Glumi> glumis;

	//bi-directional many-to-many association to Korisnik
	@ManyToMany
	@JoinTable(
		name="korisnikuloga"
		, joinColumns={
			@JoinColumn(name="uloga_iduloga")
			}
		, inverseJoinColumns={
			@JoinColumn(name="korisnik_idkorisnik")
			}
		)
	private List<Korisnik> korisniks;

	//bi-directional many-to-one association to Predstava
	@ManyToOne
	private Predstava predstava;

	public Uloga() {
	}

	public int getIduloga() {
		return this.iduloga;
	}

	public void setIduloga(int iduloga) {
		this.iduloga = iduloga;
	}

	public String getIme() {
		return this.ime;
	}

	public void setIme(String ime) {
		this.ime = ime;
	}

	public List<Glumi> getGlumis() {
		return this.glumis;
	}

	public void setGlumis(List<Glumi> glumis) {
		this.glumis = glumis;
	}

	public Glumi addGlumi(Glumi glumi) {
		getGlumis().add(glumi);
		glumi.setUloga(this);

		return glumi;
	}

	public Glumi removeGlumi(Glumi glumi) {
		getGlumis().remove(glumi);
		glumi.setUloga(null);

		return glumi;
	}

	public List<Korisnik> getKorisniks() {
		return this.korisniks;
	}

	public void setKorisniks(List<Korisnik> korisniks) {
		this.korisniks = korisniks;
	}

	public Predstava getPredstava() {
		return this.predstava;
	}

	public void setPredstava(Predstava predstava) {
		this.predstava = predstava;
	}

}