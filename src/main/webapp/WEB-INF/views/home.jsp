<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<t:genericpage pageTitle="Home">
	<jsp:attribute name="pageCSSLink">
		<link rel="stylesheet" type="text/css"
			  href="${pageContext.request.contextPath}/resources/css/pages/home.css">
		<link rel="stylesheet" id="nd_options_style-css" href="http://www.nicdarkthemes.com/themes/travel/wp/demo/love-travel/wp-content/plugins/nd-shortcodes/css/style.css?ver=5.2.1" type="text/css" media="all">
    <link rel="stylesheet" id="nicdark-style-css" href="http://www.nicdarkthemes.com/themes/travel/wp/demo/love-travel/wp-content/themes/lovetravel/style.css?ver=5.2.1" type="text/css" media="all">
    <link rel="stylesheet" id="js_composer_front-css" href="//www.nicdarkthemes.com/themes/travel/wp/demo/love-travel/wp-content/uploads/sites/3/js_composer/js_composer_front_custom.css?ver=5.4.7" type="text/css" media="all">
    <script type="text/javascript" src="http://www.nicdarkthemes.com/themes/travel/wp/demo/love-travel/wp-includes/js/jquery/jquery.js?ver=1.12.4-wp"></script>
	
	</jsp:attribute>
	<jsp:body>
		<!--Landing Section-->
		<section class="landing" style="background: linear-gradient( rgba(0, 0, 0, 0.4) 100%,
										rgba(0, 0, 0, 0.4)100%),
		  								url('${pageContext.request.contextPath}/resources/images/home-page-background.jpg') -150px -200px no-repeat;">
					<h1 class="landing-h1">SEARCH FOR YOUR BEST ADVENTURE</h1>
					<h3 class="landing-h3">Check out out best promotions</h3>
					<div class="search-container">
						<form:form action="tour-list" modelAttribute="contentSearchPackage">
							<div class="search-bar">
								<form:input path="destination" name="destination" id="" placeholder="Where would you want to go?..."/>
								<input type="submit" value="  "
									   width="47px" height="47px"
									   style="background: url('${pageContext.request.contextPath}/resources/images/icons/magniGlass.svg') no-repeat center transparent;
                        					  background-size: auto;
                        					  border-style: none;">
									   
							</div>
						</form:form>
					</div>
				</section>
				
				<!-- Typology section -->
				<section class="mt-5 pt-5 pb-5">
					<div class="d-flex justify-content-center">
						<div class="mb-3 border-0" style="max-width: 540px;">
						  <div class="row g-0">
						    <div class="col-md-2">
						      <img
								src="${pageContext.request.contextPath}/resources/images/icon-island.png"
								alt="Relax Tour" class="typo-icon float-end pt-4">
						    </div>
						    <div class="col-md-10">
						      <div class="card-body pl-1">
						        <p class="text-dark">Have most interesting type of tour, not going around and observing places, but it can guarantee for relaxation after stressfull days at work.</p>
						        <a class="rounded-pill btn-typo btn-typo--1"
									href="${pageContext.request.contextPath}/tour-list?typologyID=1">RELAX</a>
						      </div>
						    </div>
						  </div>
						</div>
						
						<div class="mb-3 border-0" style="max-width: 540px;">
						  <div class="row g-0">
						    <div class="col-md-2">
						      <img
								src="${pageContext.request.contextPath}/resources/images/icon-landmark.png"
								alt="Relax Tour" class="typo-icon float-end pt-4">
						    </div>
						    <div class="col-md-10">
						      <div class="card-body pl-1">
						        <p class="text-dark">Includes tours to discover historic cities and their cultural facilities such as museums and theaters.</p>
						        <a class="rounded-pill btn-typo btn-typo--2"
									href="${pageContext.request.contextPath}/tour-list?typologyID=4">HISTORY</a>
						      </div>
						    </div>
						  </div>
						</div>
					</div>
						
						<div class="d-flex justify-content-center">
							<div class="mb-3 border-0" style="max-width: 540px;">
						  <div class="row g-0">
						    <div class="col-md-2">
						      <img
								src="${pageContext.request.contextPath}/resources/images/t-cultural.png"
								alt="Relax Tour" class="typo-icon float-end pt-4">
						    </div>
						    <div class="col-md-10">
						      <div class="card-body pl-1">
						        <p class="text-dark">Contains tours in urban areas, mainly concerned with a country or region's culture, espeacially it's art.</p>
						        <a class="rounded-pill btn-typo btn-typo--3"
									href="${pageContext.request.contextPath}/tour-list?typologyID=2">CULTURAL</a>
						      </div>
						    </div>
						  </div>
						</div>
						
						<div class="mb-3 border-0" style="max-width: 540px;">
						  <div class="row g-0">
						    <div class="col-md-2">
						      <img
								src="${pageContext.request.contextPath}/resources/images/icon-boat.png"
								alt="Relax Tour" class="typo-icon float-end pt-4">
						    </div>
						    <div class="col-md-10">
						      <div class="card-body pl-1">
						        <p class="text-dark">Includes the performance of acts that require significant effort and may involve some degress of risk.</p>
						        <a class="rounded-pill btn-typo btn-typo--4"
									href="${pageContext.request.contextPath}/tour-list?typologyID=3">ADVENTURE</a>
						      </div>
						    </div>
						  </div>
						</div>
						</div>
						
						<a class="home-cta--dark rounded-pill mt-5 mb-5"
				href="${pageContext.request.contextPath}/all-tours">CHECK ALL TOURS</a>
				</section>
				
				<!--Destination Section-->
				<section class="destination">
					<h2 class="destination-h2">Popular Destinations</h2>
					<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					<c:forEach items = "${popularList}" var = "plist">
						<div class="col-md-4">
							<div class="destination-card vietnam" style="background: url('${pageContext.request.contextPath}/resources/images/${plist.nationName}.jpg') no-repeat top; 
		   background-size: cover;">
								<div class="destination-text">
									<a href="${pageContext.request.contextPath}/tour-list?nationID=${plist.nationID}">${plist.nationName}</a>
									<h4><c:out value="${plist.tours.size()}"/> packages</h4>
								</div>
							</div>
						</div>
					</c:forEach>
					</div>
				</section>
				
				<!--banner-->
				<section class="text-white statistic" style="background: linear-gradient( rgba(160, 162, 161, 0.6) 100%, rgba(160, 162, 161, 0.6)100%), url('${pageContext.request.contextPath}/resources/images/banner-home.jpg') no-repeat top; ">
			   			<div class="d-flex">
			   				<div class="check-symbol mr-3">
			   					<img src="${pageContext.request.contextPath}/resources/images/check-symbol.png" alt="icon" class="img-fluid">
			   				</div>
							<h3 class="d-flex flex-column fw-bold fs-1"><span>Do the right thing,</span> <span>at the right time.</span></h3>
			   			</div>
						<div class="ml-5 d-flex mt-5 ml-5">
							<div class="d-flex flex-column align-items-center">
								<span class="fw-bold fs-1">${totalDestination }</span>
								<span class="fs-5">TOURS</span>
							</div>
							
							<div class="ml-5 d-flex flex-column align-items-center">
								<span class="fw-bold fs-1">${totalNation }</span>
								<span class="fs-5">NATIONS</span>
							</div>
							
							<div class="ml-5 d-flex flex-column align-items-center">
								<span class="fw-bold fs-1">${totalBookedTour }</span>
								<span class="fs-5">BOOKED TOURS</span>
							</div>
							
							<div class="ml-5 d-flex flex-column align-items-center">
								<span class="fw-bold fs-1">${totalAccount }</span>
								<span class="fs-5">CUSTOMERS</span>
							</div>
						</div>
				</section>
				
				<!--Combo Section-->
				<section class="combo">
				
					<h2 class="combo-h2">Promotions</h2>
					<div class="d-md-flex">
						<c:forEach items = "${tourList}" var = "list">
							<c:forEach items = "${imgList}" var = "imgList">
								<c:if test = "${imgList.tourID.tourID == list.tourID}">
			                		<div class="related-tour__card col-xl-4 mt-3 mb-3">
				               			<div class="related-tour__card-img">
															<img src="${imgList.imageURL}" alt="${list.tourName} Thumbnail Image" style="width:100%; height: 200px;" class="img-fluid">
														 </div>
					                    <div class="border p-4 ">
					                        <div class="mb-2">
					                            <p class="combo-name d-flex justify-content-between align-items-center" style = "font-weight: bold; color: black; font-size: 25px; padding: 5px 0px">
			                        				<span>${list.tourName}</span>
			                        				<c:if test = "${list.discount != 0.0}">
			                        					<span style = "color: red; font-size: 15px; font-weight:100;">- ${list.discount} % </span>
			                        				</c:if>
			                        			</p>
					                        </div>
					                        <div class="d-flex justify-content-between align-items-center border-top border-bottom pt-2 pb-2 mb-3">
					                            <div class="card__category">
					                                <p style = "font-size:20px">${list.typology.typologyName}</p>
					                            </div>
																			<c:choose>
																				<c:when test = "${list.discount == 0.0}">
					                            		<p style="font-size: 30px; color: red; font-weight: bold;">${list.price}$</p>
																				</c:when>
																				<c:otherwise>
					                            		<div class="d-flex justify-content-between align-items-center">
																						<p style="font-size: 20px;" class="mr-3"><s>${list.price}$</s></p>
																						<p style="font-size: 30px; color: red;" class="fw-bold">${list.price - list.price * list.discount / 100}$</p>
																					</div>
																				</c:otherwise>
																			</c:choose>
					                        </div>
					
					                        <div class="card__des mb-3">
					                            <p style="font-size: 17px; color: black; height: 150px">${list.shortDesc}</p>
					                        </div>
					
					                        <a class="adetail" href="${pageContext.request.contextPath}/tour-detail/${list.tourID}">
							                            <button class="btn btn-danger" style = "font-weight: bold">View</button>
							              	</a>
											<button data-type="addWishlist" data-link="${pageContext.request.contextPath}/wishlist/api?action=add&id=${list.tourID}" class="float-right text-danger addWishlist" style = "padding: 0; margin: 0; border:none; background-color:white"><i class="far fa-heart fs-1"></i></button>
					                    </div>
			                	 </div>
		                	 </c:if>
		              	</c:forEach>
	                  </c:forEach>
            	</div>
				</section>
				
			<script type="text/javascript" src="http://www.nicdarkthemes.com/themes/travel/wp/demo/love-travel/wp-content/plugins/js_composer/assets/js/dist/js_composer_front.min.js?ver=5.4.7"></script>
	
           
				
			</jsp:body>
		</t:genericpage>