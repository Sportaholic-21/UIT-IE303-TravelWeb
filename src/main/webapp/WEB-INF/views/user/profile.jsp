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
                  <h4 class="card-title">Edit Profile</h4>
                  <p class="card-category">Complete your profile</p>
                </div>
                <div class="card-body">
                  <form:form class="needs-validation" modelAttribute="account" action="${pageContext.request.contextPath}/user/personal/api/update" method="POST" novalidate="novalidate">
                    <form:hidden path="accountID" />
                    <div class="row">
                      <div class="col-12">
                      	<div class="mb-3">
						  <label for="formFile" class="form-label bmd-label-floating">New Avatar</label>
						  <form:input class="form-control" type="file" id="formFile" path="avatar" />
						</div>
                      </div>
					</div>
                    <div class="row">
                      <div class="col-md-5">
                        <div class="form-group">
                          <label class="bmd-label-floating">Username</label>
                          <form:input type="text" class="form-control" path="username" />
                        </div>
                      </div>
                      <div class="col-md-7">
                        <div class="form-group">
                          <label class="bmd-label-floating">Email address</label>
                          <form:input type="email" class="form-control" path="email" />
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-5">
                        <div class="form-group">
                          <label class="bmd-label-floating">Name</label>
                          <form:input type="text" class="form-control" path="fullName" />
                        </div>
                      </div>
                      <div class="col-md-7">
                        <div class="form-group">
                          <label class="bmd-label-floating">Social Link</label>
                          <form:input type="text" class="form-control" path="socialMediaLink" />
                        </div>
                      </div>
                    </div>
                    
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating">Address</label>
                          <form:input type="text" class="form-control" path="accountAddress" />
                        </div>
                      </div>
                    </div>
                    <button type="submit"
								class="btn btn-primary pull-right">Update Profile</button>
                    <div class="clearfix"></div>
                  </form:form>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="card card-profile">
                <div class="card-avatar">
                  <a href="javascript:;">
                    <img class="img"
							src="${account.avatar}" />
                  </a>
                </div>
                <div class="card-body">
                  <h4 class="card-title">${account.username }</h4>
                </div>
              </div>
            </div>
          </div>
    </jsp:body>
</t:userpage>