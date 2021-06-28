<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<t:userpage>
	<jsp:body>
  		<div class="row">
            <div class="col-md-8">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title">Security</h4>
                  <p class="card-category">Edit your Password</p>
                </div>
                <div class="card-body">
                  <form id="submitPassword">
                      <div class="row">
                          <div class="col-12">
                            <div class="mb-3">
                              <label for="formFile" class="form-label bmd-label-floating">Current Password</label>
                              <input class="form-control" type="text" id="currentPassword" />
                              <small id="wrongCurrent" class="form-text text-danger"></small>
                            </div>
                          </div>
                      </div>
                      <div class="row">
                          <div class="col-12">
                            <div class="mb-3">
                              <label for="formFile" class="form-label bmd-label-floating">New Password</label>
                              <input class="form-control" type="password" id="newPassword" name="password"/>
                              <small id="noNew" class="form-text text-danger"></small>
                            </div>
                          </div>
                      </div>
                      <div class="row">
                          <div class="col-12">
                            <div class="mb-3">
                              <label for="formFile" class="form-label bmd-label-floating">Confirm Password</label>
                              <input class="form-control" type="password" id="confirmPassword" />
                              <small id="notMatch" class="form-text text-danger"></small>
                            </div>
                          </div>
                      </div>
                      <button id="changePassword" type="submit" class="btn btn-primary pull-right">Save Password</button>
                      <div class="clearfix"></div>
                  </form>
               </div>
              </div>
            </div>     
        </div>
    </jsp:body>
</t:userpage>
<script>
  async function sendData() {
    const email = '${account.email}';
    const password = $("#newPassword").val();
    await axios.post("/UIT-IE303-TravelWeb/api/changePassword", {
      email: email,
      password: password
    }).then(function(res) {
      if (res.data != -1) window.alert("Successfully change password");
    }).catch(function(err) {
      console.log(err);
    })
  }
  $(document).ready(function() {
    $("#submitPassword").submit(function(e) {
      e.preventDefault();
      if ($("#currentPassword").val() != '${account.password}') {
        $("#wrongCurrent").text("Enter a valid password and try again");
        return false;
      }
      if ($("confirmPassword").val() != $("#newPassword").val()) {
        $("#notMatch").text("Password does not match");
        return false;
      }
      sendData();
      return true;
    })
  })
</script>