package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the sala database table.
 * 
 */
@Entity
@NamedQuery(name="Sala.findAll", query="SELECT s FROM Sala s")
public class Sala implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idsala;

	private String naziv;

	//bi-directional many-to-one association to Izvodjenje
	@OneToMany(mappedBy="sala")
	private List<Izvodjenje> izvodjenjes;

	//bi-directional many-to-one association to Mesto
	@OneToMany(mappedBy="sala")
	private List<Mesto> mestos;

	public Sala() {
	}

	public int getIdsala() {
		return this.idsala;
	}

	public void setIdsala(int idsala) {
		this.idsala = idsala;
	}

	public String getNaziv() {
		return this.naziv;
	}

	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}

	public List<Izvodjenje> getIzvodjenjes() {
		return this.izvodjenjes;
	}

	public void setIzvodjenjes(List<Izvodjenje> izvodjenjes) {
		this.izvodjenjes = izvodjenjes;
	}

	public Izvodjenje addIzvodjenje(Izvodjenje izvodjenje) {
		getIzvodjenjes().add(izvodjenje);
		izvodjenje.setSala(this);

		return izvodjenje;
	}

	public Izvodjenje removeIzvodjenje(Izvodjenje izvodjenje) {
		getIzvodjenjes().remove(izvodjenje);
		izvodjenje.setSala(null);

		return izvodjenje;
	}

	public List<Mesto> getMestos() {
		return this.mestos;
	}

	public void setMestos(List<Mesto> mestos) {
		this.mestos = mestos;
	}

	public Mesto addMesto(Mesto mesto) {
		getMestos().add(mesto);
		mesto.setSala(this);

		return mesto;
	}

	public Mesto removeMesto(Mesto mesto) {
		getMestos().remove(mesto);
		mesto.setSala(null);

		return mesto;
	}

}