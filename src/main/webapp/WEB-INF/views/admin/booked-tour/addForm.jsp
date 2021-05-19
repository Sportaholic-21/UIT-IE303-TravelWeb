<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="t"
tagdir="/WEB-INF/tags"%>

<t:adminpage pageHeading="Add Booked Tour">
  <jsp:body>
    <form class="needs-validation" novalidate>
      <div class="form-row">
        <div class="col-md-6 mb-3">
          <label for="validationCustom01">Account</label>
          <input list="account" type="text" class="form-control"
                id="validationCustom01" required>
        <datalist id="account">
        <option value="01 - a">
                <option value="02 - b">
              </datalist>
        </div>
        <div class="col-md-6 mb-3">
          <label for="validationCustom03">Booked Tour</label>
          <input list="tour" type="text" class="form-control"
                id="validationCustom03" required>
        <datalist id="tour">
        <option value="Vietnam">
                <option value="Laos">
              </datalist>
        </div>
      </div>
      <button class="btn btn-primary" type="submit">Submit</button>
      <a href="${pageContext.request.contextPath}/admin/booked-tour" class="btn btn-warning">Cancel</a>
    </form>
  </jsp:body>
</t:adminpage>
