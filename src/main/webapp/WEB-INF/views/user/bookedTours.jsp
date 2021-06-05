<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<t:userpage>
	<jsp:body>
	 <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div
						class="card-header card-header-tabs card-header-primary">
                  <div class="nav-tabs-navigation">
                    <div class="nav-tabs-wrapper">
                      <span class="nav-tabs-title">Booked Tours:</span>
                      <ul class="nav nav-tabs" data-tabs="tabs">
                        <li class="nav-item">
                          <a class="nav-link active" href="#profile"
										data-toggle="tab">
                            <i class="material-icons">bug_report</i> Not Start Yet
                            <div class="ripple-container"></div>
                          </a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="#messages"
										data-toggle="tab">
                            <i class="material-icons">code</i> Ended
                            <div class="ripple-container"></div>
                          </a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="#settings"
										data-toggle="tab">
                            <i class="material-icons">cloud</i> Cancel
                            <div class="ripple-container"></div>
                          </a>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="card-body">
                  <div class="tab-content">
                    <div class="tab-pane active" id="profile">
                      <table class="table">
                      <thead>
                      	<tr>
                      		<th>Tour ID</th>
                      		<th>Tour Name</th>
                      		<th>Nation</th>
                      		<th>Start Date</th>
                      		<th>Duration</th>
                      		<th>Action</th>
                      	</tr>
                      </thead>
                        <tbody>
                          <tr>
                            <td>
                              1
                            </td>
                            <td>Ha Long Bay</td>
                            <td>Viet Nam</td>
                            <td>12/12/2000</td>
                            <td>3 days</td>
                            <td>
                              <button type="button" rel="tooltip"
													title="Cancel" class="btn btn-danger btn-link btn-sm">
                                <i class="material-icons">close</i>
                              </button>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                    <div class="tab-pane" id="messages">
                      <table class="table">
                      <thead>
                      	<tr>
                      		<th>Tour ID</th>
                      		<th>Tour Name</th>
                      		<th>Nation</th>
                      		<th>Start Date</th>
                      		<th>Duration</th>
                      		<th>Feeling</th>
                      	</tr>
                      </thead>
                        <tbody>
                          <tr>
                            <td>
                              1
                            </td>
                            <td>Ha Long Bay</td>
                            <td>Viet Nam</td>
                            <td>12/12/2000</td>
                            <td>3 days</td>
                            <td>abc</td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                    <div class="tab-pane" id="settings">
                    <table class="table">
                      <thead>
                      	<tr>
                      		<th>Tour ID</th>
                      		<th>Tour Name</th>
                      		<th>Nation</th>
                      		<th>Start Date</th>
                      		<th>Duration</th>
                      		<th>Action</th>
                      	</tr>
                      </thead>
                        <tbody>
                          <tr>
                            <td>
                              1
                            </td>
                            <td>Ha Long Bay</td>
                            <td>Viet Nam</td>
                            <td>12/12/2000</td>
                            <td>3 days</td>
                            <td>
                              <button type="button" rel="tooltip"
													title="Cancel" class="btn btn-danger btn-link btn-sm">
                                <i class="material-icons">close</i>
                              </button>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
              </div>
            </div>
    
	</jsp:body>
</t:userpage>