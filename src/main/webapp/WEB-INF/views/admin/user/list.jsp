<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="t"
tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<t:adminpage pageHeading="Users">
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
                <th>Full Name</th>
                <th>Username</th>
                <th>Email</th>
                <th>Password</th>
                
                <th>Role</th>
                <th>Address</th>
                <th>Social</th>
                <th>Point</th>
                
              </tr>
            </thead>
            <tfoot>
              <tr>
              	<th>Action</th>
              	<th>ID</th>
                <th>Full Name</th>
                <th>Username</th>
                <th>Email</th>
                <th>Password</th>
    
                <th>Role</th>
                <th>Address</th>
                <th>Social</th>
                <th>Point</th>
                
              </tr>
            </tfoot>
            <tbody>
            
            <c:forEach var="account" items="${accounts }">
            	<c:url var="editLink" value="/admin/user/edit">
            		<c:param name="id" value="${account.accountID }" />
            	</c:url>
             
              <tr>
               <td style="width: 105px">
                  <a
                    href="${editLink}"
                    ><button type="button" class="btn btn-link"><i class="far fa-edit"></i> Edit</button></a
                  >
                  <button data-toggle="modal" data-target="#deleteModel" data-id="${account.accountID}" data-link="user/api/delete?" type="button" class="btn btn-link text-danger deleteBtn">
                    <i class="far fa-trash-alt"></i> Delete
                  </button>
                </td>             
               	<td >${account.accountID}</td>
                <td ><a href="${pageContext.request.contextPath}/overview/${account.username }"
                    >${account.fullName }</a></td>
                <td><a href="${pageContext.request.contextPath}/overview/${account.username }"
                    >${account.username}</a></td>
                <td>${account.email}</td>
                <td><input type="password"} value="${account.password}"  readonly="readonly" style="border:none; width: 50px;"/></td>
                <td>${account.accountRole}</td>
                <td>${account.accountAddress}</td>     
                <td>${account.socialMediaLink}</td>
                <td>${account.point}</td>
                    
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
      <div class="modal-body">Are you sure to delete this account? - ID = <span id="id"></span></div>
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
