package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the izvodjenje database table.
 * 
 */
@Entity
@NamedQuery(name="Izvodjenje.findAll", query="SELECT i FROM Izvodjenje i")
public class Izvodjenje implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idizvodjenje;

	@Temporal(TemporalType.DATE)
	private Date datum;

	//bi-directional many-to-one association to Glumiuizvodjenju
	@OneToMany(mappedBy="izvodjenje")
	private List<Glumiuizvodjenju> glumiuizvodjenjus;

	//bi-directional many-to-one association to Predstava
	@ManyToOne
	private Predstava predstava;

	//bi-directional many-to-one association to Repertoar
	@ManyToOne
	private Repertoar repertoar;

	//bi-directional many-to-one association to Sala
	@ManyToOne
	private Sala sala;

	//bi-directional many-to-one association to Karta
	@OneToMany(mappedBy="izvodjenje")
	private List<Karta> kartas;

	public Izvodjenje() {
	}

	public int getIdizvodjenje() {
		return this.idizvodjenje;
	}

	public void setIdizvodjenje(int idizvodjenje) {
		this.idizvodjenje = idizvodjenje;
	}

	public Date getDatum() {
		return this.datum;
	}

	public void setDatum(Date datum) {
		this.datum = datum;
	}

	public List<Glumiuizvodjenju> getGlumiuizvodjenjus() {
		return this.glumiuizvodjenjus;
	}

	public void setGlumiuizvodjenjus(List<Glumiuizvodjenju> glumiuizvodjenjus) {
		this.glumiuizvodjenjus = glumiuizvodjenjus;
	}

	public Glumiuizvodjenju addGlumiuizvodjenjus(Glumiuizvodjenju glumiuizvodjenjus) {
		getGlumiuizvodjenjus().add(glumiuizvodjenjus);
		glumiuizvodjenjus.setIzvodjenje(this);

		return glumiuizvodjenjus;
	}

	public Glumiuizvodjenju removeGlumiuizvodjenjus(Glumiuizvodjenju glumiuizvodjenjus) {
		getGlumiuizvodjenjus().remove(glumiuizvodjenjus);
		glumiuizvodjenjus.setIzvodjenje(null);

		return glumiuizvodjenjus;
	}

	public Predstava getPredstava() {
		return this.predstava;
	}

	public void setPredstava(Predstava predstava) {
		this.predstava = predstava;
	}

	public Repertoar getRepertoar() {
		return this.repertoar;
	}

	public void setRepertoar(Repertoar repertoar) {
		this.repertoar = repertoar;
	}

	public Sala getSala() {
		return this.sala;
	}

	public void setSala(Sala sala) {
		this.sala = sala;
	}

	public List<Karta> getKartas() {
		return this.kartas;
	}

	public void setKartas(List<Karta> kartas) {
		this.kartas = kartas;
	}

	public Karta addKarta(Karta karta) {
		getKartas().add(karta);
		karta.setIzvodjenje(this);

		return karta;
	}

	public Karta removeKarta(Karta karta) {
		getKartas().remove(karta);
		karta.setIzvodjenje(null);

		return karta;
	}

}