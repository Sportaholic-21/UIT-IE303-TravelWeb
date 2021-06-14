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
	
	<c:forEach items = "${sideTourList}" var = "list">
	<div class="d-flex position-relative mt-3 ms-4 me-4 justify-content-center">
		<div class="sidebar__thumbnail mt-2">
			<img
				src="${pageContext.request.contextPath}/resources/images/sidebar-thumbnail.jpg"
				class="img-fluid" alt="Package thumbnail">
		</div>
		<a class="d-block ms-4 text-decoration-none" href="#">
			<p class="fs-4 m-0">${list.tourName}</p>
			<p class="fs-6 fw-light"><span class="sidebar__location-icon d-inline-block me-1"><img
				src="${pageContext.request.contextPath}/resources/images/sidebar-location-icon.png"
				class="img-fluid" alt="Location icon"></span><span>${list.continent.continentName}</span></p>
			<p class="lh-lg mt-3 bg-warning rounded-pill ps-4 pe-4 text-white sidebar__package-price">FROM
				${list.price} $</p>
		</a>
	</div>
	</c:forEach>
	
	<%-- <div
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
	</div> --%>
</div>

