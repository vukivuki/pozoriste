package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the glumiuizvodjenju database table.
 * 
 */
@Entity
@NamedQuery(name="Glumiuizvodjenju.findAll", query="SELECT g FROM Glumiuizvodjenju g")
public class Glumiuizvodjenju implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idglumiuizvodjenju;

	//bi-directional many-to-one association to Izvodjenje
	@ManyToOne
	private Izvodjenje izvodjenje;

	public Glumiuizvodjenju() {
	}

	public int getIdglumiuizvodjenju() {
		return this.idglumiuizvodjenju;
	}

	public void setIdglumiuizvodjenju(int idglumiuizvodjenju) {
		this.idglumiuizvodjenju = idglumiuizvodjenju;
	}

	public Izvodjenje getIzvodjenje() {
		return this.izvodjenje;
	}

	public void setIzvodjenje(Izvodjenje izvodjenje) {
		this.izvodjenje = izvodjenje;
	}

}