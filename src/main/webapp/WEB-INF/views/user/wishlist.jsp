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
						class="card-header card-header-tabs card-header-primary font-weight-bold">
                 Wishlist
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
                          		<td>a</td>
								<td>
                    	        	<a href="${pageContext.request.contextPath}/tour-detail/${wishlistItem.tourID }"
                    					>${wishlistItem.tourName }</a
                  				></td>
	                            <td>${wishlistItem.nation.nationName}</td>
	                            <td>${wishlistItem.duration}</td>
	                            <td>${wishlistItem.rating}</td>
	                            <td>
		                            <button data-toggle="modal" data-type="remove" data-target="#deleteModel" data-id="${wishlistItem.tourID}" data-link="${pageContext.request.contextPath}/user/wishlist/api?action=remove&" type="button" rel="tooltip"
														title="Remove" class="btn btn-danger btn-link btn-sm deleteBtn">
	                                	<i class="material-icons">close</i>
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
			        <a type="button" class="btn btn-danger" id="deleteLink">Remove</a>
			      </div>
			    </div>
			  </div>
			</div>
	</jsp:body>
</t:userpage>