<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<t:genericpage pageTitle="Hong Kong">
	<jsp:attribute name="pageCSSLink">
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/resources/css/pages/tour-detail.css">
	</jsp:attribute>
	<jsp:body>
  		<div class="body__tour-detail pt-0">
  			<div class="cover"
				style="background-image: url('${pageContext.request.contextPath}/resources/images/tour-detail-img/hongkong-cover.jpg');">
        <span></span>
        <div class="container">
            <div class="cover-info">
                <h1 class="cover-info__name col-12 p-0">Hong Kong</h1>
                <div class="cover-info__prop d-xl-flex ">
                    <div class="mr-4">
								<i class="fas fa-map-marker-alt"></i> ASIA</div>
                    <div class="mr-4">
								<i class="far fa-clock"></i> 1 - 3 DAYS</div>
                </div>
            </div>
        </div>
    </div>

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
                                History
                                <span
											style="background-color: var(- -color_primary); border-radius: 15px; padding: 2px 10px; color: white;">+ 2</span>
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
									<span>1000</span> 500 $</p>
                    </div>
                    <img class="col-xl-12"
								src="${pageContext.request.contextPath}/resources/images/tour-detail-img/hinh-anh-thanh-pho-hongkong-trung-quoc.jpg "
								alt="anh hong kong " />
                </section>

                <section class="directToParam mt-4 mb-4 ">

                    <ul class="nav d-xl-flex justify-content-around">
                        <li class="nav-item ">
                            <a class="nav-link nav-linka active adetail"
									href="#description ">DESCRIPTION</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-linka adetail"
									href="#map ">MAP</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link nav-linka adetail"
									href="#gallery ">PHOTOS</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link nav-linka adetail"
									href="#program ">PROGRAM</a>
                        </li>
                    </ul>
                </section>

                <section class="tour-des section--border-bot "
							id="description ">
                    <h2 class="tour-des__title mb-3 ">Amazing Experience</h2>
                    <div class="tour-des__content ">
                        <p class="mb-3 ">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ut venenatis lorem. Nunc sodales interdum rhoncus. Nulla a leo finibus, ullamcorper lorem vel, scelerisque massa. Vivamus leo dui, interdum non fermentum eget, laoreet ac lorem. Aliquam
                            a ultricies nisl. Nulla consequat lobortis urna sed cursus.
                        </p>
                        <p class="mb-3 ">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ut venenatis lorem. Nunc sodales interdum rhoncus. Nulla a leo finibus, ullamcorper lorem vel, scelerisque massa. Vivamus leo dui, interdum non fermentum eget, laoreet ac lorem. Aliquam
                            a ultricies nisl. Nulla consequat lobortis urna sed cursus.
                        </p>
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


                <section class="tour-map section--border-bot pb-4"
							id="map">
                    <h2 class="tour-map__title mb-3 ">Tour Map</h2>
                    <div class="">
                        <iframe class="col col-xl-12 pl-0 pr-0"
									src="https://www.google.com/maps/d/u/0/embed?mid=1idy021lALsVJj6wBr2dNGF56hvgwm8jX "
									style="border: none; width: 100%; height: 400px;"></iframe>
                    </div>
                </section>

                <section class="tour-gallery section--border-bot pb-4 "
							id="gallery ">
                    <h2 class="tour-gallery__title mb-3 ">Gallery</h2>
                    <div class="d-lg-flex ">
                        <div class="">
                            <div class="d-flex ">
                                <div class=" ">
                                    <img
												src="${pageContext.request.contextPath}/resources/images/tour-detail-img/pack-slide-1.jpg "
												alt=" " style="width: 97%; height: 100%;">
                                </div>
                                <div class=" ">
                                    <img
												src="${pageContext.request.contextPath}/resources/images/tour-detail-img/pack-slide-4.jpg "
												alt=" " style="width: 97%; height: 100%;">
                                </div>
                            </div>
                            <div class="mt-2 mb-2">
                                <img
											src="${pageContext.request.contextPath}/resources/images/tour-detail-img/pk-sm-1.jpg "
											alt=" " style="width: 98.5%; height: 100%;">
                            </div>
                        </div>
                        <div class="">
                            <img
										src="${pageContext.request.contextPath}/resources/images/tour-detail-img/pk-sm-2.jpg "
										alt=" " style="width: 230px; height: 92%; min-width: 98.5%;">
                        </div>
                    </div>
                </section>

                <section class="tour-program section--border-bot pb-4 "
							id="program ">
                    <h2 class="tour-map__title mb-3 ">Day by Day</h2>
                    <div>
                        <p class="mb-4 ">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ut venenatis lorem. Nunc sodales interdum rhoncus. Nulla a leo finibus, ullamcorper lorem vel, scelerisque massa. Vivamus leo dui, interdum non fermentum eget,
                            laoreet ac lorem. Aliquam a ultricies nisl. Nulla consequat lobortis urna sed cursus. ipsum dolor sit amet, consectetur adipiscing elit consectef lorem vel, scelerisque massa. Vivamus leo dui, interdum non.</p>
                        <ul>
                            <li class="d-flex"><i
										class="fas fa-plus-square mr-3 color--primary "></i>
                                <p>
											<strong>DAY 1</strong> - Departure at the airport and arrival at the hotel</p>
                            </li>
                            <li class="d-flex"><i
										class="fas fa-plus-square mr-3 color--primary "></i>
                                <p>
											<strong>DAY 2</strong> - Visit the main museums and lunch included</p>
                            </li>
                            <li class="d-flex"><i
										class="fas fa-plus-square mr-3 color--primary "></i>
                                <p>
											<strong>DAY 3</strong> - Excursion in the natural oasis and picnic</p>
                            </li>
                            <li class="d-flex"><i
										class="fas fa-plus-square mr-3 color--primary "></i>
                                <p>
											<strong>DAY 4</strong> - Transfer to the airport and return to the agency</p>
                            </li>
                            <li class="d-flex"><i
										class="fas fa-plus-square mr-3 color--primary "></i>
                                <p>
											<strong>DAY 5</strong> - Lorem ipsum dolor sit amet, consectetur adipiscing</p>
                            </li>
                        </ul>
                    </div>
                </section>

            </div>
            <div class="detail__right col-4">
                <section class="form-send-now">
                    <div class="header-form">
                        <p>
									<span>1000</span> 500 $</p>
                    </div>
                    <form:form id="form-send-now" action="sendContact"
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
                    <h5>Best Pasckages</h5>
                    <div class="">
                        <div class="package d-flex">
                            <p class="package__img">
										<img
											src="${pageContext.request.contextPath}/resources/images/tour-detail-img/berlin.jpg"
											alt="">
									</p>
                            <div
										class="d-flex flex-column justify-content-between">
                                <div>
                                    <h5>Berlin</h5>
                                    <p>
												<i class="fas fa-map-marker-alt mr-2"></i> Europe</p>
                                </div>
                                <a class="adetail" href="#"><button>FORM 700$</button></a>
                            </div>
                        </div>
                        <div class="package d-flex">
                            <p class="package__img">
										<img
											src="${pageContext.request.contextPath}/resources/images/tour-detail-img/HongKong.jpg"
											alt="">
									</p>
                            <div
										class="d-flex flex-column justify-content-between">
                                <div>
                                    <h5>Hong Kong</h5>
                                    <p>
												<i class="fas fa-map-marker-alt mr-2"></i>Asia </p>
                                </div>
                                <a class="adetail" href="#"><button>FORM 700$</button></a>
                            </div>
                        </div>
                        <div class="package d-flex">
                            <p class="package__img">
										<img
											src="${pageContext.request.contextPath}/resources/images/tour-detail-img/SanFancisco.jpg"
											alt="">
									</p>
                            <div
										class="d-flex flex-column justify-content-between">
                                <div>
                                    <h5>San Fancisco</h5>
                                    <p>
												<i class="fas fa-map-marker-alt mr-2"></i>United States </p>
                                </div>
                                <a class="adetail" href="#"><button>FORM 700$</button></a>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="search mb-5">
                    <h5>Search</h5>
                    <form:form action="search" modelAttribute="textSearch">
                        <div class="form-group col-md-12 pl-0">
                            <form:input path="text" type="text" class="form-control"
										id="name" placeholder="Search..." />
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
                        <a class="" href="#">Berlin</a>
                        <a class="" href="#">Amsterdam</a>
                        <a class="" href="#">Tuscany</a>
                        <a class="" href="#map">Adventure</a>
                        <a class="" href=""><button class="mt-3">view destination</button></a>
                    </div>
                    <div class="view-destination-before">
                        <h5>Europe</h5>
                        <p>3 packages</p>
                    </div>
                </section>
                <section class="tags">
                    <h5>Tags</h5>
                    <div class="tags-list">
                        <a class="adetail" href="#">Adventure</a>
                        <a class="adetail" href="#">Family</a>
                        <a class="adetail" href="#">Adventure</a>
                        <a class="adetail" href="#">Adventure</a>
                        <a class="adetail" href="#">Holiday</a>
                        <a class="adetail" href="#">Adventure</a>
                        <a class="adetail" href="#">Adventure</a>
                        <a class="adetail" href="#">Tours</a>
                        <a class="adetail" href="#">Travel</a>
                        <a class="adetail" href="#">Adventure</a>
                        <a class="adetail" href="#">Adventure</a>
                    </div>
                </section>
                
                 <!-- feedback  -->
                <section class="feedback">
                    <h5>Feedback</h5>
                    <div class="feedback-content">
                        <div class="feedback-info">
                            <p>
										<img
											src="${pageContext.request.contextPath}/resources/images/tour-detail-img/testimonial-1.jpg"
											alt="">
									</p>
                            <div>
                                <h5 class="username">Duc Tho</h5>
                                <p>I love discover the world</p>
                            </div>
                        </div>
                        <div class="content">a bis rowm ruws did ras ta nas chacws bangw lowps acj xanh dady acj xa qua didjch</div>
                    </div>

                    <div class="feedback-content">
                        <div class="feedback-info">
                            <p>
										<img
											src="${pageContext.request.contextPath}/resources/images/tour-detail-img/testimonial-1.jpg"
											alt="">
									</p>
                            <div>
                                <h5 class="username">Duc Tho</h5>
                                <p>I love discover the world</p>
                            </div>
                        </div>
                        <div class="content">a bis rowm ruws did ras ta nas chacws bangw lowps acj xanh dady acj xa qua didjch</div>
                    </div>

                    <div class="feedback-content">
                        <div class="feedback-info">
                            <p>
										<img
											src="${pageContext.request.contextPath}/resources/images/tour-detail-img/testimonial-1.jpg"
											alt="">
									</p>
                            <div>
                                <h5 class="username">Duc Tho</h5>
                                <p>I love discover the world</p>
                            </div>
                        </div>
                        <div class="content">a bis rowm ruws did ras ta nas chacws bangw lowps acj xanh dady acj xa qua didjch</div>
                    </div>
                    <div class="d-flex align-items-center flex-column">
                        <a class="adetail" href=""><button
										class="see-more-feedback">...</button></a>
                        <p>or</p>
                        <a class="adetail" href=""><button
										class="direct-to-feedback">leave feedback </button></a>
                    </div>

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
                <div class="related-tour__card col-xl-4 mt-3 mb-3">
                    <img
								src="${pageContext.request.contextPath}/resources/images/tour-detail-img/package-1-1024x640.jpg"
								alt="" style="width: 100%; height: auto;">
                    <div class="border p-4 ">
                        <div class="mb-2">
                            <h5>
										<a class="adetail" href="#">
                                Berlin
                            </a>
									</h5>
                            <p>
										<a class="adetail" href="">
                                <i class="fas fa-map-marker-alt"></i>Europe
                            </a>
									</p>
                        </div>
                        <div
									class="d-flex justify-content-between align-items-center border-top border-bottom pt-2 pb-2 mb-3">
                            <div class="card__category">
                                <p>CULTURAL</p>
                                <p>RELAX <span
												style="background-color: var(- -color_primary); border-radius: 15px; padding: 2px 10px; color: white;">+ 2</span>
										</p>
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
                    <img
								src="${pageContext.request.contextPath}/resources/images/tour-detail-img/package-1-1024x640.jpg"
								alt="" style="width: 100%; height: auto;">
                    <div class="border p-4 ">
                        <div class="mb-2">
                            <h5>
										<a class="adetail" href="#">
                                Berlin
                            </a>
									</h5>
                            <p>
										<a class="adetail" href="">
                                <i class="fas fa-map-marker-alt"></i> Europe
                            </a>
									</p>
                        </div>
                        <div
									class="d-flex justify-content-between align-items-center border-top border-bottom pt-2 pb-2 mb-3">
                            <div class="card__category">
                                <p>HISTORY</p>
                                <p>RELAX <span
												style="background-color: var(- -color_primary); border-radius: 15px; padding: 2px 10px; color: white;">+ 2</span>
										</p>
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
                    <img
								src="${pageContext.request.contextPath}/resources/images/tour-detail-img/package-1-1024x640.jpg"
								alt="" style="width: 100%; height: auto;">
                    <div class="border p-4 ">
                        <div class="mb-2">
                            <h5>
										<a class="adetail" href="#">
                                Berlin
                            </a>
									</h5>
                            <p>
										<a class="adetail" href="">
                                <i class="fas fa-map-marker-alt"></i> Europe
                            </a>
									</p>
                        </div>
                        <div
									class="d-flex justify-content-between align-items-center border-top border-bottom pt-2 pb-2 mb-3">
                            <div class="card__category">
                                <p>SPORT</p>
                                <p>RELAX <span
												style="background-color: var(- -color_primary); border-radius: 15px; padding: 2px 10px; color: white;">+ 2</span>
										</p>
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

        </div>
    </div>
  		</div>

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
  		
    </jsp:body>
</t:genericpage>