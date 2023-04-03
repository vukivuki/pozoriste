package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the kategorijapredstave database table.
 * 
 */
@Entity
@NamedQuery(name="Kategorijapredstave.findAll", query="SELECT k FROM Kategorijapredstave k")
public class Kategorijapredstave implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idKategorijaPredstave;

	//bi-directional many-to-one association to Kategorija
	@ManyToOne
	private Kategorija kategorija;

	//bi-directional many-to-one association to Predstava
	@ManyToOne
	private Predstava predstava;

	public Kategorijapredstave() {
	}

	public int getIdKategorijaPredstave() {
		return this.idKategorijaPredstave;
	}

	public void setIdKategorijaPredstave(int idKategorijaPredstave) {
		this.idKategorijaPredstave = idKategorijaPredstave;
	}

	public Kategorija getKategorija() {
		return this.kategorija;
	}

	public void setKategorija(Kategorija kategorija) {
		this.kategorija = kategorija;
	}

	public Predstava getPredstava() {
		return this.predstava;
	}

	public void setPredstava(Predstava predstava) {
		this.predstava = predstava;
	}

}