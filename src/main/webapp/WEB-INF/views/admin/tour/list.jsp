<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="t"
tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<t:adminpage pageHeading="Tours">
  <jsp:body>
    <div class="card mb-4">
      <div class="card-header">
        <i class="fas fa-table mr-1"></i>
        Tour Information
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
              	<th>Action</th>
              	<th>ID</th>
                <th>Name</th>
                <th>Nation</th>
                <th>Typology</th>
                <th>Description</th>
                <th>Short Description</th>
                <th>Price</th>
                <th>Schedule</th>
                <th>Discount</th>
                <th>Coordinate</th>
                
              </tr>
            </thead>
            <tfoot>
              <tr>
              	<th>Action</th>
              	<th>ID</th>
                <th>Name</th>
                <th>Nation</th>
                <th>Typology</th>
                <th>Description</th>
                <th>Short Description</th>
                <th>Price</th>
                <th>Schedule</th>
                <th>Discount</th>
                <th>Coordinate</th>
                
              </tr>
            </tfoot>
            <tbody>
            
            <c:forEach var="tour" items="${tours }">
            	<c:url var="editLink" value="/admin/tour/edit">
            		<c:param name="id" value="${tour.tourID }" />
            	</c:url>
             
              <tr>
               <td>
                  <a
                    href="${editLink}"
                    ><button type="button" class="btn btn-link"><i class="far fa-edit"></i> Edit</button></a
                  >
                  <button data-toggle="modal" data-target="#deleteModel" data-id="${tour.tourID}" data-link="tour/api/delete?" type="button" class="btn btn-link text-danger deleteBtn">
                    <i class="far fa-trash-alt"></i>Delete
                  </button>
                </td>
               <form:form action="booked-tour/updateStatusBookedTour" modelAttribute="TourModelAttribute">
               	<td >${tour.tourID}</td>
                <td ><a href="${pageContext.request.contextPath}/tour-detail/${tour.tourID }"
                    >${tour.tourName }</a></td>
                <td>${tour.nation.nationName}</td>
                <td>${tour.typology.typologyName}</td>
                <td><div style="width: 200px;height: 160px; overflow: auto;">${tour.desc}</div></td>
                <td><div style="width: 200px;height: 160px; overflow: auto;">${tour.shortDesc}</div></td>
                <td>${tour.price} $</td>     
                <td><div style="width: 200px;height: 160px; overflow: auto;">${tour.schedule}</div></td>
                <td>${tour.discount}</td>
                <td>${tour.coordinate}</td>         
                </form:form>
                
               
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
      <div class="modal-body">Are you sure to delete this tour? - ID = <span id="id"></span></div>
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
