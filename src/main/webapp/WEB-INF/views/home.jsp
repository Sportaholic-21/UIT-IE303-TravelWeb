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
		<section class="landing" style="background: linear-gradient( rgba(0, 0, 0, 0.4) 100%,
										rgba(0, 0, 0, 0.4)100%),
		  								url('${pageContext.request.contextPath}/resources/images/home-page-background.jpg') -150px -200px no-repeat;">
					<h1 class="landing-h1">SEARCH FOR YOUR BEST ADVENTURE</h1>
					<h3 class="landing-h3">Check out out best promotions</h3>
					<div class="search-container">
						<form:form action="tour-list" modelAttribute="contentSearchPackage">
							<div class="search-bar">
								<form:input path="destination" type="text" placeholder="Where would you want to go?..." name="destination" />
								<input type="submit" value="    "
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
						        <p class="text-dark">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean egestas magna at porttitor vehicula nullam augue ipsum dolor.</p>
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
						        <p class="text-dark">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean egestas magna at porttitor vehicula nullam augue ipsum dolor.</p>
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
						        <p class="text-dark">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean egestas magna at porttitor vehicula nullam augue ipsum dolor.</p>
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
						        <p class="text-dark">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean egestas magna at porttitor vehicula nullam augue ipsum dolor.</p>
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
							<div class="destination-card shadow-sm vietnam" style="background: url('${pageContext.request.contextPath}/resources/images/${plist.nationName}.jpg') no-repeat top; 
		   background-size: cover;">
								<div class="destination-text">
									<h3>${plist.nationName}</h3>
									<h4><c:out value="${plist.tours.size()}"/> packages</h4>
								</div>
							</div>
						</div>
					</c:forEach>
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
				               			<img src="${imgList.imageURL}" alt="${list.tourName} Thumbnail Image" style="width:100%; height: 200px;">
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
					                            <p style="font-size: 30px; color: red; font-weight: bold;">${list.price}$</p>
					                        </div>
					
					                        <div class="card__des mb-3">
					                            <p style="font-size: 17px; color: black; height: 150px">${list.shortDesc}</p>
					                        </div>
					
					                        <a class="adetail" href="${pageContext.request.contextPath}/tour-detail/${list.tourID}">
							                            <button class="btn btn-danger" style = "font-weight: bold">View</button>
							              	</a>
											<button data-type="addWishlist" data-link="${pageContext.request.contextPath}/wishlist/api?action=add&id=${list.tourID}" class="float-right text-danger addWishlist" style = "padding: 0; margin = 0; border:none; background-color:white"><i class="far fa-heart fs-1"></i></button>
					                    </div>
			                	 </div>
		                	 </c:if>
		              	</c:forEach>
	                  </c:forEach>
            	</div>
				</section>
			</jsp:body>
		</t:genericpage>