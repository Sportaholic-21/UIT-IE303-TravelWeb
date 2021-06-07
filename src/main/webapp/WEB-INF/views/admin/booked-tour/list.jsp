<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="t"
tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<t:adminpage pageHeading="Booked Tours">
  <jsp:body>
    <div class="card mb-4">
      <div class="card-header">
        <i class="fas fa-table mr-1"></i>
        Booked Tour Information
      </div>
      <div class="card-body">
        <div class="table-responsive">
          <table
            class="table table-bordered"
            id="dataTable"
            width="100%"
            cellspacing="0"
          >
            <thead>
              <tr>
              	<th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Booking Date</th>
                <th>Booked Tour</th>
                <th>Status</th>
                <th>Action</th>
              </tr>
            </thead>
            <tfoot>
              <tr>
              	<th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Booking Date</th>
                <th>Booked Tour</th>
                <th>Status</th>
                <th>Action</th>
              </tr>
            </tfoot>
            <tbody>
            
            <c:forEach var="tourBooking" items="${tourBookings }">
            	<c:url var="editLink" value="/admin/booked-tour/edit">
            		<c:param name="id" value="${tourBooking.tourBookingID }" />
            	</c:url>
             
              <tr>
               <form:form action="booked-tour/updateStatusBookedTour" modelAttribute="statusBookedTour">
               	<td style="width:8px"><form:input path="tourBookingID" value="${tourBooking.tourBookingID}" style="border:none;width:100%"/></td>
                <td style="width:15px">${tourBooking.account.username }</td>
                <td>${tourBooking.account.email}</td>
                <td>${tourBooking.bookDate}</td>
                <td>
                  <a href="${pageContext.request.contextPath}/tour/${tourBooking.tour.tourID }"
                    >${tourBooking.tour.tourName}</a
                  >
                </td>
                <form:input path="tour.tourID" value="${tourBooking.tour.tourID}"  style="display:none"/>
                <td>
                  <form:select path="bookStatus" class="custom-select">
                    <option value="1" ${tourBooking.bookStatus == "1" ? "selected" : ''}>Not Start Yet</option>
                    <option value="2" ${tourBooking.bookStatus == "2" ? "selected" : ''}>Started</option>
                    <option value="3" ${tourBooking.bookStatus == "3" ? "selected" : ''}>Ended</option>
                    <option value="4" ${tourBooking.bookStatus == "4" ? "selected" : ''}>Cancel</option>
                  </form:select>
                  <input type="submit"></input>
                  </form:form>
                </td>
                <td>
                  <a
                    href="${editLink}"
                    ><button type="button" class="btn btn-link">Edit</button></a
                  >
                  <button data-toggle="modal" data-target="#deleteModel" data-id="${tourBooking.tourBookingID}" data-link="booked-tour/api/delete?" type="button" class="btn btn-link text-danger deleteBtn">
                    Delete
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
        <h5 class="modal-title" id="exampleModalLabel">Confirm Delete</h5>
        <button
          type="button"
          class="close"
          data-dismiss="modal"
          aria-label="Close"
        >
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">Are you sure to delete this booking? - ID = <span id="id"></span></div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">
          Close
        </button>
        <a type="button" class="btn btn-danger" id="deleteLink">Delete</a>
      </div>
    </div>
  </div>
</div>
  </jsp:body>
</t:adminpage>
