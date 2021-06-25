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
        <div class="search-container" style = "margin-top: 50px; margin-left: 30px;">
            <form:form action="tour-list" modelAttribute="contentSearchPackage" method = "GET">
            	<p style = "font-size: 20px; color: black">
            		<i class="fas fa-plus-square mr-3 color--primary "></i>
	            	<span>
	            		<strong>Search</strong>
	            	</span>
	            </p>
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
                        min = "0" max = "1000" value="${param.maxPrice}" list = "marks" />
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
                        	<span class = "maxPrice">${param.maxPrice }</span>
                        	<span> $</span>
                        </p>
                        <script type = "text/javascript">
                        	var priceSeletion = document.querySelector("#maxPrice");
                        	console.log(priceSeletion.value)
                        	if (priceSeletion.value==null ||priceSeletion.value==0){
                        			document.querySelector(".maxPrice").innerText="0";
                        		}
                        	priceSeletion.oninput = function(){
                        		
                        		document.querySelector(".maxPrice").innerText = priceSeletion.value;
                        	}
                        </script>
                    </div>
                </div>
                <p style = "font-size: 20px; color: black">
            		<i class="fas fa-plus-square mr-3 color--primary "></i>
	            	<span>
	            		<strong>Filter</strong>
	            	</span>
	            </p>
	        	<div>
	            	<div class = "row">
						<div class = "col-sm">
							<div class = "row search-row">
				            	<div class="col-sm-6 search-label">Choose a continent:</div>
				            	<div class = "col-sm-6 search-input">
					            	<form:select path = "continent" class="form-select" name="continent" id="continent">
					            		<form:option  value="">--Select one--</form:option>
					            		<c:forEach items = "${continentList}" var = "conList">
					            			<form:option value = "${conList.continentName}" label = "${conList.continentName}"/>
					            		</c:forEach>
					            	</form:select>
					            </div>
				            </div>
				        </div>
				        <div class = "col-sm">
				        	<div class = "row search-row">
				            	<div class="col-sm-6 search-label">Choose a nation:</div>
				            	<div class = "col-sm-6 search-input">
					            	<form:select path = "nation" class="form-select" name="nation" id="nation">
					            		<form:option  value="">--Select one--</form:option>
					            		<c:forEach items = "${nationList}" var = "naList">
					            			<form:option value = "${naList.nationName}" label = "${naList.nationName}"/>
					            		</c:forEach>
					            	</form:select>
					            </div>
				            </div>	
				        </div>
				        <div class = "col-sm">
				        	<div class = "row search-row">
				            	<div class="col-sm-6 search-label">Choose a typology:</div>
					            <div class = "col-sm-6 search-input">
					            	<form:select path = "typology" class="form-select" name="typology" id="typology">
					            		<form:option  value="">--Select one--</form:option>
					            		<c:forEach items = "${typologyList}" var = "tyList">
					            			<form:option value = "${tyList.typologyName}" label = "${tyList.typologyName}"/>
					            		</c:forEach>
					            	</form:select>
					            </div>
				            </div>	
				        </div>
				    </div>
				</div>
               	<div class="d-grid gap-2 d-md-flex justify-content-md-end pt-2">
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
				                <div class="card related-tour__card shadow-sm">
													<div class="related-tour__card-img">
				                    <img src="${imgList.imageURL}" alt="${searchRes.tourName} Thumbnail Image" style="width:100%; height: 200px;" />
													</div>
				                    <div class="card-body">
				                        <p class="combo-name d-flex justify-content-between align-items-center" style = "font-weight: bold; color: black; font-size: 25px; padding: 5px 0px">
				                        	<span>${searchRes.tourName}</span>
				                        	<c:if test = "${searchRes.discount != 0.0}">
			                        			<span style = "color: red; font-size: 15px; font-weight:100;">- ${searchRes.discount} % </span>
			                        		</c:if>
				                        </p>
				                        <div class="combo-category d-flex justify-content-between">
																	<div style = "line-height: 50px">${searchRes.typology.typologyName}</div>
																	<c:choose>
																		<c:when test = "${searchRes.discount == 0.0}">
					                            <p style="font-size: 30px; color: red; font-weight: bold;" class="pt-2">${searchRes.price}$</p>
																		</c:when>
																		<c:otherwise>
					                            <div class="d-flex justify-content-between align-items-center pt-2" style = "line-height: 50px">
																				<p style="font-size: 20px;" class="mr-3"><s>${searchRes.price}$</s></p>
																				<p style="font-size: 30px; color: red;" class="fw-bold">${searchRes.price - searchRes.price * searchRes.discount / 100}$</p>
																			</div>
																		</c:otherwise>
																	</c:choose>
				                        </div>
				                        <div class="combo-content d-flex justify-content-between align-items-center">
				                            <p style="font-size: 17px; color: rgba(0,0,0,0.5); height: 150px">${searchRes.shortDesc}</p>
				                        </div>
				                        <div class="btn-group">
				                             <a class="adetail" href="${pageContext.request.contextPath}/tour-detail/${searchRes.tourID}">
								                            <button class="btn btn-danger" style = "font-weight: bold">View</button>
								              </a>
				                        </div>
				                        <button data-type="addWishlist" data-link="${pageContext.request.contextPath}/user/wishlist/api?action=add&id=${tour.tourID}" class="float-right text-danger addWishlist" style = "padding: 0; margin : 0; border:none; background-color:white"><i class="far fa-heart fs-1"></i></button>
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