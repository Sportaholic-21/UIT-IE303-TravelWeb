<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="t"
tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<t:adminpage pageHeading="Edit Booked Tour">
  <jsp:body>
    <form:form class="needs-validation" modelAttribute="tourBooking" action="api/update" method="POST" novalidate="novalidate">
      <form:hidden path="tourBookingID" />
      <form:hidden path="bookDate" />
      <form:hidden path="bookStatus" />
      <form:hidden path="account.accountID" />
      
      <div class="form-row">
        <div class="col-md-4 mb-3">
          <label for="validationCustom01">User</label>
          <input value="${username}" type="text" class="form-control" 
                id="validationCustom01" readonly="true" />
        </div>
        <div class="col-md-4 mb-3">
          <label for="validationCustom03">Booked Tour</label>
          <form:input path="tour.tourID" name="tourID" list="tour" type="text" class="form-control" 
                id="validationCustom03" required="required" />
          <datalist id="tour" >
          	<c:forEach var="oneTour" items="${tours }">
            	<option value="${oneTour.tourID}">${oneTour.tourName }</option>
            </c:forEach>
          </datalist>
        </div>
        <div class="col-md-4 mb-3">
      		<label for="validationCustom04">ScheduleDate</label>
      		<form:input path="scheduleDate" type="date" id="validationCustom04" name="scheduleDate" class="form-control" value="${tourBooking.scheduleDate}"/>
      	</div>
      </div>
      <button class="btn btn-primary" type="submit">Submit</button>
      <a href="${pageContext.request.contextPath}/admin/booked-tour" class="btn btn-warning">Cancel</a>
    </form:form>
  </jsp:body>
</t:adminpage>
