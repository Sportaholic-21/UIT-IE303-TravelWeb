<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<t:guest-user-page>
	<jsp:body>
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
			              <a href="${account.socialMediaLink}" class="btn btn-warning btn-round mr-5">Contact via Social</a>
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
			              <i class="material-icons">content_copy</i>
			            </div>
			            <p class="card-category">Total Tours</p>
			            <h3 class="card-title">3</h3>
			          </div>
			          <div class="card-footer">
			            <div class="stats">
			              <i class="material-icons text-danger">warning</i>
			              <a href="javascript:;">Get More Space...</a>
			            </div>
			          </div>
			        </div>
			      </div>
			    </div>
			
			    <div class="row">
			      <div class="col-12">
			        <div class="card card-stats">
			          <div class="card-header card-header-success card-header-icon">
			            <div class="card-icon">
			              <i class="material-icons">store</i>
			            </div>
			            <p class="card-category">Nations</p>
			            <h3 class="card-title">2</h3>
			          </div>
			          <div class="card-footer">
			            <div class="stats">
			              <i class="material-icons">date_range</i> Last 24 Hours
			            </div>
			          </div>
			        </div>
			      </div>
			    </div>
			    <div class="row">
			      <div class="col-12">
			        <div class="card card-stats">
			          <div class="card-header card-header-warning card-header-icon">
			            <div class="card-icon">
			              <i class="fa fa-comments"></i>
			            </div>
			            <p class="card-category">Feedbacks</p>
			            <h3 class="card-title">2</h3>
			          </div>
			          <div class="card-footer">
			            <div class="stats">
			              <i class="material-icons">update</i> Just Updated
			            </div>
			          </div>
			        </div>
			      </div>
			    </div>
			    <div class="row">
			      <div class="col-12">
			        <div class="card card-stats">
			          <div class="card-header card-header-danger card-header-icon">
			            <div class="card-icon">
			              <i class="material-icons">info_outline</i>
			            </div>
			            <p class="card-category">Points</p>
			            <h3 class="card-title">+1000</h3>
			          </div>
			          <div class="card-footer">
			            <div class="stats">
			              <i class="material-icons">local_offer</i> Tracked from Github
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
			<script
			src="${pageContext.request.contextPath}/resources/user/js/addMap.js"></script>
    </jsp:body>
</t:guest-user-page>