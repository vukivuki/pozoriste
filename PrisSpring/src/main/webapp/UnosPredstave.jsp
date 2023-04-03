<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Unos predstave</title>
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



	.unos-form {
		width: 850px;
		height: 530px;
		position: absolute;
		background-color: #0e1538;
		border-radius: 30px;
		top: 55%;
		left: 50%;
		margin-right: -50%;
		transform: translate(-50%,-50%);
		border: 4px solid black;
	}
	
	.dugme {
		position: absolute;
		border-radius: 20px;
		width: 50px;
		top: 91%;
		left: 70%;
		margin-right: -50%;
		transform: translate(-50%,-50%);
	}
	
	.tekst {
		position: absolute;
		border-radius: 20px;
		width: 250px;
		top: 35%;
		left: 72%;
		margin-right: -50%;
		transform: translate(-50%,-50%);
	}
	
	.tekst-boja {
		color: grey;
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
	
	
	.btnn{
	  position: relative;
	  padding: 10px 40px;
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
	  font-size: 20px;
	  color: grey;
	  text-transform: uppercase;
	  letter-spacing: 5px;
	  transition: 0.5s;
	}
	.btnn:hover span{
	  color: #fff;
	}
	
	
	
	input[type="submit"]
	{
	    font-size:20px;
	    color: grey;
	    font-family: 'Poppins', sans-serif;
	    text-transform: uppercase;
	    letter-spacing: 5px;
	    background: #0e1538;    
	    border-radius: 4px;
	    border-width: 3.5px;
	    width: 250px;
	    transition: 1s;
	}
	
	
	
	input[type="submit"]:hover
	{
	    font-size:20px;
	    color: #fff;
	    
	}
	
	.tekst-dugme {
		font-size: 15px;
		color: grey;
	}
	
	

</style>



</head>
<body>
	<div class="header">
		<a href="/Pris/Repertoar.jsp" style="--clr:#00ccff;" class="hdr-dugme"><span>Repertoar</span></a><br>
		<a href="/Pris/predstave/getPredstaveZaProdaju" style="--clr:#00ccff;" class="hdr-dugme"><span>Prodaja</span></a>
	</div>
	<form action="/Pris/predstave/savePredstave" method="post" class="unos-form">
		<table class="container w-75">
			<tr class="row mt-4">
				<td class="h3 tekst-boja">Naziv:</td>
				<td class="w-50"><input name="naziv" class="form-control"></td>
			</tr>
			<tr class="row mt-2">
				<td class="h3 tekst-boja">Trajanje:</td>
				<td class="w-50"><input name="trajanje" class="form-control"></td>
			</tr>
			<tr class="row mt-2">
				<td class="h3 tekst-boja">Opis:</td>
				<td class="w-50"><textarea name="opis" class="form-control"></textarea></td>
			</tr>
			<tr class="row mt-2">
				<td class="h3 tekst-boja">Kategorija:</td>
				<td class="w-50"><select name="kategorije" class="form-control">
						<c:forEach items="${kategorije}" var="k">
							<option value="${k.idkategorija}">${k.naziv}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr class="row mt-2">
				<td class="h3 tekst-boja">Admini:</td>
				<td class="w-50"><select name="korisnik" class="form-control">
						<c:forEach items="${korisnici}" var="k">
							<option value="${k.idkorisnik}">${k.ime} ${k.prezime}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr class="row mt-2">
				<td class="display-3 tekst tekst-boja">UNOS PREDSTAVE</td>
				<td class="col dugme"><input type="submit" value="Sacuvaj" class="btnn dugme tekst-dugme" style="--clr:#00ccff;"></td>
			</tr>
		</table>
	</form>
	
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
</body>
</html>