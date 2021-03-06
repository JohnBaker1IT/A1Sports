<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- DocPoint 55 must import the jst tag core and format-->
<html lang="en">
<head>
<meta charset="UTF-8">
<title>A1 Sport</title>
<link rel="stylesheet" href="css/style.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
					<li><a href="orderHistory">order history</a></li>
					<!-- <li><a href="viewProfile">view my profile</a></li> -->
					<!-- DocPoint 43. Encode the url for the viewProfile link -->
					<li><a href='<%=response.encodeURL("viewProfile")%>'>view
							my profile</a></li>							
					<li><a href='logout'>logout</a></li>
					<li><a href="redirect">linkedIn</a></li>

				</ul>
				<!-- navbar -->
			</div>
			<!-- container nav-elements -->
		</nav>
		<!-- <div class="container tagline">
    <h1 class="headline">Our Mission</h1>
   <p>We support and encourage active and healthy lifestyles, by offering high performance products for the result-driven athlete.</p>
  </div><!-- container tagline -->
	</header>

	<fmt:setBundle basename="com.test.resources.applicationResources"
		var="message" scope="session" />

	<section id="orders" class="section">
		<div class="container">
		<!-- DocPoint 56. items is the key define in OrderHistory.java  
		Jstl tage use expression language
		format key message is picked up.
		The if checks to see if there is order history-->
			<c:if test="${requestScope.items!=null}">
				<h2 class="headline">
					<fmt:message key="label.home.orders" bundle="${message}"></fmt:message>
				</h2>
				<table id="orderHistory">

					<tr>
						<th><fmt:message key="label.home.table.header1"
								bundle="${message}"></fmt:message></th>
						<th>Product Name</th>
						<th>Order Date</th>
						<th>Product Image</th>

					</tr>

					<c:forEach items="${requestScope.items}" var="item">
						<tr>

							<td>${item.orderId}</td>
							<td>${item.productName}</td>
							<td>${item.orderDate}</td>
							<td><img width="200px" height="150px"
								src="${item.productImgPath}"></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</div>
	</section>
<!-- These tag close the if blocks and for loops -->

	<footer class="footer">
		<div class="container">
			<nav class="nav" role="navigation">
				<div class="container nav-elements">
					<div class="branding">
						<a href="#home"><img src="images/a1sportlogo.svg"
							alt="Logo - H Plus Sports"></a>
						<p class="address">
							1906 N Main Ave, San Antonio, TX 78212
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




</body>
</html>