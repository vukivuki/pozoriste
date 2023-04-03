<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Nase Pozoriste</title>
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
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  filter-direction:column;
  background: #0e1538;
  flex-direction: column;
}
a{
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
a:hover{
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
a:hover:before{
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
a:after{
  content: '';
  position: absolute;
  inset: 4px;
  background: #0e1538;
}
a:hover:after{
  background: var(--clr);
}
a span{
  position: relative;
  z-index: 1;
  font-size: 2em;
  color: grey;
  text-transform: uppercase;
  letter-spacing: 5px;
  transition: 0.5s;
}
a:hover span{
  color: #fff
}



</style>


</head>
<body>
	<div>
		<a href="/Pris/login.jsp" style="--clr:#22e622;"><span>Login/Register</span></a><br>
		<a href="/Pris/Repertoar.jsp" style="--clr:#00ccff;"><span>Repertoar</span></a><br>
		<a href="/Pris/predstave/getPredstave" style="--clr:#00ccff;"><span>Predstave</span></a>
	</div>
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
</body>
</html>