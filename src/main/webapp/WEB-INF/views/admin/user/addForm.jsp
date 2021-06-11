<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<t:adminpage pageHeading="Add User">
	<jsp:body>
   <div>
    <div class="col-12 w-100 pr-0">
      <div class="col-10">
        <hr />
        <div class="ml-2">
          <form:form class="needs-validation" modelAttribute="account"
			               action="api/add" method="POST" novalidate="novalidate">
            <div class="form-group row">
              <div class="col-sm-2">
                <label>Username</label>
              </div>
              <div class="col-sm-5">
                <form:input type="text" class="form-control" path="username"/>
              </div>
            </div>
            <div class="form-group row">
              <div class="col-sm-2">
                <label>Password</label>
              </div>
              <div class="col-sm-5">
                <form:input type="text" id="passField" class="form-control" path="password"/>
              </div>
              <div class="col-sm-3">
                <button type="button" id="pwdGen" class="btn btn-primary">Generate</button>
              </div>
            </div>
            <div class="form-group row">
              <div class="col-sm-2">
                <label>Email:</label>
              </div>
              <div class="col-sm-5">
                <form:input type="email" class="form-control" path="email"/>
              </div>
            </div>
            <!-- <div class="form-group row">
              <div class="col-sm-2">
                <label>Full name:</label>
              </div>
              <div class="col-sm-5">
                <textarea class="form-control" id="shortdesc" rows="1" maxlength="250"></textarea>
              </div>
            </div>
            <div class="form-group row">
              <div class="col-sm-2">
                <label>Address:</label>
              </div>
              <div class="col-sm-5">
                <textarea class="form-control" id="shortdesc" rows="3" maxlength="250"></textarea>
              </div>
            </div>
            <div class="form-group row">
              <div class="col-sm-2">
                <label>Phone:</label>
              </div>
              <div class="col-sm-5">
                <textarea class="form-control" id="shortdesc" rows="1" maxlength="250"></textarea>
              </div>
            </div> -->
            <div class="form-group row">
              <div class="col-sm-2">
                <label>Role:</label>
              </div>
              <div class="col-sm-2">
                <div class="form-check">
                  <form:radiobutton class="form-check-input" name="Role" path="accountRole"
                    value="1" />
                  <label class="form-check-label" for="accountRole">User</label>
                </div>
                <div class="form-check form-check-inline">
                  <form:radiobutton class="form-check-input" name="Role" path="accountRole"
                    value="0" />
                  <label class="form-check-label" for="accountRole">Admin</label>
                </div>
              </div>
            </div>
            <button type="submit" class="btn btn-success pt-2 md-2">Add</button>
          </form:form>
        </div>
      </div>
    </div>
  </div>
  <script>
    var genPass = document.getElementById("pwdGen")
    var passField = document.getElementById("passField")
    genPass.addEventListener("click", async () => {
      await axios.post("/UIT-IE303-TravelWeb/admin/user/api/generatePassword")
                 .then(function(res) {
                    passField.value = res.data
                 })      
    })
  </script>
  </jsp:body>
</t:adminpage>
