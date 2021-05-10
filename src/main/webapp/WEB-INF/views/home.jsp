<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
						<form:form action="/action_page.php" modelAttribute="textSearch">
							<div class="search-bar">
								<form:input path="text" type="text" placeholder="Where would you want to go?..." name="search" />
								<input type="submit" value=""
									   width="47px" height="47px"
									   style="background: url('${pageContext.request.contextPath}/resources/images/icons/magniGlass.svg') no-repeat center transparent;
                        					  background-size: 100%;
                        					  border-style: none;"	>
							</div>
						</form:form>
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
					<div class="d-md-flex">
                <div class="related-tour__card col-xl-4 mt-3 mb-3">
                    <img src="${pageContext.request.contextPath}/resources/images/tour-detail-img/package-1-1024x640.jpg" alt="" style="width:100%; height: auto;">
                    <div class="border p-4 ">
                        <div class="mb-2">
                            <a class="adetail" href="#">
                                <h5>Berlin</h5>
                            </a>
                            <a class="adetail" href="">
                                <p><i class="fas fa-map-marker-alt"></i> Europe</p>
                            </a>
                        </div>
                        <div class="d-flex justify-content-between align-items-center border-top border-bottom pt-2 pb-2 mb-3">
                            <div class="card__category">
                                <p>CULTURAL</p>
                                <p>RELAX <span style=" background-color: red; border-radius: 15px; padding: 2px 10px; color: white;">+ 2</span></p>
                            </div>
                            <p style="font-size: 30px; color: black;">700$</p>
                        </div>

                        <div class="card__des mb-3">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ut efficitur ante. Donec dapibus dictum scelerisque.</p>
                        </div>

                        <a class="adetail" href="">
                            <button class="card__button--color">DETAILS</button>
                        </a>

                    </div>
                </div>

                <div class="related-tour__card col-xl-4 mt-3 mb-3">
                    <img src="${pageContext.request.contextPath}/resources/images/tour-detail-img/package-1-1024x640.jpg" alt="" style="width:100%; height: auto;">
                    <div class="border p-4 ">
                        <div class="mb-2">
                            <a class="adetail" href="#">
                                <h5>Berlin</h5>
                            </a>
                            <a class="adetail" href="">
                                <p><i class="fas fa-map-marker-alt"></i> Europe</p>
                            </a>
                        </div>
                        <div class="d-flex justify-content-between align-items-center border-top border-bottom pt-2 pb-2 mb-3">
                            <div class="card__category">
                                <p>HISTORY</p>
                                <p>RELAX <span style=" background-color: red; border-radius: 15px; padding: 2px 10px; color: white;">+ 2</span></p>
                            </div>
                            <p style="font-size: 30px; color: black;">700$</p>
                        </div>

                        <div class="card__des mb-3">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ut efficitur ante. Donec dapibus dictum scelerisque.</p>
                        </div>

                        <a class="adetail" href="">
                            <button class="card__button--color">DETAILS</button>
                        </a>

                    </div>
                </div>

                <div class="related-tour__card col-xl-4 mt-3 mb-3">
                    <img src="${pageContext.request.contextPath}/resources/images/tour-detail-img/package-1-1024x640.jpg" alt="" style="width:100%; height: auto;">
                    <div class="border p-4 ">
                        <div class="mb-2">
                            <a class="adetail" href="#">
                                <h5>Berlin</h5>
                            </a>
                            <a class="adetail" href="">
                                <p><i class="fas fa-map-marker-alt"></i> Europe</p>
                            </a>
                        </div>
                        <div class="d-flex justify-content-between align-items-center border-top border-bottom pt-2 pb-2 mb-3">
                            <div class="card__category">
                                <p>SPORT</p>
                                <p>RELAX <span style=" background-color: red; border-radius: 15px; padding: 2px 10px; color: white;">+ 2</span></p>
                            </div>
                            <p style="font-size: 30px; color: black;">700$</p>
                        </div>

                        <div class="card__des mb-3">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ut efficitur ante. Donec dapibus dictum scelerisque.</p>
                        </div>

                        <a class="adetail" href="">
                            <button class="card__button--color">DETAILS</button>
                        </a>

                    </div>
                </div>
            </div>
				</section>
			</jsp:body>
		</t:genericpage>