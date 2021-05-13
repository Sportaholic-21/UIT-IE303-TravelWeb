<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="t"
tagdir="/WEB-INF/tags"%>

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
                <th>Name</th>
                <th>Email</th>
                <th>Booking Date</th>
                <th>Booked Tour</th>
                <th>Status</th>
                <th>Action</th>
              </tr>
            </tfoot>
            <tbody>
              <tr>
                <td>Tiger Nixon</td>
                <td>test@gmail.com</td>
                <td>01/01/2001</td>
                <td>
                  <a href="${pageContext.request.contextPath}/tour-detail"
                    >Hong Kong</a
                  >
                </td>
                <td>
                  <select class="custom-select">
                    <option value="1" selected>Not Start Yet</option>
                    <option value="2">Started</option>
                    <option value="3">Ended</option>
                    <option value="4">Cancel</option>
                  </select>
                </td>
                <td>
                  <a
                    href="${pageContext.request.contextPath}/admin/edit-booked-tour"
                    ><button type="button" class="btn btn-link">Edit</button></a
                  >
                  <button data-toggle="modal" data-target="#deleteModel" type="button" class="btn btn-link text-danger">
                    Delete
                  </button>
                </td>
              </tr>
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
      <div class="modal-body">Are you sure to delete this booking?</div>
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
