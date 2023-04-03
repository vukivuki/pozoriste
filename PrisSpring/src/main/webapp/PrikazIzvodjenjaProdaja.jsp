<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Izvodjenja</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">

<style>

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
		width: 100%;
	  	margin-top: 20px;
	  	font-size: 20px;
	}
	
	.prodaj {
		width: 50%;
		border: none;
	}
	
	.scena {
		margin-right: 20px;
		width: 30%;
	}
	
	
	.izvodj {
		width: 50%;
	}
	
	
	
	.link{
	  position: relative;
	  padding: 20px 30px;
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  background: rgba(0, 0, 0, 0.5);
	  margin: 20px;
	  text-decoration: none;
	  transition: 1s;
	  border-radius: 4px;
	  overflow: hidden;
	  /*-webkit-box-reflect: below 1px linear-gradient(transparent, transparent, #0004);*/
	}
	.link:hover{
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
	.link:hover:before{
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
	.link:after{
	  content: '';
	  position: absolute;
	  inset: 4px;
	  background: #0e1538;
	}
	.link:hover:after{
	  background: var(--clr);
	}
	.link span{
	  position: relative;
	  z-index: 1;
	  font-size: 10px;
	  color: grey;
	  text-transform: uppercase;
	  letter-spacing: 5px;
	  transition: 0.5s;
	}
	.link:hover span{
	  color: #fff
	}
	


</style>


</head>
<body>
	<div class="header">
		<a href="/Pris/Repertoar.jsp" style="--clr:#00ccff;" class="hdr-dugme"><span>Repertoar</span></a><br>
		<a href="/Pris/predstave/getPredstaveZaProdaju" style="--clr:#00ccff;" class="hdr-dugme"><span>Prodaja</span></a>
	</div>
	<div class="bod">
	<c:if test="${!empty izvodjenja}">
		<!--<span class="tekst">Prikaz izvodjenja za predstavu: ${predstava}</span>-->
		<table border="1" class="prodaj">
			<tr>
				<th class="tekst izvodj">Datum izvodjenja</th>
				<th class="tekst scena">Scena</th>
				
			</tr>
			<c:forEach items="${izvodjenja}" var="i">
			<tr>
				<td class="tekst izvodj">${i.datum}</td>
				<td class="tekst scena">${i.sala.naziv}</td>
				<td><a href="/Pris/predstave/Rezervisanje2?idIzvodjenja=${i.idizvodjenje}" class="tekst link" style="--clr:#00ccff;"><span>Prodaj</span></a></td>
			</tr>
			</c:forEach>
		</table>
	</c:if>
	</div>	

	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
</body>
</html>