<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<link href="webjars/bootstrap/4.6.0/css/bootstrap.min.css" rel="stylesheet">

<style>


	body {
		background-color: #0e1538;
	}

	.login-form{
		width: 400px;
		height: 350px;
		position: absolute;
		background-color: #0e1538;
		border-radius: 20px;
		top: 50%;
		left: 50%;
		margin-right: -50%;
		transform: translate(-50%,-50%);
		border: 4px solid black;
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


</style>
</head>
<body>
<div class="header">
	<a href="/Pris/Repertoar.jsp" style="--clr:#00ccff;" class="hdr-dugme"><span>Repertoar</span></a><br>
	<a href="/Pris/predstave/getPredstave" style="--clr:#00ccff;" class="hdr-dugme"><span>Predstave</span></a>
</div>

<div class="login-form">
	
		<c:if test="${!empty poruka}">
			${poruka}
		</c:if>
	
		<div class="container-fluid">
			<form action="/Pris/predstave/registration" method="post">
			
				<div class="mt-3">
					<input type="text" name="ime" class="form-control " placeholder="Ime" />
				</div>
				 
				 <div class="mt-3">
				 	<input type="text" name="prezime" class="form-control " placeholder="Prezime" /> 
				 </div> 
				 
				 <div class="mt-3">
					<input type="text" name="email" class="form-control " placeholder="email" />
				</div>
				
				<div class="mt-3">
					<input type="text" name="username" class="form-control " placeholder="username" />
				</div>
				
				<div class="mt-3">
					<input type="password" name="password"  class="form-control " placeholder="password" />
				</div>
				 
				 
				<button type="submit" class="btn btn-dark btn-block  mt-3">Register</button>
				
				
				
				
			</form>
		
		
		
		
		</div>
	</div>

</body>
</html>