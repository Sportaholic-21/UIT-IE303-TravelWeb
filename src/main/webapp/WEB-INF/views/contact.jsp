<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:genericpage pageTitle="Contact">
	<jsp:attribute name="pageCSSLink">
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/resources/css/pages/contact.css">
		<style>
			#map {
        		height: 300px;
        		width: 100%;
      	}
		</style>
		<script>
      		// Initialize and add the map
      		function initMap() {
        	// The location of Levart
        	const levart = { lat: 10.879519, lng: 106.803997 };
        	// The map, centered at Levart
        	const map = new google.maps.Map(document.getElementById("map"), {
          	zoom: 4,
          	center: levart,
        	});
        	// The marker, positioned at Levart
        	const marker = new google.maps.Marker({
          	position: levart,
          	map: map,
        });
      }
    </script>
	</jsp:attribute>
	<jsp:body>
  		<div class ="contact" style ="background: linear-gradient( rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.3)), url('${pageContext.request.contextPath}/resources/images/contact-background.jpg');">
  			<h2 class = "contact__header">Contact Us</h2>
  			<div class ="contact__body">
	  			<div class = "contact__content ms-auto me-auto text-dark">
	  				<div class="row align-items-start justify-content-between">
						<div class="col-5">
							<h2>Drop us a line</h2>
							<p>Do you have any problem while wandering our website ? Please contact for support.</p>
							<form action="#" class="needs-validation" novalidate>
							<div class="mb-3">
								<label for="name" class="form-label">Name</label>
								<input type="text" class="form-control rounded-pill p-2" id="name" aria-describedby="emailHelp" disabled>
							</div>
							<div class="mb-3">
								<label for="email" class="form-label">Email</label>
								<input type="email" class="form-control rounded-pill p-2" id="email" aria-describedby="emailHelp" disabled>
							</div>
							<div class="mb-3">
								<label for="message" class="form-label">Message</label>
								<textarea autofocus class="form-control rounded p-2" id="message" aria-describedby="emailHelp" rows="5" required></textarea>
								<div class="invalid-feedback">
									Please provide a valid city.
								</div>
							</div>
							<button type="submit" class="btn btn-info text-white rounded-pill ps-4 pe-4">SEND NOW</button>
						</form>
						</div>

						<div class="col-6 col-offset-2">
							<!-- Div dùng để chứa bản đồ -->
							<div id = "map" class = "mb-2">
								<!-- <script async src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCJtOZCoB3B1oh6zSiUfN7AyGipwBQFQtE&callback=initMap">
								</script> -->
								<iframe src="https://www.google.com/maps/embed?pb=!1m23!1m12!1m3!1d62691.70156518758!2d106.76878855714699!3d10.87000071018454!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m8!3e6!4m0!4m5!1s0x317527587e9ad5bf%3A0xafa66f9c8be3c91!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBDw7RuZyBuZ2jhu4cgVGjDtG5nIHRpbiDEkEhRRyBUUC5IQ00sIFNvbmcgSMOgbmgsIGtodSBwaOG7kSA2LCBMaW5oIFRydW5nLCBUaOG7pyDEkOG7qWMsIFRow6BuaCBwaOG7kSBI4buTIENow60gTWluaA!3m2!1d10.8699184!2d106.8038081!5e0!3m2!1svi!2s!4v1616317062630!5m2!1svi!2s" 
								width=100% height="300" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
							</div>
							<!-- Div dùng để chứa thông tin cơ bản -->
							<div class = "row">
								<div class = "col-sm-6">
									<ul class="list-group list-group-flush">
										<li class="list-group-item d-flex justify-content-between">
											<span>Address :</span>
											<span>123 Levart</span>
										</li>
										<li class="list-group-item d-flex justify-content-between">
											<span>City :</span>
											<span>HCM City - Viet Nam</span>
										</li>
										<li class="list-group-item d-flex justify-content-between">
											<span>Check-In :</span>
											<span>15:00 am</span>
										</li>
									</ul>
								</div>
								<div class = "col-sm-6">
									<ul class="list-group list-group-flush">
										<li class="list-group-item d-flex justify-content-between">
											<span>Email :</span>
											<span>levart@gmail.com</span>
										</li>
										<li class="list-group-item d-flex justify-content-between">
											<span>Phone :</span>
											<span>+84 123 456 789</span>
										</li>
										<li class="list-group-item d-flex justify-content-between">
											<span>Check-Out :</span>
											<span>15:00 pm</span>
										</li>
									</ul>
								</div>
							</div>
							<div>
								<h4 class ="contact__availabletime">AVAILABLE FROM: 8.30am to 9.00pm</h4>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
		<div class = "mb-4"></div>
    </jsp:body>
</t:genericpage>