<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="t"
tagdir="/WEB-INF/tags"%>

<t:adminpage pageHeading="Edit Booked Tour">
  <jsp:body>
    <form class="needs-validation" novalidate>
      <div class="form-row">
        <div class="col-md-6 mb-3">
          <label for="validationCustom01">User</label>
          <input type="text" class="form-control" value="01 - a"
                id="validationCustom01" disabled>
        </div>
        <div class="col-md-6 mb-3">
          <label for="validationCustom03">Booked Tour</label>
          <input list="tour" type="text" class="form-control" value="Vietnam"
                id="validationCustom03" required>
          <datalist id="tour">
            <option value="Vietnam">
            <option value="Laos">
          </datalist>
        </div>
      </div>
      <button class="btn btn-primary" type="submit">Submit</button>
      <a href="${pageContext.request.contextPath}/admin/booked-tours" class="btn btn-warning">Cancel</a>
    </form>
  </jsp:body>
</t:adminpage>
