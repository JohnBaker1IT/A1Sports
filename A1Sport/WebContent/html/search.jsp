<!DOCTYPE html>

<%@page import="java.io.File"%>
<%@page import="com.sun.org.apache.bcel.internal.classfile.Attribute"%>
<%@page import="com.sun.source.tree.Scope"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.beans.Product"%>
<%@page import="java.util.List" buffer="8kb" isELIgnored="false"
	session="true" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isThreadSafe="true" isErrorPage="false"
	errorPage="error.jsp"%>


<html lang="en">
<head>
<meta charset="UTF-8">
<title>A1 Sport</title>
<link rel="stylesheet" href="css/style.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

    <!-- DocPoint 37. the header below is replaced with an include file. -->

    <%@ include file="header.jsp"%> 
   
    
   <!-- ********************** -->
	<!-- <header id="home" class="header">
		<nav class="nav" role="navigation">
			<div class="container nav-elements">
				<div class="branding">
					<a href="home"><img src="images/a1sportlogo.svg"
						alt="Logo - H Plus Sports"></a>
				</div>
				branding
				<ul class="navbar">
					<li><a href="home">home</a></li>
					<li><a href="#products">products</a></li>
					<li><a href="#history">history</a></li>
					<li><a href="login">login</a></li>
					<li><a href="#people">people</a></li>
					<li><a href="#search">search</a></li>
					<li><a href="register">new user?</a></li>
					<li><a href="redirect">linkedIn</a></li>
				</ul>
				navbar

				navbar
			</div>
			container nav-elements
		</nav>
	</header> -->
	
	<!-- ********************** -->

	<section id="products" class="section">
		<div class="container">
			<h2 class="headline"><br><br>Products</h2>
			<p>
				A1 Sports is <em>dedicated to creating</em> high-quality, durable, exercise products that <em>enhance active lifestyles</em>. We <a href="#guarantee">guarantee</a> it. Take a look at some of our products.
			</p>
			<%
				if (session.getAttribute("noofproducts") != null) {
			%>
			<!-- DocPoint 40. display how man items are in the cart -->
			<span id="size"
				title="<%=(ArrayList) session.getAttribute("noofproducts")%>">Items
				in Cart: <%=((ArrayList) session.getAttribute("noofproducts")).size()%></span>
			<%
				} else {
			%>
			<span id="size">Items in Cart: 0</span>
			<%
				}
			%>

		</div>


		<%--fetch he products from the rqq object --%>
		<%-- iterate the list and generate the display for every product --%>


		<div class="productContainer">

			<%
			   /*  DocPoint 32. Products object obtained from the dao layer were stored in the request Scope
			    as an Attribute. Now we take them from the request scope and put them in
			    a list of products to display dynamically on the webpage.  Request is
			    implicit on a jsp page.  request.getAttribute returns Object.  We need to cast this to
			    the proper type.
			    Other implicits are:
			    	Implicit Objects in JSP
			    	• Objects already created on JSP with predefined variables
			    	out: helps write output to JSP — JSPWriter
			    	request: request for the JSP page — HTTPServletRequest
			    	response: response for the JSP page — HTTPServletResponse
			    	session: session object for the user logged in — HTTPSession
			    	config: represents ServletConfig object
			    	application: represents ServletContext object
			    	exception: represents exception and can be used on
			    	error pages
			    	pageContext: contains a reference to all implicit objects
			    	and can be used to access information of the page

			    */
			    
			    /* DocPoint 36.  The jsp directives are placed a the top of the page and are
			    use when the jsp file is converted to a .class File */
			    
				List<Product> products = (ArrayList) request.getAttribute("products");
				Iterator<Product> iterator = products.iterator();
				while (iterator.hasNext()) {
					Product product = iterator.next();
					/* We will iterate the products and display the form on the
					webpage.  The scriplet is needed to switch form java code and back. */
			%>
			<form method="get" action="products">
				<%-- DocPoint 33.  we use the expression element to get the image path <%= and name --%>
				<div class="productContainerItem">
					<img id="pic3" src="<%=product.getProductImgPath()%>"> <input
						type="text" name="product" value="<%=product.getProductName()%>"><br />
					<button>Add to Cart</button>
				</div>
			</form>
			<%
				}
			%>
		</div>
	</section>
	<!-- #products -->

	<section id="search" class="section">
		<header class="imageheader"></header>
		<div class="container">
			<h2 class="headline">Search Products</h2>
			<form action="search" method="get">
				<label class="card-title">Search your product</label> <input
					type="search" name="search"> <input type="submit"
					value="Search">
			</form>
		</div>
	</section>
	<!-- guarantee -->

	<section id="history" class="section">
		<div class="container">
						<div class="text-content">
							<h2 class="headline">Company History</h2>
							<p>
								In 2020, A1 Sport founder <a href="#people">John Baker</a> set out to create sporting equipment made from the <em>highest quality materials</em> and backed by scientific and <em>performance research</em> in order to provide a strong basis of <em>quality and reliability</em>.</p>
      <p>His quest began while training for his <em>job in computer science</em>, after exercising and <em>loosing weight</em> that left him much happier. He yearned for <em>simple and high performance gym equipment</em>, in their best form, instead of equipment that <em>breaks easily</em> and does not last. When no products lived up to his strict requirements, John set his sights on <em>creating products</em> that catered to his own vision.</p>
      <p>Today that vision has become A1 Sports which offers a variety of sporting equipment. At the foundation of A1 Sports are products backed by scientific and performance data.
							</p>
						</div>
					</div>
					<!-- container text -->
	</section>
	
	
	<section id="people" class="section">
  <header class="imageheader"></header>
  <div class="container">
    <h2 class="headline">People</h2>
    <div class="people-cards">
      <div class="person-card">
        <img src="images/employees/JohnBaker.jpg" alt="JohnBaker Photo">
        <div class="card-info">
          <h3 class="card-name">John Baker</h3>
          <h4 class="card-title">CEO</h4>
        </div>
        <p class="card-text">John Baker is the <em>founder</em> and CEO of A1 Sports. He was an <em>software developer</em> working with several top developers, making sure that they had the direction and proper code to keep them at the <em>top of their game</em>. His passion for finding good gym equipment led him to developing A1 Sport's sporting goods. The goods <em>became a success</em> with his clients and led to the creation of A1 Sports.</p>
      </div><!-- person-card -->

      <div class="person-card">
        <img src="images/employees/AmyLewis.jpg" alt="AmyLewis Photo">
        <div class="card-info">
          <h3 class="card-name">Amy Lewis-Smith, MBA</h3>
          <h4 class="card-title">CFO</h4>
        </div>
        <p class="card-text">Amy Lewis-Smith joined us in 2020 and brings more than <em>10 years</em> of financial management experience to A1 Sports, spanning a variety of companies and industries ranging from <em> Fortune 500 agencies</em> to start-ups. She has extensive experience working in <em>emerging markets</em> and in the consumer and retail sectors.</p>
      </div><!-- person-card -->

      <div class="person-card">
        <img src="images/employees/GeorgeGarcia.jpg" alt="GeorgeGarcia Photo">
        <div class="card-info">
          <h3 class="card-name">George Garcia, MBA</h3>
          <h4 class="card-title">Director of Product Development</h4>
        </div>
        <p class="card-text">George Garcia joined A1 Sports in <em>2020</em> as Manager of Marketing Research. He was promoted to Director of Product Development in 2020. He has made <em>major contributions</em> to the discovery, development, and implementation of the A1 Sport product lines. Before joining the company he worked as a <em>scientific expert</em> and brings vast knowledge of ingredients and <em>new technologies</em>.</p>
      </div><!-- person-card -->

      <div class="person-card">
        <img src="images/employees/AndreaRodriguez.jpg" alt="AndreaRodriguez Photo">
        <div class="card-info">
          <h3 class="card-name">Andrea Rodriguez</h3>
          <h4 class="card-title">Director of Marketing</h4>
        </div>
        <p class="card-text">Andrea Rodriguez has been with A1 Sport since 2020. She oversees the  <em>marketing strategy</em>  by ensuring advertising campaigns, social media initiatives, and events are planned to <em>position the company</em> strongly in a competitive marketplace. Andrea is a <em>competing triathlete</em> and her passion for our products shows in her unique ability to drive awareness and <em>increase our presence</em> around the world.</p>
      </div><!-- person-card -->

      <div class="person-card">
        <img src="images/employees/RubyAppleton.jpg" alt="RubyAppleton Photo">
        <div class="card-info">
          <h3 class="card-name">Ruby Appleton</h3>
          <h4 class="card-title">Director of Sales</h4>
        </div>
        <p class="card-text">Ruby Appleton joined the company in 2020, to <em>initiate new relationships</em> for our growing line of A1 Sports active apparel. After being with the company for a year, she was promoted to Director of Sales. Ruby is the drive behind the A1 Sport <em>ACTIVE product line</em> and has an uncanny ability to formulate strategies that have helped build our unified sales force. <em>Educating people</em> about health and nutrition is something that Ruby holds dear.</p>
      </div><!-- person-card -->

      <div class="person-card">
        <img src="images/employees/AllenOlson.jpg" alt="AllenOlson Photo">
        <div class="card-info">
          <h3 class="card-name">Allen Olson</h3>
          <h4 class="card-title">MFA, Creative Director</h4>
        </div>
        <p class="card-text">Allen Olson is a multi-faceted <em>creative person</em> who began his career as a designer for a small business firm, while also working as an independent <em>painter and sculptor</em>. In 2020, John Baker was impressed by Allen's creative work in a national ad campaign for a high profile sports apparel company. John approached Allen, and asked him to <em>manage creative direction</em> for the A1 Sport ACTIVE apparel line.</p>
      </div><!-- person-card -->
  </div><!-- container -->
</section><!-- people -->




	<footer class="footer">
		<div class="container">
			<nav class="nav" role="navigation">
				<div class="container nav-elements">
					<div class="branding">
						<a href="#home"><img src="images/a1sportlogo.svg"
							alt="Logo - H Plus Sports"></a>
						<p class="address">
							1906 N Main Ave<br>San Antonio, TX 78212
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