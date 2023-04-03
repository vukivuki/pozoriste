<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profit</title>
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
		display: flex;
		flex-direction: column;
	}
	
	.dugme {
		position: absolute;
		border-radius: 20px;
		width: 250px;
		top: 85%;
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
		margin-left: 100px;
		width: 100%;
	  	margin-top: 20px;
	}
	
	
	.tekst-boja-dugme {
		color: grey;
		font-size: 10px;
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
	  padding: 10px 20px;
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  background: rgba(0, 0, 0, 0.5);
	  margin: 80px;
	  text-decoration: none;
	  transition: 1s;
	  border-radius: 4px;
	  overflow: hidden;
	  width: fit-content;
	  margin-left: 310px;
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
	  font-size: 2em;
	  color: grey;
	  text-transform: uppercase;
	  letter-spacing: 5px;
	  transition: 0.5s;
	}
	.btnn:hover span{
	  color: #fff
	}
	
	input {
		margin-left: 100px;
		margin-top: 10px;
	}
	
	
	.profit {
		color: grey;
		font-size: 40px;
		position: absolute;
		border-radius: 20px;
		width: 250px;
		top: 80%;
		left: 55.5%;
		margin-right: -50%;
		transform: translate(-50%,-50%);
	}
	

</style>

</head>
<body>
<div class="header">
	<a href="/Pris/Repertoar.jsp" style="--clr:#00ccff;" class="hdr-dugme"><span>Repertoar</span></a><br>
	<a href="/Pris/predstave/getPredstaveZaProdaju" style="--clr:#00ccff;" class="hdr-dugme"><span>Prodaja</span></a>
</div>
<form action="/Pris/predstave/profit" method="get" class="unos-form">
		<div class="mt-3">
    <label for="pocetniDatum" class="h3 tekst-boja">Pocetni datum:</label>
    <input type="date" size="30" class="form control" name="pocetniDatum" value="">
</div>
<div class="mt-3">
    <label for="zavrsniDatum" class="h3 tekst-boja">Zavrsni datum:</label>
    <input type="date" size="30" class="form control" name="zavrsniDatum" value="">
</div>  


	<button type="submit" class="tekst-boja-dugme btnn" style="--clr:#00ccff;"><span>Prikazi profit</span></button>
			
			</form>
			
				<span class="profit">${profit}</span>
			
			
</body>
</html>