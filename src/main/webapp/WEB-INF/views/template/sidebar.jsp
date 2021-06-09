<div class="h-100 sidebar fixed-top bg-white pt-4" id="sidebar">
	<div class="position-absolute sidebar__close-btn" id="btn-close-sidebar">
		<img
			src="${pageContext.request.contextPath}/resources/images/sidebar-close-btn.png"
			class="img-fluid" alt="Package thumbnail">
	</div>

	<h1 class="text-center lh-1 mb-4">
		<p class="fw-light fs-6 m-0">BEST</p>
		<p class="fw-bold fs-4 sidebar__heading d-inline-block position-relative">PACKAGES</p>
	</h1>
	
	<div
		class="d-flex position-relative mt-3 ms-4 me-4 justify-content-center">
		<div class="sidebar__thumbnail mt-2">
			<img
				src="${pageContext.request.contextPath}/resources/images/sidebar-thumbnail.jpg"
				class="img-fluid" alt="Package thumbnail">
		</div>
		<a class="d-block ms-4 text-decoration-none" href="#">
			<p class="fs-4 m-0">Berlin</p>
			<p class="fs-6 fw-light"><span class="sidebar__location-icon d-inline-block me-1"><img
				src="${pageContext.request.contextPath}/resources/images/sidebar-location-icon.png"
				class="img-fluid" alt="Location icon"></span><span>Eroupe</span></p>
			<p class="lh-lg mt-3 bg-warning rounded-pill ps-4 pe-4 text-white sidebar__package-price">FROM
				700 $</p>
		</a>
	</div>
	
	<div
		class="d-flex position-relative mt-3 ms-4 me-4 justify-content-center">
		<div class="sidebar__thumbnail mt-2">
			<img
				src="${pageContext.request.contextPath}/resources/images/sidebar-thumbnail.jpg"
				class="img-fluid" alt="Package thumbnail">
		</div>
		<a class="d-block ms-4 text-decoration-none" href="#">
			<p class="fs-4 m-0">Berlin</p>
			<p class="fs-6 fw-light"><span class="sidebar__location-icon d-inline-block me-1"><img
				src="${pageContext.request.contextPath}/resources/images/sidebar-location-icon.png"
				class="img-fluid" alt="Location icon"></span><span>Eroupe</span></p>
			<p class="lh-lg mt-3 bg-warning rounded-pill ps-4 pe-4 text-white sidebar__package-price">FROM
				700 $</p>
		</a>
	</div>
	
	<div
		class="d-flex position-relative mt-3 ms-4 me-4 justify-content-center">
		<div class="sidebar__thumbnail mt-2">
			<img
				src="${pageContext.request.contextPath}/resources/images/sidebar-thumbnail.jpg"
				class="img-fluid" alt="Package thumbnail">
		</div>
		<a class="d-block ms-4 text-decoration-none" href="#">
			<p class="fs-4 m-0">Berlin</p>
			<p class="fs-6 fw-light"><span class="sidebar__location-icon d-inline-block me-1"><img
				src="${pageContext.request.contextPath}/resources/images/sidebar-location-icon.png"
				class="img-fluid" alt="Location icon"></span><span>Eroupe</span></p>
			<p class="lh-lg mt-3 bg-warning rounded-pill ps-4 pe-4 text-white sidebar__package-price">FROM
				700 $</p>
		</a>
	</div>
	
	<div
		class="d-flex position-relative mt-3 ms-4 me-4 justify-content-center">
		<div class="sidebar__thumbnail mt-2">
			<img
				src="${pageContext.request.contextPath}/resources/images/sidebar-thumbnail.jpg"
				class="img-fluid" alt="Package thumbnail">
		</div>
		<a class="d-block ms-4 text-decoration-none" href="#">
			<p class="fs-4 m-0">Berlin</p>
			<p class="fs-6 fw-light"><span class="sidebar__location-icon d-inline-block me-1"><img
				src="${pageContext.request.contextPath}/resources/images/sidebar-location-icon.png"
				class="img-fluid" alt="Location icon"></span><span>Eroupe</span></p>
			<p class="lh-lg mt-3 bg-warning rounded-pill ps-4 pe-4 text-white sidebar__package-price">FROM
				700 $</p>
		</a>
	</div>
	
	<div
		class="d-flex position-relative mt-3 ms-4 me-4 justify-content-center">
		<div class="sidebar__thumbnail mt-2">
			<img
				src="${pageContext.request.contextPath}/resources/images/sidebar-thumbnail.jpg"
				class="img-fluid" alt="Package thumbnail">
		</div>
		<a class="d-block ms-4 text-decoration-none" href="#">
			<p class="fs-4 m-0">Berlin</p>
			<p class="fs-6 fw-light"><span class="sidebar__location-icon d-inline-block me-1"><img
				src="${pageContext.request.contextPath}/resources/images/sidebar-location-icon.png"
				class="img-fluid" alt="Location icon"></span><span>Eroupe</span></p>
			<p class="lh-lg mt-3 bg-warning rounded-pill ps-4 pe-4 text-white sidebar__package-price">FROM
				700 $</p>
		</a>
	</div>

	<% if (request.getAttribute("username") != null){ %> 
		<div>
			<button type="button" class="btn btn-danger" id="signOut">
				<span class="glyphicon glyphicon-log-out"></span>Log Out
			</button>
		</div>
	<%}%>
</div>

<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script defer>
	var signOut = document.getElementById("signOut");
	var urlCurrent=window.location.href;
	signOut.addEventListener("click", () => {
		axios.post("/UIT-IE303-TravelWeb/signOut")
			 .then(function(res){window.location=urlCurrent})
			 .catch(function(err){console.log(err)})
	})
</script>