<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rezervacija</title>
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

	
	body {
		background-color: #0e1538;
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
	
	
	.bod{
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  min-height: 100vh;
	  filter-direction:column;
	  flex-direction: column;
	}
	
	
	.tekst {
		color: grey;
		font-size: 20px;
	}
	
	.tekstdva {
		color: grey;
		font-size: 30px;
	}
	
	
	.btnn{
	  position: absolute;
	  padding: 10px 60px;
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  background: rgba(0, 0, 0, 0.5);
	  margin: 40px;
	  text-decoration: none;
	  transition: 1s;
	  border-radius: 4px;
	  overflow: hidden;
	  left: 42%;
	  
	  /*-webkit-box-reflect: below 1px linear-gradient(transparent, transparent, #0004);*/
	}
	.btnn:hover{
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
	.btnn:hover:before{
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
	  font-size: 10px;
	  color: grey;
	  text-transform: uppercase;
	  letter-spacing: 5px;
	  transition: 0.5s;
	}
	.btnn:hover span{
	  color: #fff;
	}
	
	
	.form-control {
		margin: 20px 10px 20px;
	}
	


</style>


</head>
<body>
	<div class="header">
		<a href="/Pris/Repertoar.jsp" style="--clr:#00ccff;" class="hdr-dugme"><span>Repertoar</span></a><br>
		<a href="/Pris/predstave/getPredstave" style="--clr:#00ccff;" class="hdr-dugme"><span>Predstave</span></a>
		<a href="/Pris/predstave/getNajposecenije" style="--clr:#00ccff;" class="hdr-dugme"><span>Najposecenije</span></a>
	</div>
	<div class="bod">
	<span class="tekstdva">Rezervacija karte za predstavu ${izvodjenje.predstava.naziv }, u sali ${izvodjenje.sala.naziv}, za datum ${izvodjenje.datum}:</span><br/>
	<form:form action="/Pris/predstave/sacuvajRezervaciju" method="post" modelAttribute="karta">
		<table>
			<tr><td><span class="tekst">Mesto:</span></td><td>
				<form:select path="mesto" class="form-control">
					<c:forEach items="${mesta}" var="m">
						<form:option value="${m.idmesto}">${m.broj}, ${m.red}</form:option>
					</c:forEach>
				</form:select>
			</td></tr>
			<tr><td><span class="tekst">ID korisnika:</span></td><td><form:input path="korisnik" class="form-control"/></td></tr>
			<tr><td><input type="submit" value="Izaberi" class="btnn tekst" style="--clr:#00ccff;"></td></tr>
		</table>
	</form:form>
	</div>
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
</body>
</html>