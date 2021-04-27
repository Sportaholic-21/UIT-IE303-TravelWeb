<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:genericpage pageTitle="Home">
	<jsp:attribute name="pageCSSLink">
		<link rel="stylesheet" type="text/css"
			  href="${pageContext.request.contextPath}/resources/css/pages/home.css">
	</jsp:attribute>
	<jsp:body>
		<!--Landing Section-->
		<section class="landing" style="background: linear-gradient( rgba(0, 0, 0, 0.3) 100%,
										rgba(0, 0, 0, 0.3)100%),
		  								url('${pageContext.request.contextPath}/resources/images/feedback-background.jpg');">
					<h1 class="landing-h1">SEARCH FOR YOUR BEST ADVENTURE</h1>
					<h3 class="landing-h3">Check out out best promotions</h3>
					<div class="search-container">
						<form action="/action_page.php">
							<div class="search-bar">
								<input type="text" placeholder="Where would you want to go?..." name="search">
								<input type="submit" value=""
									   width="47px" height="47px"
									   style="background: url('${pageContext.request.contextPath}/resources/images/icons/magniGlass.svg') no-repeat center transparent;
                        					  background-size: 100%;
                        					  border-style: none;"	
								>
							</div>
						</form>
					</div>
				</section>
				<!--Destination Section-->
				<section class="destination">
					<h2 class="destination-h2">Popular Destinations</h2>
					<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
						<div class="col-md-4">
							<div class="destination-card shadow-sm vietnam" style="background: url('${pageContext.request.contextPath}/resources/images/vietnam.jpg') no-repeat top; 
		   background-size: cover;">
								<div class="destination-text">
									<h3>Vietnam</h3>
									<h4>3 packages</h4>
								</div>
							</div>
						</div>

						<div class="col-md-4">
							<div class="destination-card shadow-sm" style="background: url('${pageContext.request.contextPath}/resources/images/australia.jpg') no-repeat top;
		   background-size: cover;">
								<div class="destination-text">
									<h3>Vietnam</h3>
									<h4>3 packages</h4>
								</div>
							</div>
						</div>

						<div class="col-md-4">
							<div class="destination-card shadow-sm" style="background: url('${pageContext.request.contextPath}/resources/images/america.jpg') no-repeat top;
		   background-size: cover;">
								<div class="destination-text">
									<h3>Vietnam</h3>
									<h4>3 packages</h4>
								</div>
							</div>
						</div>

						<div class="col-md-4">
							<div class="destination-card shadow-sm" style="background: url('${pageContext.request.contextPath}/resources/images/japan.jpg') no-repeat top;
		   background-size: cover;">
								<div class="destination-text">
									<h3>Vietnam</h3>
									<h4>3 packages</h4>
								</div>
							</div>
						</div>

						<div class="col-md-4">
							<div class="destination-card shadow-sm" style="background: url('${pageContext.request.contextPath}/resources/images/madagascar.jpg') no-repeat top;
		   background-size: cover;">
								<div class="destination-text">
									<h3>Vietnam</h3>
									<h4>3 packages</h4>
								</div>
							</div>
						</div>

						<div class="col-md-4">
							<div class="destination-card shadow-sm" style="background: url('${pageContext.request.contextPath}/resources/images/italy.jpg') no-repeat top;
		   background-size: cover;">
								<div class="destination-text">
									<h3>Vietnam</h3>
									<h4>3 packages</h4>
								</div>
							</div>
						</div>

					</div>
				</section>
				<!--Combo Section-->
				<section class="combo">
					<h2 class="combo-h2">Promotions</h2>
					<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
						<div class="col-md-4">
							<div class="card shadow-sm">
								<img class="combo-image" src="${pageContext.request.contextPath}/resources/images/melbourne.jpg" />
								<div class="card-body">
									<p class="combo-name">Melbourne</p>
									<div class="combo-category">
										<div class="row">
											<div class="col-md-8">Category</div>
											<div class="col-md-4">700$</div>
										</div>
									</div>
									<div class="combo-content d-flex justify-content-between align-items-center">
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
											tempor incididunt
											ut labore et
											dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
											ullamco laboris
											nisi</p>
									</div>
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card shadow-sm">
								<img class="combo-image" src="${pageContext.request.contextPath}/resources/images/melbourne.jpg" />
								<div class="card-body">
									<p class="combo-name">Melbourne</p>
									<div class="combo-category">
										<div class="row">
											<div class="col-md-8">Category</div>
											<div class="col-md-4">700$</div>
										</div>
									</div>
									<div class="combo-content d-flex justify-content-between align-items-center">
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
											tempor incididunt
											ut labore et
											dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
											ullamco laboris
											nisi</p>
									</div>
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card shadow-sm">
								<img class="combo-image" src="${pageContext.request.contextPath}/resources/images/melbourne.jpg" />
								<div class="card-body">
									<p class="combo-name">Melbourne</p>
									<div class="combo-category">
										<div class="row">
											<div class="col-md-8">Category</div>
											<div class="col-md-4">700$</div>
										</div>
									</div>
									<div class="combo-content d-flex justify-content-between align-items-center">
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
											tempor incididunt
											ut labore et
											dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
											ullamco laboris
											nisi</p>
									</div>
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
			</jsp:body>
		</t:genericpage>