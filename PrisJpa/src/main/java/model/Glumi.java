package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the glumi database table.
 * 
 */
@Entity
@NamedQuery(name="Glumi.findAll", query="SELECT g FROM Glumi g")
public class Glumi implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idglumi;

	//bi-directional many-to-one association to Glumac
	@ManyToOne
	private Glumac glumac;

	//bi-directional many-to-one association to Uloga
	@ManyToOne
	private Uloga uloga;

	public Glumi() {
	}

	public int getIdglumi() {
		return this.idglumi;
	}

	public void setIdglumi(int idglumi) {
		this.idglumi = idglumi;
	}

	public Glumac getGlumac() {
		return this.glumac;
	}

	public void setGlumac(Glumac glumac) {
		this.glumac = glumac;
	}

	public Uloga getUloga() {
		return this.uloga;
	}

	public void setUloga(Uloga uloga) {
		this.uloga = uloga;
	}

}