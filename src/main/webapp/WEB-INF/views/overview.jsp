<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<t:genericpage pageTitle="Profile">
	<jsp:attribute name="pageCSSLink">
	<!-- CSS Files -->
	
	<link
	href="${pageContext.request.contextPath}/resources/user/css/style.css"
	rel="stylesheet" />

<link href="https://api.mapbox.com/mapbox-gl-js/v2.3.0/mapbox-gl.css"
	rel="stylesheet">
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
		<div class=></div>
		<div class="container">
			<div class="row mt-5">
			  <div class="col-md-9">
			    <div class="row">
			      <div class="col-md-12">
			        <div class="card card-profile ">
			          <div class="row ">
			            <div class="card-avatar col-3">
			              <a href="javascript:;">
			                <img class="img" src="${account.avatar}" />
			              </a>
			            </div>
			            <div class="card-body col-9 d-flex">
			              <h4 class="card-title text-left mr-auto mt-2">${account.username}</h4>
			              <c:choose>
			              	<c:when test="${account.socialMediaLink ne ''}">
			              		<a href="${account.socialMediaLink}"
													class="btn btn-warning btn-round mr-5">Contact via Social</a>
			              	</c:when>
			              </c:choose>
			            </div>
			          </div>
			        </div>
			      </div>
			    </div>
			    <div class="card mb-0">
			      <div class="card-header card-header-primary">
			        <h4 class="card-title">Journey Diary</h4>
			        <p class="card-category">-- The World Is Yours To Explore --</p>
			      </div>
			      <div class="card-body map-container pt-4">
			        <div id='map'></div>
			      </div>
			    </div>
			  </div>
			  <div class="col-md-3">
			    <div class="row">
			      <div class="col-12">
			        <div class="card card-stats">
			          <div class="card-header card-header-info card-header-icon">
			            <div class="card-icon">
			              <i class="fas fa-plane"></i>
			            </div>
			            <p class="card-category">Total Tours</p>
			            <h3 class="card-title">${endedTours.size()}</h3>
			          </div>
			          <div class="card-footer">
			            <div class="stats">
			              <a>Time To See The World.</a>
			            </div>
			          </div>
			        </div>
			      </div>
			    </div>
			
			    <div class="row">
			      <div class="col-12">
			        <div class="card card-stats">
			          <div
									class="card-header card-header-success card-header-icon">
			            <div class="card-icon">
			              <i class="fas fa-thumbtack"></i>
			            </div>
			            <p class="card-category">Total Nations</p>
			            <h3 class="card-title">${totalNations}</h3>
			          </div>
			          <div class="card-footer">
			            <div class="stats">
			               Awesome Is New Space.
			            </div>
			          </div>
			        </div>
			      </div>
			    </div>
			    <div class="row">
			      <div class="col-12">
			        <div class="card card-stats">
			          <div
									class="card-header card-header-warning card-header-icon">
			            <div class="card-icon">
			              <i class="fa fa-comments"></i>
			            </div>
			            <p class="card-category">Feedbacks</p>
			            <h3 class="card-title">${totalFeedbacks}</h3>
			          </div>
			          <div class="card-footer">
			            <div class="stats">
			              Caring Your Hobbies.
			            </div>
			          </div>
			        </div>
			      </div>
			    </div>
			    <div class="row">
			      <div class="col-12">
			        <div class="card card-stats">
			          <div
									class="card-header card-header-danger card-header-icon">
			            <div class="card-icon">
			              <i class="fas fa-funnel-dollar"></i>
			            </div>
			            <p class="card-category">Points</p>
			            <h3 class="card-title">${account.point}</h3>
			          </div>
			          <div class="card-footer">
			            <div class="stats">
			              Be A Better Visitor
			            </div>
			          </div>
			        </div>
			      </div>
			    </div>
			  </div>
			</div>
          </div>
          <script
				src="https://unpkg.com/es6-promise@4.2.4/dist/es6-promise.auto.min.js"></script>
			<script
			src="https://unpkg.com/@mapbox/mapbox-sdk/umd/mapbox-sdk.min.js"></script>
			
			<script>
			var coordinateList = ${coordinates};
			var tourNames = "${tourNames}";
			var dates = "${dates}";
			var stars = ${stars};
			var tourSize = ${endedTours.size()};
			tourNames = tourNames.replace(/\[|\]/g, ' ');
			dates = dates.replace(/\[|\]/g, ' ');

			var tourNameArr = tourNames.split(",");
			var tourDateArr = dates.split(",");

			var coordinateArr = [];
			var featureArr = [];

			for (var i = 0; i < tourSize; i++) {
				coordinateArr.push(coordinateList.splice(0, 2));
				var tempGeo = {
					type: 'Feature',
					geometry: {
						type: 'Point',
						coordinates: coordinateArr[i]
					},
					properties: {
						title: 'Mapbox',
						description: tourNameArr[i]
					},
					info: {
						date: tourDateArr[i],
						star: stars[i] ? stars[i] + ' / 5' : '',
						place: tourNameArr[i]
					}
				}
				featureArr.push(tempGeo);
			}

			mapboxgl.accessToken = 'pk.eyJ1IjoieWxhbnR0IiwiYSI6ImNrcGdpbGdnejA3Y2sydmprMzk4d2gwM20ifQ.Wz5IizkQcBZ6FCBLz3wnEA';

			var map = new mapboxgl.Map({
				container: 'map',
				style: 'mapbox://styles/mapbox/light-v10',
				center: [106, 10],
				zoom: 1
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
								.setHTML('<p class="text-danger mb-0">' + marker.info.date + '</p><p class="text-success font-weight-bold mb-0">' + marker.info.star + '</p><p class="mb-0">' + marker.info.place + '</p>')).addTo(map);
				});
			</script>
    </jsp:body>
</t:genericpage>
