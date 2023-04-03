package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the kategorija database table.
 * 
 */
@Entity
@NamedQuery(name="Kategorija.findAll", query="SELECT k FROM Kategorija k")
public class Kategorija implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idkategorija;

	private String naziv;

	//bi-directional many-to-one association to Kategorijapredstave
	@OneToMany(mappedBy="kategorija")
	private List<Kategorijapredstave> kategorijapredstaves;

	public Kategorija() {
	}

	public int getIdkategorija() {
		return this.idkategorija;
	}

	public void setIdkategorija(int idkategorija) {
		this.idkategorija = idkategorija;
	}

	public String getNaziv() {
		return this.naziv;
	}

	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}

	public List<Kategorijapredstave> getKategorijapredstaves() {
		return this.kategorijapredstaves;
	}

	public void setKategorijapredstaves(List<Kategorijapredstave> kategorijapredstaves) {
		this.kategorijapredstaves = kategorijapredstaves;
	}

	public Kategorijapredstave addKategorijapredstave(Kategorijapredstave kategorijapredstave) {
		getKategorijapredstaves().add(kategorijapredstave);
		kategorijapredstave.setKategorija(this);

		return kategorijapredstave;
	}

	public Kategorijapredstave removeKategorijapredstave(Kategorijapredstave kategorijapredstave) {
		getKategorijapredstaves().remove(kategorijapredstave);
		kategorijapredstave.setKategorija(null);

		return kategorijapredstave;
	}

}