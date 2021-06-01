<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="t"
tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<t:adminpage pageHeading="Edit Booked Tour">
  <jsp:body>
    <form:form class="needs-validation" modelAttribute="addTourBooking" action="addTourBooking" method="POST" novalidate="novalidate">
      <%-- <form:hidden path="tourBookingID" />
      <form:hidden path="bookDate" />
      <form:hidden path="bookStatus" />
      <form:hidden path="account.accountID" /> --%>
      
      <div class="form-row">
        <div class="col-md-6 mb-3">
          <label for="validationCustom01">User</label>
          <form:input path="account.accountID" name="accountID" list="account" type="text" class="form-control" 
                id="validationCustom01" required="required"/>
          <script type="text/javascript">
        	  var accountID=document.querySelector("#validationCustom01");
              var valueold;
              accountID.onfocus=function(){
            	  valueold=accountID.value;
            	  accountID.value="";
              }
              accountID.onblur=function(){
            	  if (accountID.value=="") accountID.value=valueold;
              }
          </script>
          <datalist id="account" >
          	<c:forEach var="account" items="${accounts}">
            	<option value="${account.accountID}">${account.username}</option>
            </c:forEach>
          </datalist>
        </div>
        </div>
        <div class="col-md-6 mb-3">
          <label for="validationCustom03">Booked Tour</label>
          <form:input path="tour.tourID" name="tourID" list="tour" type="text" class="form-control" 
                id="validationCustom03" required="required" onfocus="this.value=''"/>
                <script type="text/javascript">
        	  var tourID=document.querySelector("#validationCustom03");
              var valueold;
              tourID.onfocus=function(){
            	  valueold=tourID.value;
            	  tourID.value="";
              }
              tourID.onblur=function(){
            	  if (tourID.value=="") tourID.value=valueold;
              }
          </script>
          <datalist id="tour" >
          	<c:forEach var="oneTour" items="${tours}">
            	<option value="${oneTour.tourID}">${oneTour.tourName }</option>
            </c:forEach>
          </datalist>
        </div>
      
      <button class="btn btn-primary" type="submit">Submit</button>
      <a href="${pageContext.request.contextPath}/admin/booked-tour" class="btn btn-warning">Cancel</a>
    </form:form>
  </jsp:body>
</t:adminpage>
