<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Predstave</title>
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
	  z-index: 99;
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
		font-size: 33px;
	}
	
	.tekstdva {
		color: grey;
		font-size: 22px;
	}
	
	.margina {
		margin-left:30px;
	}
	
	
	.btnn{
	  position: relative;
	  padding: 20px 30px;
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
	  font-size: 10px;
	  color: grey;
	  text-transform: uppercase;
	  letter-spacing: 5px;
	  transition: 0.5s;
	}
	.btnn:hover span{
	  color: #fff;
	}
	
	
	
	
	
	
	.red {
		border-radius: 4px;
		border-width: 4px;
		border-color: black;
	}


	img {
		margin: 20px;
		width: 250px;
	  	display: block;
		margin-left: auto;
		margin-right: auto;
	}
	
	
	
	.tabla {
		width:60%;
		border-collapse: separate;
		border-spacing: 10px 70px;
	}
	
	
	.filt {
		padding: 8px 20px;
		font-size: 20px;
	}
	
	
	.marginadesno {
		margin-right: 30px;
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
		
		<form action="/Pris/predstave/filtriraj">
		<c:if test="${!empty kategorije}">
		
				<table>
				<tr>
					<td><span class="tekstdva margina marginadesno">Kategorije:</span><select name="idKategorija">
							<c:forEach items="${kategorije}" var="k">
								<option value="${k.idkategorija}">${k.naziv}</option>
							</c:forEach>
							  </select></td>
							  <td><input type="submit" value="Filtriraj" class="btnn tekst margina filt" style="--clr:#00ccff;"></td>
				</tr></table>	
		</c:if>
		</form>	
	
		<c:if test="${!empty predstave}">	
			<table class="tabla">
				<c:forEach items="${predstave}" var="p">
					<tr class="red">
						<td><span class="tekst margina">${p.naziv}</span></td>
						<c:if test="${p.idpredstava == 1}">
							<td><img src="https://i2.wp.com/repertoar.rs/wp-content/uploads/Untitled-2-1.png?fit=1200%2C630&ssl=1"></td>
						</c:if>
						<c:if test="${p.idpredstava == 2}">
							<td><img src="http://www.malopozoriste.co.rs/sites/default/files/Gallery/3-2.jpg"></td>
						</c:if>
						<c:if test="${p.idpredstava == 3}">
							<td><img src="https://www.originalmagazin.com/wp-content/uploads/2019/05/korespodencija.jpg"></td>
						</c:if>
						<td><a href="/Pris/predstave/nadjiPredstavu?idPredstave=${p.idpredstava}" class="btnn" style="--clr:#00ccff;"><span>Detalji</span></a></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		
		
	</div>
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
</body>
</html>