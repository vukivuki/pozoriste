<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Predstava</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">

<style>

@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap');
/* font-family: 'Poppins', sans-serif; */
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins', sans-serif;
}
body{
  background: #0e1538;
}


.btnn{
  position: relative;
  padding: 20px 60px;
  display: flex;
  justify-content: center;
  align-items: center;
  background: rgba(0, 0, 0, 0.5);
  margin: 40px;
  text-decoration: none;
  transition: 1s;
  border-radius: 4px;
  overflow: hidden;
  
  /*-webkit-box-reflect: below 1px linear-gradient(transparent, transparent, #0004);*/
}
.btnn:hover{
  background: var(--clr);
  box-shadow: 0 0 10px var(--clr),
              0 0 30px var(--clr),
              0 0 60px var(--clr),
              0 0 100px var(--clr);
}
.btnn:before{
  content: '';
  position: absolute;
  width: 40px;
  height: 400%;
  background: var(--clr);
  transition: 1s;
  animation: animate 2s linear infinite;
  animation-delay: calc(0.33s * var(--1));
}
.btnn:hover:before{
  width: 120%;
}
@keyframes animate{
  0%{
    transform: rotate(0deg);
  }
  100%{
    transform: rotate(360deg);
  }
}
.btnn:after{
  content: '';
  position: absolute;
  inset: 4px;
  background: #0e1538;
}
.btnn:hover:after{
  background: var(--clr);
}
.btnn span{
  position: relative;
  z-index: 1;
  font-size: 12px;
  color: grey;
  text-transform: uppercase;
  letter-spacing: 5px;
  transition: 0.5s;
}
.btnn:hover span{
  color: #fff;
}




.tekst {
	font-size: 20px;
	color: grey;
}


.margina {
	
	padding: 20px;
}

.btnn {
    width: 150px;
    height: 60px;
}

table {
	margin: 40px;
	border-collapse: collapse;
}

td {
	padding: 20px;
}

tr {
  border-bottom: 2px solid black;
}


.grid-cont {
	display: grid;
	grid-template-columns: 1fr 1fr;
}


.komnaslov {
	float: left;
}


.komm {
	display:flex;
	justify-content: center;
  	align-items: center;
}



.header {
  width: 100%;
  height: 70px;
  background-color: #213285;
  display: inline-flex;
  justify-content: center;
  position: sticky;
  top: 0;
}

.header a {
	height: fit-content;
	width: fit-content;
	margin-right: 100px;
	margin-left: 100px;
	vertical-align: middle;
}



.hdr-dugme{
  position: relative;
  padding: 10px 30px;
  display: flex;
  justify-content: center;
  align-items: center;
  background: rgba(0, 0, 0, 0.5);
  margin: 10px;
  text-decoration: none;
  transition: 1s;
  border-radius: 4px;
  overflow: hidden;
  border-color: black;
  /*-webkit-box-reflect: below 1px linear-gradient(transparent, transparent, #0004);*/
}
.hdr-dugme:hover{
  background: var(--clr);
  box-shadow: 0 0 10px var(--clr),
              0 0 30px var(--clr),
              0 0 60px var(--clr),
              0 0 100px var(--clr);
}
/*a:before{
  content: '';
  position: absolute;
  width: 40px;
  height: 400%;
  background: var(--clr);
  transition: 1s;
  animation: animate 2s linear infinite;
  animation-delay: calc(0.33s * var(--1));
}*/
.hdr-dugme:hover:before{
  width: 120%;
}
/*@keyframes animate{
  0%{
    transform: rotate(0deg);
  }
  100%{
    transform: rotate(360deg);
  }
}*/
.hdr-dugme:after{
  content: '';
  position: absolute;
  inset: 4px;
  background: #0e1538;
}
.hdr-dugme:hover:after{
  background: var(--clr);
}
.hdr-dugme span{
  position: relative;
  z-index: 1;
  font-size: 20px;
  color: grey;
  text-transform: uppercase;
  letter-spacing: 5px;
  transition: 0.5s;
}
.hdr-dugme:hover span{
  color: #fff
}




.btnnn{
  position: relative;
  padding: 20px 60px;
  display: flex;
  justify-content: center;
  align-items: center;
  background: rgba(0, 0, 0, 0.5);
  margin: 40px;
  text-decoration: none;
  transition: 1s;
  border-radius: 4px;
  overflow: hidden;
  
  /*-webkit-box-reflect: below 1px linear-gradient(transparent, transparent, #0004);*/
}
.btnnn:hover{
  background: var(--clr);
  box-shadow: 0 0 10px var(--clr),
              0 0 30px var(--clr),
              0 0 60px var(--clr),
              0 0 100px var(--clr);
}

.btnnn:hover:before{
  width: 120%;
}

.btnnn:after{
  content: '';
  position: absolute;
  inset: 4px;
  background: #0e1538;
}
.btnnn:hover:after{
  background: var(--clr);
}
.btnnn span{
  position: relative;
  z-index: 1;
  font-size: 12px;
  color: grey;
  text-transform: uppercase;
  letter-spacing: 5px;
  transition: 0.5s;
}
.btnnn:hover span{
  color: #fff;
}


.donjamargina {
	margin-bottom: 30px;
}



</style>


</head>
<body>
<div class="header">
		<a href="/Pris/Repertoar.jsp" style="--clr:#00ccff;" class="hdr-dugme"><span>Repertoar</span></a><br>
		<a href="/Pris/predstave/getPredstave" style="--clr:#00ccff;" class="hdr-dugme"><span>Predstave</span></a>
		<a href="/Pris/predstave/getNajposecenije" style="--clr:#00ccff;" class="hdr-dugme"><span>Najposecenije</span></a>
	</div>
<div class="grid-cont">
    <table class="donjamargina">
        <tr>
        	<th class="tekst margina">Naziv</th>
            <td class="tekst"><span class="margina">${predstava.naziv}</span></td>
       	</tr>
       	<tr>
       		<th class="tekst margina">Opis</th>
            <td class="tekst"><span class="margina">${predstava.opis}</span></td>
        </tr>
        <tr>
        	<th class="tekst margina">Trajanje</th>
            <td class="tekst"><span class="margina">${predstava.trajanje}</span></td>
        </tr>
    </table>
    <table>
    	<tr>
    		<th class="tekst margina text-center">Uloge</th>
    		<th class="tekst margina text-center">Glumci</th>
    	</tr>
        <tr>
            <td><c:forEach items="${uloge}" var="u">
                <span class="tekst margina">${u.ime}</span><br>
            </c:forEach></td>
            <td><c:forEach items="${glumci}" var="g">
                <span class="tekst margina">${g.glumac.ime} ${g.glumac.prezime}</span><br>
            </c:forEach></td>
        </tr>
    </table>
    <table>
    	<tr>
    		<th><a href="/Pris/predstave/getPodaciZaRezervaciju"><span class="btnn komnaslov" style="--clr:#00ccff;"><span>Rezervacija karte</span></a></th>
    	</tr>
    	<tr>
    		<th class="komm"><span class="tekst margina komnaslov">Komentari</span><a href="/Pris/UnosKomentara.jsp" class="btnnn komnaslov" style="--clr:#00ccff;"><span>Unesite komentar</span></a></th>
    	</tr>
    	<tr>
            <c:if test="${!empty komentari}">
               <td><c:forEach items="${komentari}" var="k">
                    <span class="tekst margina">${k.komentar}</span><br>
                </c:forEach></td>
            </c:if>
        </tr>
    </table>
    <table>
    	<tr>
            <c:if test="${predstava.idpredstava == 1}">
                <td><img src="https://i2.wp.com/repertoar.rs/wp-content/uploads/Untitled-2-1.png?fit=1200%2C630&ssl=1" width="500px"></td>
            </c:if>
            <c:if test="${predstava.idpredstava == 2}">
                <td><img src="http://www.malopozoriste.co.rs/sites/default/files/Gallery/3-2.jpg" width="400px"></td>
            </c:if>
            <c:if test="${predstava.idpredstava == 3}">
				<td><img src="https://www.originalmagazin.com/wp-content/uploads/2019/05/korespodencija.jpg" width="400px"></td>
		    </c:if>
        </tr>
    </table>
    
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
</div>
</body>
</html>