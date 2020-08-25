

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<header id="home" class="header">
		<nav class="nav" role="navigation">
			<div class="container nav-elements">
				<div class="branding">
					<a href="#home"><img src="images/a1sportlogo.svg"
						alt="Logo - H Plus Sports"></a>
				</div>
				<!-- branding -->
				<ul class="navbar">
			        <li><a href="home">home</a></li>
			        <li><a href="#history">history</a></li>
			        <li><a href="#products">products</a></li>
			        <li><a href="login">login</a></li>
			        <li><a href="#people">people</a></li>
			        <li><a href="register">new user?</a></li>
		      </ul><!-- navbar -->
				<%-- 
				<ul class="navbar">
					<li><a href="home">home</a></li>
					<li><a href="orderHistory">order history</a></li>
					<!-- <li><a href="viewProfile">view my profile</a></li> -->
					<li><a href='<%=response.encodeURL("viewProfile")%>'>view my profile</a></li>
					<li><a href='logout'>logout</a></li>

				</ul> --%>
				<!-- navbar -->
			</div>
			<!-- container nav-elements -->
		</nav>
		<!-- <div class="container tagline">
    <h1 class="headline">Our Mission</h1>
    <p>
    <!-- Doc Point 37. This file is used to make an include file to be a header pattern for all pages of the 
website. -->
    We support and encourage active and healthy lifestyles, by offering high performance products for the result-driven athlete.</p>
  </div>container tagline -->
	</header>
</body>
</html>