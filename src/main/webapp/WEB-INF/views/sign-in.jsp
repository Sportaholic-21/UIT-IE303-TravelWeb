<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<t:genericpage pageTitle="Sign in">
	<jsp:attribute name="pageCSSLink">
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/resources/css/pages/sign-in.css">
		<script src = "${pageContext.request.contextPath}/resources/js/sign-in.js" ></script>
	</jsp:attribute>
	<jsp:body>
		<div class = "signinsignup__heading pb-0" style = "background: linear-gradient( rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.2)), url('${pageContext.request.contextPath}/resources/images/signinsignup-bg.jpg');">
			<h1 class = "signinsignup__title">Explore the world with Levart.</h1>
			<h2 class = "signinsignup__title-small">Let us make your travelling dream come true.</h2>
		</div>
		<div class ="mb-5"></div>
		<div class = "row">
			<div class = "col-sm-6">
				<div class = "container__bothform">
					<div class = "wrapper">
						<div class = "title-text">
							<div class = "title login">Sign In</div>
						</div>
						
						<div class = "form-container">
							
							<div class = "form-inner">
								<form:form action="signIn" class = "login" modelAttribute="contentSignIn">
									<div class = "field">
										<form:input id="emailSignIn" path="email" type="email" placeholder="Email Address" required="required"/>
									</div>
									<div class = "field">
										<form:password path="pass" placeholder="Password" required="required"/>
									</div>
									<div class = "pass-link">
										<a href="#passForgotModal" data-bs-toggle="modal" data-bs-target="#passForgotModal">Forgot password ?</a>
									</div>
									
									<div class = "remember__field">
										<form:checkbox path="rememberme" value="1" checked="checked"/>
										<label for ="remeberme">Remember me</label>
									</div>
									
									<div class = "field">
										<input type="submit" value="Sign in" class="submit">
									</div>
								</form:form>
								
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class = "col-sm-6">
				<img src ="${pageContext.request.contextPath}/resources/images/signinform-background.jpg" alt ="background" width= "85%" height="85%" class = "mx-auto d-block" style = "margin-top: 50px">
			</div>	
		</div>
		<div class ="mb-5"></div>
		<!-- Modal forgot password-->
		<div class="modal fade" id="passForgotModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
			  <div class="modal-content">
				<div class="modal-header">
				  <h5 class="modal-title" >Forgot Password</h5>
				  <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				  </button>
				</div>
				<div class="modal-body">
					<div class="mx-auto row alert alert-danger" id="noEmail">
						This email does not exist!
					</div>
					<div class="pb-3 form-group">
						<input type="text" class="form-control" id="emailRecovery" placeholder="Your Email*" required>
					</div>
					<button type="button" class="btn modalBtn" id="resetBtn">Reset Password</button>
				</div>
			  </div>
			</div>
		</div>
		<!--Modal OTP-->
		<div class="modal fade" id="otpModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
			  <div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" >Enter OTP</h5>
					<button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
					  <span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="mx-auto row alert alert-danger" id="wrongOTP">
						Wrong OTP!
					</div>
					<div class="pb-3 form-group">
						<input type="text" class="form-control" id="otp" placeholder="OTP*" required>
					</div>
					<button type="button" class="btn modalBtn" id="otpBtn">Verify</button>
				</div>
			  </div>
			</div>
		</div>
		<!--Modal new Password-->
		<div class="modal fade" id="newPasswordModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
			  <div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" >Reset Password</h5>
					<button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
					  <span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="pb-3 form-group">
						<input type="text" class="form-control" id="newPassword" placeholder="New password*" required>
					</div>
					<button type="button" class="btn modalBtn" id="confirmBtn">Confirm Reset Password</button>
				</div>
			  </div>
			</div>
		</div>
    </jsp:body>
</t:genericpage>