<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items = "${tourList}" var = "obj">
<t:genericpage pageTitle="${obj.tourName}">
	<jsp:attribute name="pageCSSLink">
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/resources/css/pages/tour-detail.css">
        <link href="https://api.mapbox.com/mapbox-gl-js/v2.3.0/mapbox-gl.css" rel="stylesheet">
		<script src="https://api.mapbox.com/mapbox-gl-js/v2.3.0/mapbox-gl.js"></script>

		<style type="text/css">
			.marker {
				background:
					url("${pageContext.request.contextPath}/resources/user/img/map_marker_1.png");
				background-size: cover;
				width: 30px;
				height: 30px;
				border-radius: 50%;
				cursor: pointer;
			}
		</style>
	</jsp:attribute>
	<jsp:body>
  	<div class="body__tour-detail pt-0">
  	<c:forEach items = "${coverImageDisplay}" var = "cid">
  			<div class="cover" style="background-image: linear-gradient(rgba(0, 0, 0, 0.5),rgba(0, 0, 0, 0.4)) ,url('${cid.imageURL}');" title = "${cid.tourImageName}">
        		<span></span>
		        <div class="container">
		            <div class="cover-info">
		                <h1 class="cover-info__name col-12 p-0">${obj.tourName}</h1>
		                <div class="d-flex flex-column bd-highlight mp-3 ">
		                	<div class="p-2 bd-highlight"><i class="fas fa-map-marker-alt"></i> ${obj.nation.nationName} - ${obj.nation.continent.continentName}</div>
		  					<div class="p-2 bd-highlight"><i class="far fa-clock"></i> ${obj.duration} DAYS</div>
		                </div>
		            </div>
		        </div>
    		</div>
	</c:forEach>
    <div class="container tour-info ">
        <div class="tour-info__detail d-xl-flex">
            <div class="detail__left col-xl-8">
                <section
							class="detail__left__group d-xl-flex justify-content-between mt-5 mb-3">
                    <div
								class="detail__left__items d-flex align-items-center  justify-content-center col-xl-4 mb-3">
                        <!-- <i class="fas fa-project-diagram mr-3"></i> -->
                        <img
									src="${pageContext.request.contextPath}/resources/images/tour-detail-img/icon-typologies-greydark.png"
									alt="">
                        <div>
                            <h6>TYPOLOGIES</h6>
                            <p>
                               ${obj.typology.typologyName}
                            </p>
                        </div>
                    </div>
                    <div
								class="detail__left__items d-flex align-items-center justify-content-center col-xl-4 mb-3">
                        <!-- <i class="fas fa-battery-full mr-3"></i> -->
                        <img
									src="${pageContext.request.contextPath}/resources/images/tour-detail-img/icon-battery-greydark.png"
									alt="">
                        <div>
                            <h6>DIFFICULTY</h6>
                            <p>Low</p>
                        </div>
                    </div>
                    <div
								class="detail__left__items d-flex align-items-center justify-content-center col-xl-4 mb-3">
                        <!-- <i class="fas fa-id-card mr-3"></i> -->
                        <img
									src="${pageContext.request.contextPath}/resources/images/tour-detail-img/icon-minage-greydark.png"
									alt="">
                        <div>
                            <h6>MIN. AGE</h6>
                            <p>18 years</p>
                        </div>
                    </div>
                </section>

                <section class="detail__left__img">
                    <div class="header-form">
                        <p>
									<span></span></p>
                    </div>
                    <c:forEach items = "${galleryImagesDisplay}" var = "gal" varStatus = "loop">
						    	<c:if test = "${loop.first}">
						      		<img class = "cropped" src = "${gal.imageURL}"  alt = "${gal.tourImageName}" style="width: 100%">
						    	</c:if>
					</c:forEach> 
                </section>

                <section class="directToParam mt-4 mb-4 ">

                    <ul class="nav d-xl-flex justify-content-around">
                        <li class="nav-item ">
                            <a class="nav-link nav-linka active adetail"
									href="#description">DESCRIPTION</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-linka adetail"
									href="#map">MAP</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link nav-linka adetail"
									href="#gallery">GALLERY</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link nav-linka adetail"
									href="#program">PROGRAM</a>
                        </li>
                    </ul>
                </section>

                <section class="tour-des section--border-bot "
							id="description ">
                    <h2 class="tour-des__title mb-3 ">Amazing Experience</h2>
                    <div class="tour-des__content ">
                        <p class="mb-3 ">
                           ${obj.desc}
                        </p>
                        <div class="d-flex justify-content-between">
                        	<button id="printPDF" class="btn btn-warning">Print to PDF <i class="fa fa-print"></i></button>
                        	<button id="wishlistBtn" data-type="addWishlist" data-link="${pageContext.request.contextPath}/wishlist/api?action=add&id=${obj.tourID}" class="p-2 fs-6 btn btn-danger float-right addWishlist" style = "margin: 0; border:none;"><i class="far fa-heart"></i> Add to wishlist</button>
                        </div>
                        <div class="content__table ">
                            <table class="">
                                <tr class=" ">
                                    <th>Entrance to the museums</th>
                                    <td>50% discount on all admissions</td>
                                </tr>
                                <tr>
                                    <th>Travel with children and pets</th>
                                    <td>Possibility to rent the stroller</td>
                                </tr>
                                <tr>
                                    <th>Travel by bus, car and minivan</th>
                                    <td>Air conditioning guaranteed</td>
                                </tr>
                                <tr>
                                    <th>Package specifications</th>
                                    <td>
                                        <ul>
                                            <li class="d-flex"><i
														class="fas fa-check text-success mr-2"></i> Travel cancellation insurance</li>
                                            <li class="d-flex"><i
														class="fas fa-check text-success mr-2"></i> Breakfast and dinner included</li>
                                            <li class="d-flex"><i
														class="fas fa-check text-success mr-2"></i> Health care included</li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Services NOT included</th>
                                    <td>
                                        <ul>
                                            <li class="d-flex"><i
														class="fas fa-times text-danger mr-2"></i> Lunch not included in the package</li>
                                            <li class="d-flex"><i
														class="fas fa-times text-danger mr-2"></i> Baggage protection insurance</li>
                                        </ul>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </section>


                <h2 class="tour-map__title mb-3">Tour Map</h2>
                <section class="tour-map section--border-bot pb-4">
                   <div id="map"></div>
                </section>

                <section class="tour-gallery section--border-bot pb-4 "
							id="gallery">
							
                    <h2 class="tour-gallery__title mb-3 ">Gallery</h2>
                    <div id="gallery-carousel" class="carousel slide" data-ride="carousel">
						  <div class="carousel-inner">
						    <c:forEach items = "${galleryImagesDisplay}" var = "gal" varStatus = "loop">
						    	<c:if test = "${loop.first}">
						    		<div class="carousel-item active">
						      				<img class = "cropped" src = "${gal.imageURL}"  alt = "${gal.tourImageName}" style="width: 100%">
						    		</div>
						    	</c:if>
						    	<c:if test = "${!loop.first}">
						    		<div class="carousel-item">
						      			<img class = "cropped" src = "${gal.imageURL}"  alt = "${gal.tourImageName}" style="width: 100%">
						    		</div>
						    	</c:if>
						    </c:forEach> 
						  </div>
						  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
						    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
						    <span class="sr-only">Previous</span>
						  </a>
						  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
						    <span class="carousel-control-next-icon" aria-hidden="true"></span>
						    <span class="sr-only">Next</span>
						  </a>
						</div>
                </section>
				
                <section class="tour-program section--border-bot pb-4 "
							id="program">
                    <h2 class="tour-program__title mb-3 ">Day by Day</h2>
                    <div>
                        <c:forEach items = "${tourSchedule}" var = "sch" varStatus = "loop">
                        <ul>
                            <li class="d-flex">
                            	<i class="fas fa-plus-square mr-3 color--primary "></i>
                     			<span>
                     				<strong><a id="day" class ="text-danger" data-toggle="collapse" href="#collapse${loop.count}">DAY ${loop.count}</a></strong>
	                                <div id="collapse${loop.count}" class="schedule panel-collapse collapse">
												<span>
													<c:forTokens items = "${sch}" var = "name" delims = ";" >
		         										<c:out value = "${name}"/><p>
		     										</c:forTokens>
												</span>
									</div>
								</span>
                            </li>
                            
                        </ul>
                        </c:forEach>
                    </div>
                </section>

            </div>
            <div class="detail__right col-4">
                <section class="form-send-now">
                    <div class="header-form">
                    	<c:choose>
	                    	<c:when test = "${obj.discount != 0.0}">
				        		<p><span> ${obj.price}$</span>  ${obj.priceDiscount}$</p>
				            </c:when>
				            <c:otherwise>
				            	<p>${obj.price}$</p>
				            </c:otherwise>
			            </c:choose>
                        
                    </div>
                    <form:form id="form-send-now" action="${pageContext.request.contextPath}/sendContact"
								modelAttribute="messageContact">
                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <form:input path="name" type="text" class="form-control"
											id="name" placeholder="Name" />
                            </div>
                            
                        </div>
                        <div class="form-group">
                            <form:input path="email" type="email" class="form-control"
										id="email" placeholder="Email" />                                                    
                        </div>
                        <div class="form-group">
                            <form:input path="phone" class="form-control"
										id="phone" placeholder="Phone" />
                        </div>
                        <div class="form-group">
                            <form:textarea path="message" rows="4" class="form-control"
										form="form-send-now" placeholder="Message"></form:textarea>
                        </div>
                        <button type="submit"
									style="background-color: var(--color_primary);">SEND NOW</button>

                    </form:form>

                </section>

                <section class="detail-right__img">
                    <img
								src="${pageContext.request.contextPath}/resources/images/tour-detail-img/parallax-12.jpg"
								alt="" style="width: 100%;">
                </section>

                <section class="best-packages">
                    <h5>Best Packages</h5>
                    <div id="best-packages-content"></div>
                    <!--<script> 
                        tourList.forEach(tour => {
			                $("#best-packages-content").append(sidebarTour(tour.tourId, tour.tourName, tour.nationName, tour.price, tour.imageURL))
		                })
                    </script>
                    Axios promise
                    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
                    <script>
                        var sidebarTour = (tourId, tourName, nationName, price, imageURL) => {
                            var data = {
                                tourId: tourId,
                                tourName: tourName,
                                nationName: nationName,
                                price: price,
                                imageURL: imageURL
                            }
                            var template = [
                                '<div class="d-flex position-relative mt-3 ms-4 me-4 justify-content-center">',
                                    '<div class="sidebar__thumbnail mt-2">',
                                        '<img src="{{imageURL}}" class="img-thumbnail" alt="Package thumbnail">',
                                    '</div>',
                                    '<a class="d-block ms-4 text-decoration-none" href="#">',
                                        '<p class="fs-4 m-0">{{tourName}}</p>',
                                        '<p class="fs-6 fw-light"><span class="sidebar__location-icon d-inline-block me-1">',
                                            '<img src="${pageContext.request.contextPath}/resources/images/sidebar-location-icon.png" class="img-fluid" alt="Location icon">',
                                        '</span><span>{{nationName}}</span></p>',
                                        '<p class="lh-lg mt-3 bg-warning rounded-pill ps-4 pe-4 text-white sidebar__package-price">FROM	{{price}} $</p>',
                                    '</a>',
                                '</div>'
                            ].join("\n");
                            var html = Mustache.render(template,data);
                            $("#best-packages-content").append(html)
                        }
                        axios.get("sidebarTourList").then(function(res){
                            var arr = [] = res.data; 
                            arr.forEach(tour => {
                                sidebarTour(tour.tourId, tour.tourName, tour.nationName, tour.price, tour.imageURL)
                            })
                        })
                    </script>-->
                </section>

                <section class="search mb-5">
                    <h5>Search</h5>
                    <form:form action="${pageContext.request.contextPath}/tour-list" modelAttribute="contentSearchPackage">
                        <div class="form-group col-md-12 pl-0">
                            <form:input path = "destination" class="form-select" name="destination" id="" style="background-image: url('${pageContext.request.contextPath}/resources/images/tour-list/icons/pin.svg')"/>
                        </div>
                        <button type="submit"
									style="background-color: var(--color_primary);">SEARCH</button>
                    </form:form>
                </section>

                <section class="destination"
							style="background-image: url('${pageContext.request.contextPath}/resources/images/tour-detail-img/parallax-3-1.jpg');">
               
                    <span></span>
                    
	                    <div class="view-destination">
	                        <h5 class="mb-3">Packages</h5>
	                        <c:forEach items = "${nationList}" var = "nList">
	                        	<a class="" href="${pageContext.request.contextPath}/tour-list?nationID=${nList.nationID}">${nList.nationName}</a>
	                        </c:forEach>
	                        <a class="" href="${pageContext.request.contextPath}/tour-list?continentID=${obj.nation.continent.continentID}"><button class="mt-3 btt" style="color: rgba(0,0,0,0.5)">view destination</button></a>
	                    </div>
	                    <div class="view-destination-before">
	                        <h5>${obj.nation.continent.continentName}</h5>
	                        <c:choose>
	                        	<c:when test="${packageNum} > 1">
	                        		<p><c:out value="${packageNum}"></c:out> packages</p>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<p><c:out value="${packageNum}"></c:out> package</p>
	                        	</c:otherwise>
	                        </c:choose>
	                    </div>
                    
                </section>
                <section class="tags">
                    <h5>Tags</h5>
                    <div class="tags-list">
                        <a class="adetail" href="${pageContext.request.contextPath}/tour-list?nationID=${obj.nation.nationID}">${obj.nation.nationName}</a>
                        <a class="adetail" href="${pageContext.request.contextPath}/tour-list?continentID=${obj.nation.continent.continentID}">${obj.nation.continent.continentName}</a>
                        <a class="adetail" href="${pageContext.request.contextPath}/tour-list?typologyID=${obj.typology.typologyID}">${obj.typology.typologyName }</a>
                    </div>
                </section>
                
                 <!-- feedback  -->
                <section class="feedback">
                    <h5>Feedback</h5>
                    <c:if test="${feedbackListcheck!=0}">
                    <p class="text-danger fs-6"><span class="fw-bold">${obj.numberFeedback}</span> in average based on <span class="fw-bold">${feedbackListcheck}</span> reviews</p>
                    <hr />
                    <ul class="nav nav-pills" id="pills-tab" role="tablist">
					  <li class="nav-item" role="presentation">
					    <button class="nav-link active" id="pills-all-tab" data-bs-toggle="pill" data-bs-target="#pills-all" type="button" role="tab" aria-controls="pills-home" aria-selected="true">All</button>
					  </li>
					  <li class="nav-item" role="presentation">
					    <button class="nav-link" id="pills-pos-tab" data-bs-toggle="pill" data-bs-target="#pills-pos" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">Positive</button>
					  </li>
					  <li class="nav-item" role="presentation">
					    <button class="nav-link" id="pills-neg-tab" data-bs-toggle="pill" data-bs-target="#pills-neg" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">Negative</button>
					  </li>
					</ul>
					<div class="tab-content mt-3" id="pills-tabContent">
					  <div class="tab-pane fade show active" id="pills-all" role="tabpanel" aria-labelledby="pills-all-tab">
					  		<c:forEach items="${feedbackList}" var="o">
			                    <div class="feedback-content mb-5">
			                        <div class="feedback-info">
			                            <p>
											<img
												src="${o.tourBookingID.account.avatar}"
												alt="">
											</p>
			                            <div class="w-100">
			                            <a href="${pageContext.request.contextPath}/overview/${o.tourBookingID.account.username}">
			                                <h6 class="username text-primary mt-3">${o.tourBookingID.account.fullName}</h6>
			                                <p class="fw-bold text-warning m-0"> @${o.tourBookingID.account.username} </p>
			                              </a>
			                                <div class="d-flex justify-content-between pr-4">
			                                	<p class="m-0">${o.tourBookingID.scheduleDate} </p>
			                                	<p class="text-info fw-bold">${o.start} / 5 </p>
			                                </div>
			                            </div>
			                            <div class="tour-detail_sentiment-icon">
			                            	<c:choose>
			                            		<c:when test="${o.sentimentStatus == 1}">
			                            			<img class="img-fluid m-0" src="${pageContext.request.contextPath}/resources/images/pos-sentiment-icon.png" />
			                            		</c:when>
			                            		 <c:otherwise>
													<img class="img-fluid m-0 tour-detail_sentiment-icon--sad" src="${pageContext.request.contextPath}/resources/images/neg-sentiment-icon.png" />
										        </c:otherwise>
			                            	</c:choose>
			                            </div>
			                        </div>
			                        <div class="content" style="padding: 15px;">${o.feedbackMessage}</div>
			                    </div>
								</c:forEach>
					  </div>
					  <div class="tab-pane fade" id="pills-pos" role="tabpanel" aria-labelledby="pills-pos-tab">
					  		<c:forEach items="${feedbackListPos}" var="o">
			                    <div class="feedback-content mb-5">
			                        <div class="feedback-info">
			                            <p>
											<img
												src="${o.tourBookingID.account.avatar}"
												alt="">
											</p>
			                            <div class="w-100">
			                            <a href="${pageContext.request.contextPath}/overview/${o.tourBookingID.account.username}">
			                                <h6 class="username text-primary mt-3">${o.tourBookingID.account.fullName}</h6>
			                                <p class="fw-bold text-warning m-0"> @${o.tourBookingID.account.username} </p>
			                              </a>
			                                <div class="d-flex justify-content-between pr-4">
			                                	<p class="m-0">${o.tourBookingID.scheduleDate} </p>
			                                	<p class="text-info fw-bold">${o.start} / 5 </p>
			                                </div>
			                            </div>
			                            <div class="tour-detail_sentiment-icon">
			                            	<c:choose>
			                            		<c:when test="${o.sentimentStatus == 1}">
			                            			<img class="img-fluid m-0" src="${pageContext.request.contextPath}/resources/images/pos-sentiment-icon.png" />
			                            		</c:when>
			                            		 <c:otherwise>
													<img class="img-fluid m-0 tour-detail_sentiment-icon--sad" src="${pageContext.request.contextPath}/resources/images/neg-sentiment-icon.png" />
										        </c:otherwise>
			                            	</c:choose>
			                            </div>
			                        </div>
			                        <div class="content" style="padding: 15px;">${o.feedbackMessage}</div>
			                    </div>
								</c:forEach>
					  </div>
					  <div class="tab-pane fade" id="pills-neg" role="tabpanel" aria-labelledby="pills-neg-tab">
					  		<c:forEach items="${feedbackListNeg}" var="o">
			                    <div class="feedback-content mb-5">
			                        <div class="feedback-info">
			                            <p>
											<img
												src="${o.tourBookingID.account.avatar}"
												alt="">
											</p>
			                            <div class="w-100">
			                            <a href="${pageContext.request.contextPath}/overview/${o.tourBookingID.account.username}">
			                                <h6 class="username text-primary mt-3">${o.tourBookingID.account.fullName}</h6>
			                                <p class="fw-bold text-warning m-0"> @${o.tourBookingID.account.username} </p>
			                              </a>
			                                <div class="d-flex justify-content-between pr-4">
			                                	<p class="m-0">${o.tourBookingID.scheduleDate} </p>
			                                	<p class="text-info fw-bold">${o.start} / 5 </p>
			                                </div>
			                            </div>
			                            <div class="tour-detail_sentiment-icon">
			                            	<c:choose>
			                            		<c:when test="${o.sentimentStatus == 1}">
			                            			<img class="img-fluid m-0" src="${pageContext.request.contextPath}/resources/images/pos-sentiment-icon.png" />
			                            		</c:when>
			                            		 <c:otherwise>
													<img class="img-fluid m-0 tour-detail_sentiment-icon--sad" src="${pageContext.request.contextPath}/resources/images/neg-sentiment-icon.png" />
										        </c:otherwise>
			                            	</c:choose>
			                            </div>
			                        </div>
			                        <div class="content" style="padding: 15px;">${o.feedbackMessage}</div>
			                    </div>
								</c:forEach>
					  </div>
					</div>
                    
					
                    </c:if>
                    
                    <c:if test="${feedbackListcheck==0 }">
                    <div>
                    
                    	<p style="font-size:14px;">This tour hasn't had any feedback yet.</p>
                    
                    </div>
                    </c:if>
                    
                    

                </section>
                
            </div>

        </div>
        <section class="section--border-bot "></section>
        <div class="tour-info__related-tour mt-5 mb-5">
            <div class="related-tour__title">
                <h6>RELATED</h6>
                <h2>PACKAGES</h2>
            </div>
            <div class="d-md-flex">
            <c:forEach items = "${relatedList}" var = "list">
                <c:forEach items = "${imgList}" var = "imgList">
					<c:if test = "${imgList.tourID.tourID == list.tourID}">
			        	<div class="related-tour__card col-xl-4 mt-3 mb-3">
				        		<div class="related-tour__card-img"><img src="${imgList.imageURL}" alt="${list.tourName} Thumbnail Image" style="width:100%; height: 200px;"></div>
					        	<div class="border p-4 ">
					            	<div class="mb-2">
					                	<p class="combo-name d-flex justify-content-between align-items-center" style = "font-weight: bold; color: black; font-size: 25px;">
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
					                    <div>
					                    	<c:choose>
												<c:when test = "${list.discount == 0.0}">
					                            		<p style="font-size: 30px; color: red; font-weight: bold;">${list.price}$</p>
												</c:when>
												<c:otherwise>
					                            	<div class="d-flex justify-content-between align-items-center">
														<p style="font-size: 20px;" class="mr-3"><s>${list.price}$</s></p>
														<p style="font-size: 30px; color: red;" class="fw-bold">${list.priceDiscount}$</p>
													</div>
												</c:otherwise>
											</c:choose>																									
					                    </div>
					                    </div>
					
					                  <div class="card__des mb-3">
					                  	<p style="font-size: 17px; color: black; height: 200px">${list.shortDesc}</p>
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

        </div>
    </div>
  		</div>
		<script
				src="https://unpkg.com/es6-promise@4.2.4/dist/es6-promise.auto.min.js"></script>
			<script
			src="https://unpkg.com/@mapbox/mapbox-sdk/umd/mapbox-sdk.min.js"></script>
			
  		 <script >
  		 var schedualCoordinate = "${schedualCoordinate}";
  		 var coordinateList = schedualCoordinate.split(',');

		var coordinateArr = [];
		var featureArr = [];

		for (var i = 0; i < coordinateList.length; i++) {
			coordinateArr.push(coordinateList.splice(0, 2));
			var tempGeo = {
				type: 'Feature',
				geometry: {
					type: 'Point',
					coordinates: coordinateArr[i]
				},
				properties: {
					title: 'Mapbox',
				}
			}
			featureArr.push(tempGeo);
		}

		mapboxgl.accessToken = 'pk.eyJ1IjoieWxhbnR0IiwiYSI6ImNrcGdpbGdnejA3Y2sydmprMzk4d2gwM20ifQ.Wz5IizkQcBZ6FCBLz3wnEA';

		var map = new mapboxgl.Map({
			container: 'map',
			style: 'mapbox://styles/mapbox/light-v10',
			center: coordinateArr[0],
			zoom: 5
			// starting zoom
		});

		var geojson = {
			type: 'FeatureCollection',
			features: featureArr
		};

		// add markers tomap
		geojson.features
			.forEach(function(marker) {

				// create a HTML element for each feature
				var el = document.createElement('div');
				el.className = 'marker';

				// make a marker for each feature and add to the map
				new mapboxgl.Marker(el)
					.setLngLat(marker.geometry.coordinates)
					.setPopup(
						new mapboxgl.Popup({
							offset: 25
						})
							// add popups
							.setHTML('<p class="text-success font-weight-bold mb-0">hi</p>')).addTo(map);
			});
         </script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js "
			integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN "
			crossorigin="anonymous "></script>
    <script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js "
			integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q "
			crossorigin="anonymous "></script>
    <script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js "
			integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl "
			crossorigin="anonymous "></script>
  	<script>
        $("#printPDF").on("click",() => {
            $(".schedule").addClass("show");
            window.print();
        });
    </script>
    </jsp:body>
</t:genericpage>
</c:forEach>