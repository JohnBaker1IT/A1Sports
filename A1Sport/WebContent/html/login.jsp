<!DOCTYPE html>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<html>
<head>
<!-- ModDoc 2. Static call method: <link rel="stylesheet" href="../css/style.css"> -->
<link rel="stylesheet" href="css/style.css">
<meta charset="ISO-8859-1">
<title>A1 Sport</title>




</head>
<body>
	<header id="home" class="header">
		<nav class="nav" role="navigation">
			<div class="container nav-elements">
				<div class="branding">
				<!-- ModDoc 3.: <a href="#home"><img src="images/a1sportlogo.svg" -->
				<!-- Static call method: <a href="#home"><img src="../images/a1sportlogo.svg" -->
				<a href="#home"><img src="images/a1sportlogo.svg"
						alt="Logo - H Plus Sports"></a>
				</div>
				<!-- branding -->
				<ul class="navbar">
					<li><a href="home">home</a></li>
					<li><a href="redirect">linkedIn</a></li>

				</ul>
				<!-- navbar -->
			</div>
			<!-- container nav-elements -->
		</nav>
		<!-- <div class="container tagline">
    <h1 class="headline">Our Mission</h1>
  <p>We support and encourage active and healthy lifestyles, by offering high performance products for the result-driven athlete.</p>
  </div>container tagline -->
	</header>
	<!-- #home -->



	<section>
	
	<!-- DocPoint 35. call displayDate to show the date and time -->
	<%=displayDate()%>
	</section>
	<section id="login" class="section">
		<div class="container tagline">
			<% if(request.getAttribute("error")!=null){ %>
			<em><%=request.getAttribute("error")%></em><br />
			<%} %>

			<em>LOGIN USER</em>
			<form action="login" method="post">
				<label>Username</label> <input type="text" name="username"
					id="username"><br /> <label>Password</label> <input
					type="password" name="password" id="password"><br /> <input
					type="submit" value="Login">
			</form>
		</div>
	</section>
	<!-- #products -->


	<footer class="footer">
		<div class="container">

			<nav class="nav" role="navigation">
				<div class="container nav-elements">
					<div class="branding">
						<!-- ModDoc 4. Static Method: <a href="#home"><img src="../images/a1sportlogo.svg" -->
						<a href="#home"><img src="images/a1sportlogo.svg"
							alt="Logo - H Plus Sports"></a>
						<p class="address">
							1906 N Main Ave<br> San Antonio, TX 78212
						</p>
					</div>
				</div>
			</nav>
			<p class="legal">Everything on this page is not real.  The people
			are generated by AI.</p>
		</div>
		<!-- container -->
	</footer>
	<!-- footer -->
	<%-- DocPoint 34.  <%! is a declaration element that will sit inside the servlet file. 
	a method to display the date is created in Java--%>
<%!

public String displayDate(){
	SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-mm-dd hh:mm");
	Date toDate = Calendar.getInstance().getTime();
	return dateFormat.format(toDate);
}

%>
</body>
</html>