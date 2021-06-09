<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<t:genericpage pageTitle="Tour List">
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
        <div class="search-container" style = "margin-top: 50px; margin-left: 100px;">
            <form:form action="tour-list" modelAttribute="contentSearchPackage">
                <div class="row search-row search-dest">
                    <div class="col-sm-5 search-label">Choose Your Destination:</div>
                    <div class="col-sm-7 search-input">
                        <form:input path = "destination" class="form-select" name="destination" id="" style="background-image: url('${pageContext.request.contextPath}/resources/images/tour-list/icons/pin.svg')"/>
                    </div>
                </div>
                <div class="row search-row search-price">
                    <div class="col-sm-5 search-label">Max Price:</div>
                    <div class="col-sm-7 search-input">
                        <form:input path="maxPrice" name = "maxPrice" type="range" class="form-range" id = "maxPrice" 
                        min = "0" max = "1000" value = "0" list = "marks" />
                        <datalist id = "marks">
                        	<option value = "100"></option>
                        	<option value = "200"></option>
                        	<option value = "300"></option>
                        	<option value = "400"></option>
                        	<option value = "500"></option>
                        	<option value = "600"></option>
                        	<option value = "700"></option>
                        	<option value = "800"></option>
                        	<option value = "900"></option>
                        	<option value = "1000"></option>
                        </datalist>
                        <p style = "text-align:center; font-size: 30px; color: blue;">
                        	<span class = "maxPrice">0</span>
                        	<span> $</span>
                        </p>
                        <script type = "text/javascript">
                        	var priceSeletion = document.querySelector("#maxPrice");
                        	priceSeletion.oninput = function(){
                        		document.querySelector(".maxPrice").innerText = priceSeletion.value;
                        	}
                        </script>
                    </div>
                </div>
               	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
  					<input class="btn btn-primary" type="submit" value = "Search"/>
				</div>
            </form:form>
        </div>
    </section>
    <!--Package Section-->
    <section class="combo">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
        	<c:forEach items = "${searchResult}" var = "searchRes">
        	<c:choose>
	        	<c:when test="${!empty searchResult}">
	        		<c:forEach items = "${imgList}" var = "imgList">
						<c:if test = "${imgList.tourID.tourID == searchRes.tourID}">
				            <div class="col-md-4">
				                <div class="card shadow-sm">
				                    <img src="${imgList.imageURL}" alt="${searchRes.tourName} Thumbnail Image" style="width:100%; height: 200px;" />
				                    <div class="card-body">
				                        <p class="combo-name d-flex justify-content-between align-items-center" style = "font-weight: bold; color: black; font-size: 25px; padding: 5px 0px">
				                        	<span>${searchRes.tourName}</span>
				                        	<span style = "color: red; font-size: 15px; font-weight:100;">- ${searchRes.discount} % </span>
				                        </p>
				                        <div class="combo-category">
				                            <div class="row">
				                                <div class="col-md-8" style = "line-height: 50px">${searchRes.typology.typologyName}</div>
				                                <div class="col-md-4" style = "line-height: 50px; color: red; font-size: 25px; font-weight:bold">${searchRes.price} $      
				                                </div>
				                            </div>
				                        </div>
				                        <div class="combo-content d-flex justify-content-between align-items-center">
				                            <p style="font-size: 17px; color: rgba(0,0,0,0.5); height: 150px">${searchRes.shortDesc}</p>
				                        </div>
				                        <div class="btn-group">
				                             <a class="adetail" href="${pageContext.request.contextPath}/tour-detail/${searchRes.tourID}">
								                            <button class="btn btn-danger" style = "font-weight: bold">View</button>
								              </a>
				                        </div>
				                        <button data-type="addWishlist" data-link="${pageContext.request.contextPath}/user/wishlist/api?action=add&id=${tour.tourID}" class="float-right text-danger addWishlist" style = "padding: 0; margin = 0; border:none; background-color:white"><i class="far fa-heart fs-1"></i></button>
				                    </div>
				                </div>
				            </div>
						</c:if>
					</c:forEach>
	        	</c:when>
	        	<c:otherwise>
	        		<div>
	        			<h1>Not Found</h1>
	        		</div>
	        	</c:otherwise>
        	</c:choose>
            </c:forEach>
            
        </div>
    </section>
    </jsp:body>
</t:genericpage>