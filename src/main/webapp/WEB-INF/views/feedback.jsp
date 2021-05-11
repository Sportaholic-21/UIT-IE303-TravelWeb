<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<t:genericpage pageTitle="Feedback">
	<jsp:attribute name="pageCSSLink">
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/resources/css/pages/feedback.css">
	</jsp:attribute>
	<jsp:body>
  <div class="feedback"
			style="background: linear-gradient( rgba(0, 0, 0, 0.3) 100%, rgba(0, 0, 0, 0.3)100%),url('${pageContext.request.contextPath}/resources/images/feedback-background.jpg');">
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
					<form:form action="sendFeedback" class="needs-validation"
							modelAttribute="messageFeedback">
						<div class="mb-3">
							<label for="name" class="form-label">Name</label>
							<form:input path="name" type="text"
									class="form-control rounded-pill p-2" id="name"
									aria-describedby="emailHelp" />
						</div>
						<div class="mb-3">
							<label for="email" class="form-label">Email</label>
							<form:input path="email" type="email"
									class="form-control rounded-pill p-2" id="email"
									aria-describedby="emailHelp" />
						</div>
						<div class="mb-3">
							<label for="message" class="form-label">Message</label>
							<form:textarea path="message" class="form-control rounded p-2"
									id="message" aria-describedby="emailHelp" rows="5"></form:textarea>
							<div class="invalid-feedback">
								Please provide a valid city.
							</div>
						</div>
						<button type="submit"
								class="btn btn-info text-white rounded-pill ps-4 pe-4">SEND NOW</button>
					</form:form>
					<%-- <p>${name1}<br>${email1}<br>${message1}</p> --%>
				</div>
			</div>
		</div>
	</div>
    </jsp:body>
</t:genericpage>