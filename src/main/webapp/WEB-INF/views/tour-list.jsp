<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:genericpage pageTitle="Feedback">
	<jsp:attribute name="pageCSSLink">
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/resources/css/pages/tour-list.css">
	</jsp:attribute>
	<jsp:body>
    <!--Landing Section-->
    <section class="landing" height="650"
             style="background: url('${pageContext.request.contextPath}/resources/images/tour-list/product-page.jpg') no-repeat center;
                    background-size: cover;
                    padding-bottom: 100px;
                    margin-bottom: 100px;"
    >
        <h3 class="landing-h3">Our offers</h3>
        <h1 class="landing-h1">FIND YOUR HOLIDAY</h1>
        <div class="search-container">
            <form action="actionpage.php" method="post">
                <div class="row search-row search-dest">
                    <div class="col-sm-5 search-label">Choose Your Destination:</div>
                    <div class="col-sm-7 search-input">
                        <select class="form-select" name="" id="" style="background-image: url('${pageContext.request.contextPath}/resources/images/tour-list/icons/pin.svg')">
                            <option selected>All Destinations</option>
                        </select>
                    </div>
                </div>
                <div class="row search-row search-date">
                    <div class="col-sm-5 search-label">Choose Your Date:</div>
                    <div class="col-sm-7 search-input">
                        <select class="form-select" name="" id="" style="background-image: url('${pageContext.request.contextPath}/resources/images/tour-list/icons/calendar.png')">
                            <option value="">DD-MM-YYYY</option>
                        </select>
                    </div>
                </div>
                <div class="row search-row search-price">
                    <div class="col-sm-5 search-label">Max Price:</div>
                    <div class="col-sm-7 search-input">
                        <input type="range" class="form-range" name="" id="">
                    </div>
                </div>
            </form>
        </div>
    </section>
    <!--Package Section-->
    <section class="combo">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <img class="combo-image" src="${pageContext.request.contextPath}/resources/images/tour-list/melbourne.jpg" />
                    <div class="card-body">
                        <p class="combo-name">Melbourne</p>
                        <div class="combo-category">
                            <div class="row">
                                <div class="col-md-8">Category</div>
                                <div class="col-md-4">700$</div>
                            </div>
                        </div>
                        <div class="combo-content d-flex justify-content-between align-items-center">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                                ut labore et
                                dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
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
                    <img class="combo-image" src="${pageContext.request.contextPath}/resources/images/tour-list/melbourne.jpg" />
                    <div class="card-body">
                        <p class="combo-name">Melbourne</p>
                        <div class="combo-category">
                            <div class="row">
                                <div class="col-md-8">Category</div>
                                <div class="col-md-4">700$</div>
                            </div>
                        </div>
                        <div class="combo-content d-flex justify-content-between align-items-center">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                                ut labore et
                                dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
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
                    <img class="combo-image" src="${pageContext.request.contextPath}/resources/images/tour-list/melbourne.jpg" />
                    <div class="card-body">
                        <p class="combo-name">Melbourne</p>
                        <div class="combo-category">
                            <div class="row">
                                <div class="col-md-8">Category</div>
                                <div class="col-md-4">700$</div>
                            </div>
                        </div>
                        <div class="combo-content d-flex justify-content-between align-items-center">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                                ut labore et
                                dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
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