<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:genericpage pageTitle="Feedback">
	<jsp:attribute name="pageCSSLink">
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/resources/css/pages/feedback.css">
	</jsp:attribute>
	<jsp:body>
  <div class="feedback" style="background: linear-gradient( rgba(0, 0, 0, 0.3) 100%, rgba(0, 0, 0, 0.3)100%),url('${pageContext.request.contextPath}/resources/images/feedback-background.jpg');">
		<div class="feedback__content ms-auto me-auto bg-white">
			<div class="row align-items-start justify-content-around">
				<div class="col-5">
					<a href="contact" class="feedback__cta text-white rounded-pill">
						CONTACT US
					</a>
	
					<h2>Leave your Feedback</h2>
	
					<p>Phasellus enim libero, blandit vel sapien vitae, condimentum ultricies magna et. Quisque euismod orci ut et lobortis.</p>

					<ul class="list-group list-group-flush mt-auto">
						<li class="list-group-item d-flex justify-content-between">
							<span>Address :</span>
							<span>Avenue 234</span>
						</li>
						<li class="list-group-item d-flex justify-content-between">
							<span>City :</span>
							<span>New York</span>
						</li>
						<li class="list-group-item d-flex justify-content-between">
							<span>Email :</span>
							<span>info@email.com</span>
						</li>
						<li class="list-group-item d-flex justify-content-between">
							<span>Check-In :</span>
							<span>15:00 am</span>
						</li>
						<li class="list-group-item d-flex justify-content-between">
							<span>Check-Out :</span>
							<span>15:00 am</span>
						</li>
					</ul>
				</div>
				<div class="col-6">
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
			</div>
		</div>
	</div>
    </jsp:body>
</t:genericpage>