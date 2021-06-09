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
	<c:if test="${username==null}">
    <div class="popover12" style=" background-color: rgba(0,0, 0, 0.4); width: 100vw; height: 100vh; margin: 0; padding: 0; position: fixed; z-index: 9999;">
        <div style="border-radius: 15px; margin: 20px auto; padding: 40px; width: max-content; background-color:rgba(6, 67, 75, 0.9); align-items: center; display: flex; flex-direction: column; box-shadow: 5px 5px 5px rgba(0,0, 0, 0.4);">
            <h3 style="font-weight: 600; color: white;">You haven't still logged in yet.</h3>
            <p style="color: white;">Please, Log in now!</p>
            <div > 
            <button style="background-color: rgb(23,162,184); border-radius: 5px; outline: none; border: none; color: white; padding: 5px 10px; height: 35px; width: 68px;"><a href="${pageContext.request.contextPath}/sign-in" target="_blank" style="text-decoration: none">Log in</a></button>
        	<button class="button-close ml-3" style="background-color: rgb(212, 65, 28); border-radius: 5px; outline: none; border: none; color: white; padding: 5px 10px;height: 35px;width: 68px;">Close</button>
           </div>
        </div>
    </div>
    
    <script>
        var button_close = document.querySelector(".button-close");
        button_close.onclick = function() {
            document.querySelector(".popover12").style.display = "none";
        }
    </script>
	</c:if>
	
  <div class="feedback" 
			style="padding-top:150px; background: linear-gradient( rgba(0, 0, 0, 0.3) 100%, rgba(0, 0, 0, 0.3)100%),url('${pageContext.request.contextPath}/resources/images/feedback-background.jpg');">
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
							<span>Tour Name :</span>
							<span>${tour.tourName }</span>
						</li>
						<li class="list-group-item d-flex justify-content-between">
							<span>Country :</span>
							<span>${tour.nation.nationName }</span>
						</li>
						<li class="list-group-item d-flex justify-content-between">
							<span>Book Date :</span>
							<c:if test="${tourBooking.tourBookingID!=0}">
							<span>${tourBooking.bookDate}</span>
							</c:if>
						</li>
						<li class="list-group-item d-flex justify-content-between">
							<span>Schedule Date :</span>
							<span>${tourBooking.scheduleDate}</span>
						</li>
						
					</ul>
				</div>
				<div class="col-6">
					<form:form action="sendFeedback" class="needs-validation"
							modelAttribute="messageFeedback">
							<div class="mb-3">
							<label for="tour" class="form-label">TourBooking</label>
							<form:input path="tourBookingID" type="text"
									class="form-control rounded-pill p-2" id="tour"
									 value="${param.tourBookingID}" readonly="true"/>
						</div>
						<div class="mb-3">
							<label for="name" class="form-label">Name</label>
							<form:input path="name" type="text"
									class="form-control rounded-pill p-2" id="name"
									 value="${param.name}" readonly="true"/>
						</div>
						<div class="mb-3">
							<label for="email" class="form-label">Email</label>
							<form:input path="email" type="email"
									class="form-control rounded-pill p-2" id="email"
									aria-describedby="emailHelp" value="${param.email}" readonly="true"/>
						</div>
						<div class="mb-3">
							<label for="message" class="form-label">Message</label>
							<form:textarea path="message" class="form-control rounded p-2"
									id="message" rows="5"></form:textarea>
							<div class="invalid-feedback">
								Please provide a valid city.
							</div>
						</div>
						<div class="mb-3 d-flex flex-column">
							<div class="d-flex align-items-center">
								<label for="start" class="form-label" style="width: 20%;">Point</label>
								<div style="width: 80%; margin: 0 auto;">
									<p class="start"
											style="display: inline-block; font-size: 30px; color: #17A2B8;">	5</p>
									<i
											style="display: inline-block; font-size: 30px; color: #17A2B8"
											class="fas fa-star"></i>
								</div>
								
							</div>
							<form:input path="start" class="mt-2" type="range" min="0"
									max="5" id="start" value="5" list="tickmarks" />
							
									<datalist id="tickmarks">
  										<option value="0" label="0"></option>
  										<option value="10" label="10"></option>
  										<option value="20"></option>
  										<option value="30"></option>
  										<option value="40"></option>
 										 <option value="50"></option>
									</datalist>
									
								<script type="text/javascript">
									var pStart = document
											.querySelector("#start");
									pStart.oninput = function() {
										document.querySelector(".start").innerText = pStart.value;
									}
								</script>
						</div>
						<c:if test="${username==null}">
						<button type="submit"
								class="btn btn-info text-white rounded-pill ps-4 pe-4" disabled="disabled">SEND NOW</button>
								</c:if>
						<c:if test="${username!=null}">
						<button type="submit"
								class="btn btn-info text-white rounded-pill ps-4 pe-4">SEND NOW</button>
								</c:if>
								
					</form:form>
				</div>
			</div>
		</div>
	</div>
	
    </jsp:body>
</t:genericpage>