package com.example.demo.controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.repository.GlumiRepository;
import com.example.demo.repository.IzvodjenjeRepository;
import com.example.demo.repository.KartaRepository;
import com.example.demo.repository.KategorijaRepository;
import com.example.demo.repository.KategorijapredstaveRepository;
import com.example.demo.repository.KometariRepository;
import com.example.demo.repository.KorisnikRepository;
import com.example.demo.repository.MestoRepository;
import com.example.demo.repository.PredstavaRepository;
import com.example.demo.repository.UlogaRepository;

import model.Glumi;
import model.Izvodjenje;
import model.Karta;
import model.Kategorija;
import model.Kategorijapredstave;
import model.Kometari;
import model.Korisnik;
import model.Mesto;
import model.Predstava;
import model.Uloga;




@Controller
@RequestMapping(value="/predstave")
public class PredstavaController {

	List<Kometari> komentari = new ArrayList<>();
	int prva=0;
	int druga=0;
	int treca=0;
	int min = 250;
	int max = 500;
	List<Predstava> najposecenije=new ArrayList<>();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");  
	LocalDateTime now = LocalDateTime.now(); 
	
	@Autowired
	PredstavaRepository pr;
	
	@Autowired
	KategorijaRepository kr;
	
	@Autowired
	KategorijapredstaveRepository kpr;

	@Autowired
	KorisnikRepository kor;
	
	@Autowired
	UlogaRepository ur;
	
	@Autowired
	GlumiRepository gr;
	
	@Autowired
    KometariRepository komr;
	
	@Autowired
	IzvodjenjeRepository ir;
	
	@Autowired
	MestoRepository mr;
	
	@Autowired
	KartaRepository kar;
	
	@RequestMapping(value="/getPodaci", method=RequestMethod.GET)
	public String getPodaciZaCB(HttpServletRequest request) {
		List<Kategorija> kategorije = kr.findAll();
		List<Korisnik> korisnici = kor.findAllByAdmins();
		
		request.getSession().setAttribute("kategorije", kategorije);
		request.getSession().setAttribute("korisnici", korisnici);
		
		return "UnosPredstave";
	}
	
	@RequestMapping(value="/getPodaciZaRezervaciju", method=RequestMethod.GET)
	public String podaciZaRezervaciju(HttpServletRequest request) {
        Predstava p = (Predstava)request.getSession().getAttribute("predstava");
        List<Izvodjenje> izvodjenja = ir.findByPredstava(p);
    		
    	request.setAttribute("izvodjenja", izvodjenja);
    
		return "PrikazIzvodjenja";
	}
	
	
//	@RequestMapping(value = "/sid", method = RequestMethod.GET,
//            produces = MediaType.IMAGE_JPEG_VALUE)
//    public void getImage(HttpServletResponse response, HttpServletRequest request) throws IOException {
//		var imgFile = new ClassPathResource("images/1.jpg");
//
//		response.setContentType(MediaType.IMAGE_JPEG_VALUE);
//		StreamUtils.copy(imgFile.getInputStream(), response.getOutputStream());
//	}
	
	@RequestMapping(value="/getPredstave", method=RequestMethod.GET)
	public String getPodaciPredstave(HttpServletRequest request ,HttpServletResponse response) throws IOException{
		
		
//		File path = new File("C:\\Milos\\PRIS\\slike");
//		File[] allFiles = path.listFiles();
//		allImages = new BufferedImage[allFiles.length];
//		
//		for(int i = 0; i < allFiles.length; i++) {
//			try {
//				allImages[i] = ImageIO.read(allFiles[i]);
//			}catch(IOException e) {
//				
//			}
//		}
		
		
		
		List<Predstava> predstave = pr.findAll();
		List<Kategorija> kategorije = kr.findAll();
		
		request.setAttribute("predstave", predstave);
		request.setAttribute("kategorije", kategorije);
		
		return "PrikazPredstava";
	}
	@RequestMapping(value="getNajposecenije",method=RequestMethod.GET)
	public String getNajposecenije(HttpServletRequest request) {
		
		if (!najposecenije.isEmpty()) {
			najposecenije.remove(0);
		}
		
			
		if(prva>= druga && prva>=treca) {
			Predstava prva=pr.findById(1).get();
			najposecenije.add(prva);
		}else if(druga>= prva && druga>=treca) {
			Predstava druga=pr.findById(2).get();
			najposecenije.add(druga);
		}else {
			Predstava treca=pr.findById(3).get();
			najposecenije.add(treca);
		}
		
		request.setAttribute("najposecenije", najposecenije);
		System.out.println(najposecenije.get(0));
		
		return "najposec";
	}
	
	@RequestMapping(value="/getPredstaveZaProdaju",method=RequestMethod.GET)
	public String getPodaciZaProdaju(HttpServletRequest request,HttpServletResponse response) throws IOException{
		List<Predstava> predstave=pr.findAll();
		request.setAttribute("predstave", predstave);
		
		return "Prodaja";
	}
	
	@RequestMapping(value="/savePredstave", method=RequestMethod.POST)
	public String savePredstava(String naziv, Integer trajanje, String opis, Integer[] kategorije, Integer korisnik, Model m) {
		Korisnik ko = (kor.findById(korisnik)).get();
		
		Predstava p = new Predstava();
		p.setNaziv(naziv);
		p.setTrajanje(trajanje);
		p.setOpis(opis);
		p.setKorisnik(ko);
		
		Predstava predstava = pr.save(p);
		
		for(Integer id: kategorije) {
			Kategorijapredstave kp = new Kategorijapredstave();
			Kategorija k = kr.findById(id).get();
			kp.setKategorija(k);
			kp.setPredstava(predstava);
			kpr.save(kp);
		}
		
		m.addAttribute("poruka", "Uspesno ste sacuvali predstavu!");
		
		return "Success";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String loginPage() {
		return "login";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String welcomePage(ModelMap model,HttpServletRequest request) {
//		if(userId.equals("admin")&& password.equals("root")) {
//			model.put("userId", userId);
//			return "welcome";
//		}
		
		String username=request.getParameter("userId");
		String password=request.getParameter("password");
		
		String sifra=sifraAlgoritam(password);
		
		Korisnik k=kor.findByUsernameAndPassword(username, sifra);
		if(k!=null) {
			if(k.getUsername().startsWith("admin")) {
				return "HomePageAdmin";
			}else if(k.getUsername().startsWith("radnik")) {
				return "HomePageRadnik";
			}else {
				return "HomePageKorisnik";
			}
		}else {
			model.put("errorMsg", "Unesite validne podatke");
			return "login";
		}
	}
	
	
	@RequestMapping(value="/registration",method=RequestMethod.POST)
	public String registerPage(Model model,HttpServletRequest request,String ime,String prezime,String username,String password,String email) {
		
		if(username.startsWith("admin")) {
			model.addAttribute("poruka", "Username ne sme da pocinje sa admin!");
			return "Register";
		}
		
		Korisnik k=new Korisnik();
		
		String sifra=sifraAlgoritam(password);
		
		k.setIme(ime);
		k.setPrezime(prezime);
		k.setUsername(username);
		k.setPassword(sifra);
		k.setEmail(email);
		
		kor.save(k);
		
		return "login";		
	}
	
	
	public String sifraAlgoritam(String sifra) {
		String generatedPassword=null;		
		try {
			MessageDigest md=MessageDigest.getInstance("MD5");
			md.update(sifra.getBytes());
			byte[] bytes=md.digest();	
			StringBuilder sb=new StringBuilder();	
			for(int i=0;i<bytes.length;i++) {
				sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1))	;		
			}		
			generatedPassword=sb.toString();		
		}catch(NoSuchAlgorithmException e){
			e.printStackTrace();
		}
		
		return generatedPassword;	
	}
	
	@RequestMapping(value="/nadjiPredstavuZaProdaju", method=RequestMethod.GET)
	public String nadjiPredstavuPrekoIdZaProdaju(Integer idPredstave, HttpServletRequest request) {
		Predstava p = pr.findById(idPredstave).get();
		List<Uloga> uloge = ur.findByPredstava(p);
		List<Glumi> glumci = gr.findByPredstava(p);
		komentari = komr.findByPredstava(p);
		List<Izvodjenje> izvodjenja = ir.findByPredstava(p);
		
    	request.setAttribute("izvodjenja", izvodjenja);
		request.getSession().setAttribute("uloge", uloge);
		request.getSession().setAttribute("glumci", glumci);
		request.getSession().setAttribute("predstava", p);
		request.setAttribute("komentari", komentari);
		
		return "PrikazIzvodjenjaProdaja";
	}
	
	@RequestMapping(value="/nadjiPredstavu", method=RequestMethod.GET)
	public String nadjiPredstavuPrekoId(Integer idPredstave, HttpServletRequest request) {
		Predstava p = pr.findById(idPredstave).get();
		List<Uloga> uloge = ur.findByPredstava(p);
		List<Glumi> glumci = gr.findByPredstava(p);
		komentari = komr.findByPredstava(p);
		
		request.getSession().setAttribute("uloge", uloge);
		request.getSession().setAttribute("glumci", glumci);
		request.getSession().setAttribute("predstava", p);
		request.setAttribute("komentari", komentari);
		
		return "PrikazPredstave";
	}

	@RequestMapping(value="/saveKomentar", method=RequestMethod.POST)
    public String sacuvajKomentar(HttpServletRequest request, String comments) {
       // String komentar = (String)request.getAttribute("comments");
        Predstava predstava = (Predstava)request.getSession().getAttribute("predstava");
        //List<Komentari> komentari = (List<Komentari>)request.getAttribute("komentari");
        

        Kometari k = new Kometari();
        k.setKomentar(comments);
        k.setPredstava(predstava);

        komr.save(k);
        
//        komr.poslednjiKomentar();
//        System.out.print(komr.poslednjiKomentar());
        
        komentari.add(k);

       // List<Komentari> komentari = komr.findByPredstava(predstava);

        //request.setAttribute("komentari", komentari);
       
        request.setAttribute("komentari", komentari);
        return "PrikazPredstave";
    }
	
	@RequestMapping(value="/Rezervisanje", method=RequestMethod.GET)
	public String dovuciMesta(Integer idIzvodjenja, HttpServletRequest request){
		List<Mesto> slobodnaMesta = mr.slobodnaMesta(idIzvodjenja);
		Izvodjenje i = ir.findById(idIzvodjenja).get();
		
		request.getSession().setAttribute("mesta", slobodnaMesta);
		request.getSession().setAttribute("izvodjenje", i);
		return "Rezervacija";
	}
	
	@RequestMapping(value="/Rezervisanje2", method=RequestMethod.GET)
	public String dovuciMestaRadnik(Integer idIzvodjenja, HttpServletRequest request){
		List<Mesto> slobodnaMesta = mr.slobodnaMesta(idIzvodjenja);
		Izvodjenje i = ir.findById(idIzvodjenja).get();
		
		request.getSession().setAttribute("mesta", slobodnaMesta);
		request.getSession().setAttribute("izvodjenje", i);
		return "RezervacijaRadnik";
	}
	
	@ModelAttribute("karta")
	public Karta napraviKartu() {
		return new Karta();
	}
	
	@RequestMapping(value="/sacuvajRezervaciju", method=RequestMethod.POST) 
	public String sacuvajRezervaciju(@ModelAttribute("karta") Karta k, HttpServletRequest request, Model m)	{
		Izvodjenje i = (Izvodjenje)request.getSession().getAttribute("izvodjenje");
		k.setIzvodjenje(i);
		k.setCena((Math.random()*(max-min+1)+min * 100.0)/ 100.0);
		try {
			k.setDatum_rezervacije(sdf.parse(dtf.format(now)));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Karta karta = kar.save(k);
		m.addAttribute("karta", karta);
		m.addAttribute("uspesnaRezervacija", true);
		return "Success";
	}
	
	@RequestMapping(value="/profit", method=RequestMethod.GET)
    public String racunanjeProfita(HttpServletRequest request, String pocetniDatum, String zavrsniDatum) {
        //List<Karta> k = kar.findByDatumRezervacija(pocetniDatum, zavrsniDatum);
        Date pocetak = null, zavrsetak = null;
        try {
            pocetak = sdf.parse(pocetniDatum);
            zavrsetak = sdf.parse(zavrsniDatum);
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


        //double profit = 0.0;
        
        Double profit = 0.0;

        profit = kar.izracunajProfit(pocetak, zavrsetak);
        if(profit==null)
            profit=0.0;
        
        String newValue = Double.toString(Math.floor(profit));

        request.setAttribute("profit", newValue);
        request.getSession().setAttribute("pocetniDatum", pocetniDatum);
        request.getSession().setAttribute("zavrsniDatum", zavrsniDatum);
        return "Profit";

    }
	
	@RequestMapping(value="/filtriraj", method=RequestMethod.GET)
	public String filtriraj(HttpServletRequest request, Integer idKategorija) {
		Kategorija kategorija = kr.findById(idKategorija).get();
		List<Predstava> filtPredstave = pr.filtriraj(kategorija);
		List<Kategorija> kategorije = kr.findAll();
		
		request.getSession().setAttribute("predstave", filtPredstave);
		request.getSession().setAttribute("kategorije", kategorije);
		return "PrikazPredstava";
	}
	

}
