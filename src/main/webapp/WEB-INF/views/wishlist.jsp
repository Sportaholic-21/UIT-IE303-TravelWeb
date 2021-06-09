<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<t:genericpage pageTitle="Wishlist">
	<jsp:body>
		<section class="landing pl-5" height="650"
             style="background: linear-gradient( rgba(0, 0, 0, 0.4) 100%,
										rgba(0, 0, 0, 0.4)100%),
		  								url('${pageContext.request.contextPath}/resources/images/wishlist-cover.jpg') 0px -470px no-repeat; background-size:cover"
		    >
		        <h1 class="landing-h1 text-white ml-5 pb-5">WISHLIST</h1>
		    </section>
		<div class="container wishlist">
	 		<a href="${pageContext.request.contextPath}/contact"  class="btn btn-warning btn-round mb-5 float-right">Book New Tour</a>
              <div class="card">
                <div
						class="card-header card-header-tabs card-header-primary font-weight-bold">
                <h2> Wishlist</h2>
                </div>
                <div class="card-body">
                    <table class="table">
                      <thead>
                      	<tr>
                      		<th>Tour ID</th>
                      		<th>Tour Name</th>
                      		<th>Nation</th>
                      		<th>Duration</th>
                      		<th>Rating</th>
                      		<th>Remove</th>
                      	</tr>
                      </thead>
                        <tbody>
                         <c:forEach var="wishlistItem" items="${wishlistSession}">
                          <tr>
                          		<td>${wishlistItem.tourID }</td>
								<td>
                    	        	<a class="text-primary" href="${pageContext.request.contextPath}/tour-detail/${wishlistItem.tourID }"
                    					>${wishlistItem.tourName }</a
                  				></td>
	                            <td>${wishlistItem.nation.nationName}</td>
	                            <td>${wishlistItem.duration}</td>
	                            <td>${wishlistItem.rating}</td>
	                            <td>
		                            <button data-toggle="modal" data-type="remove" data-target="#deleteModel" data-id="${wishlistItem.tourID}" data-link="${pageContext.request.contextPath}/wishlist/api?action=remove&" type="button" rel="tooltip"
														title="Remove" class="btn-link btn-sm deleteBtn">
	                                	<i class="fas fa-times text-danger"></i>
	                              </button>
                            	</td>
                          	</tr>
                          </c:forEach>
                        </tbody>
                      </table>
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
			        <h5 class="modal-title" id="exampleModalLabel">Confirm Remove</h5>
			        <button
			          type="button"
			          class="close"
			          data-dismiss="modal"
			          aria-label="Close"
			        >
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body"><span id="confirmBody">Are you sure to remove this to from wishlist? ID = </span> <span id="id"></span></div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">
			          Close
			        </button>
			        <button type="button" class="btn btn-danger removeWishlist" id="deleteLink">Remove</button>
			      </div>
			    </div>
			  </div>
			  </div>
			</jsp:body>
		</t:genericpage>