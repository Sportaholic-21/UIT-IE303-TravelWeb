<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<t:userpage>
	<jsp:body>
	 <div class="row">
	 		<a href="${pageContext.request.contextPath}/contact"  class="btn btn-warning btn-round ml-auto mr-5 mb-3">Book New Tour</a>
            <div class="col-md-12">
              <div class="card">
                <div
						class="card-header card-header-tabs card-header-primary">
                  <div class="nav-tabs-navigation">
                    <div class="nav-tabs-wrapper">
                      <span class="nav-tabs-title">Booked Tours:</span>
                      <ul class="nav nav-tabs" data-tabs="tabs">
                        <li class="nav-item">
                          <a class="nav-link active" href="#profile"
										data-toggle="tab">
                            <i class="material-icons">date_range</i> Not Start Yet
                            <div class="ripple-container"></div>
                          </a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="#messages"
										data-toggle="tab">
                            <i class="material-icons">local_offer</i> Ended
                            <div class="ripple-container"></div>
                          </a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="#settings"
										data-toggle="tab">
                            <i class="material-icons">info_outline</i> Cancel
                            <div class="ripple-container"></div>
                          </a>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="card-body">
                  <div class="tab-content">
                    <div class="tab-pane active" id="profile">
                      <table class="table">
                      <thead>
                      	<tr>
                      		<th>Tour ID</th>
                      		<th>Tour Name</th>
                      		<th>Nation</th>
                      		<th>Book Date</th>
                      		<th>Start Date</th>
                      		<th>Duration</th>
                      		<th>Cancel</th>
                      	</tr>
                      </thead>
                        <tbody>
                        <c:forEach var="tourNotStart" items="${tourNotStarts}">
                          <tr>
                            <td>${tourNotStart.tourBookingID}</td>
                            <td>
                            	<a href="${pageContext.request.contextPath}/tour-detail/${tourNotStart.tour.tourID }"
                    				>${tourNotStart.tour.tourName }</a
                  			></td>
                            <td>${tourNotStart.tour.nation.nationName}</td>
                            <td>${tourNotStart.bookDate}</td>
                            <td>${tourNotStart.scheduleDate}</td>
                            <td>${tourNotStart.tour.duration}</td>
                            <td>
                              <button data-type="delete" data-toggle="modal" data-target="#deleteModel" data-id="${tourNotStart.tourBookingID}" data-link="${pageContext.request.contextPath}/user/${account.username}/booked-tour/api/cancel" type="button" rel="tooltip"
													title="Cancel" class="btn btn-danger btn-link btn-sm deleteBtn">
                                <i class="material-icons">close</i>
                              </button>
                            </td>
                          </tr>
                          </c:forEach>
                        </tbody>
                      </table>
                    </div>
                    <div class="tab-pane" id="messages">
                      <table class="table">
                      <thead>
                      	<tr>
                      		<th>Tour ID</th>
                      		<th>Tour Name</th>
                      		<th>Nation</th>
                      		<th>Book Date</th>
                      		<th>Start Date</th>
                      		<th>Duration</th>
                      		<th>Feeling</th>
                      	</tr>
                      </thead>
                        <tbody>
                        <c:forEach var="tourEnd" items="${tourEnds}">
    	                      <tr>
	                          	<td>${tourEnd.tourBookingID}</td>
								<td>
                    	        	<a href="${pageContext.request.contextPath}/tour-detail/${tourEnd.tour.tourID }"
                    					>${tourEnd.tour.tourName }</a
                  				></td>
	                            <td>${tourEnd.tour.nation.nationName}</td>
	                            <td>${tourEnd.bookDate}</td>
	                            <td>${tourEnd.scheduleDate}</td>
	                            <td>${tourEnd.tour.duration}</td>
	                            <c:choose>
									  <c:when test="${tourEnd.feedback ne null}">
									    	<td>
									    		<p class="font-weight-bold text-success">${tourEnd.feedback.start}</p>
									    		<p>${tourEnd.feedback.feedbackMessage}</p>	
									    	</td>
									  </c:when>
									  <c:otherwise>
									    	<td><a href="${pageContext.request.contextPath}/feedback?id=${tourEnd.tour.tourID }"  class="font-weight-bold">Give feedback</a></td>
									  </c:otherwise>
								</c:choose>
 	                          </tr>
                          </c:forEach>
                        </tbody>
                      </table>
                    </div>
                    <div class="tab-pane" id="settings">
                    <table class="table">
                      <thead>
                      	<tr>
                      		<th>Tour ID</th>
                      		<th>Tour Name</th>
                      		<th>Nation</th>
                      		<th>Book Date</th>
                      		<th>Start Date</th>
                      		<th>Duration</th>
                      		<th>Recover</th>
                      	</tr>
                      </thead>
                        <tbody>
                        <c:forEach var="tourCancel" items="${tourCancels}">
                          <tr>
                          		<td>${tourCancel.tourBookingID}</td>
								<td>
                    	        	<a href="${pageContext.request.contextPath}/tour-detail/${tourCancel.tour.tourID }"
                    					>${tourCancel.tour.tourName }</a
                  				></td>
	                            <td>${tourCancel.tour.nation.nationName}</td>
	                            <td>${tourCancel.bookDate}</td>
	                            <td>${tourCancel.scheduleDate}</td>
	                            <td>${tourCancel.tour.duration}</td>
	                            <td>
		                            <button data-toggle="modal" data-type="recover" data-target="#deleteModel" data-id="${tourCancel.tourBookingID}" data-link="${pageContext.request.contextPath}/user/${account.username}/booked-tour/api/recover" type="button" rel="tooltip"
														title="Recover" class="btn btn-danger btn-link btn-sm deleteBtn">
	                                	<i class="material-icons">update</i>
	                              </button>
                            	</td>
                          	</tr>
                          </c:forEach>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
              </div>
            </div>
            <div
			  class="modal fade"
			  id="deleteModel"
			  tabindex="-1"
			  aria-labelledby="exampleModalLabel"
			  aria-hidden="true"
			>
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel"></h5>
			        <button
			          type="button"
			          class="close"
			          data-dismiss="modal"
			          aria-label="Close"
			        >
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body"><span id="confirmBody"></span> <span id="id"></span></div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">
			          Close
			        </button>
			        <a type="button" class="btn btn-danger" id="deleteLink"></a>
			      </div>
			    </div>
			  </div>
			</div>
	</jsp:body>
</t:userpage>