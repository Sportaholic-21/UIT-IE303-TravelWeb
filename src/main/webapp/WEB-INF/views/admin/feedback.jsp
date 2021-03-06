<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="t"
tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<t:adminpage pageHeading="Feedback Management">
  <jsp:body>
    <div class="card mb-4">
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
                <th>User</th>
                <th>Tour</th>
                <th>Star</th>
                <th>Comment</th>
                <th>Date</th>
        
                <th>Action</th>
              </tr>
            </thead>
            <tfoot>
              <tr>
                 <th>User</th>
                <th>Tour</th>
                <th>Star</th>
                <th>Comment</th>
                <th>Date</th>
                
                <th>Action</th>
              </tr>
            </tfoot>
            <tbody>
            <c:forEach var="feedback" items="${feedbackList }">
              <tr>
                <td>${feedback.tourBookingID.account.username }</td>
                <td>
                  <a href="${pageContext.request.contextPath}/tour-detail/${feedback.tourBookingID.tour.tourID}"
                    >${feedback.tourBookingID.tour.tourName}</a
                  >
                </td>
                <td>${feedback.start }/5</td>
                <td>${feedback.feedbackMessage }</td>
                <td>${feedback.tourBookingID.scheduleDate}</td>
                
                <td>
                  <button data-toggle="modal" data-target="#deleteModel" type="button" class="btn btn-link text-danger">
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
      <div class="modal-body">Are you sure to delete this feedback?</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">
          Close
        </button>
        <button type="button" class="btn btn-danger">Delete</button>
      </div>
    </div>
  </div>
</div>
  </jsp:body>
</t:adminpage>
