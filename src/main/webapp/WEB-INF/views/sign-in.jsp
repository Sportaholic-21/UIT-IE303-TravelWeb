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
										<a href="#passForgotten" data-toggle="modal" data-target="#passForgotten">Forgot password ?</a>
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
		<div class="modal fade" id="passForgotten" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
			  <div class="modal-content">
				<div class="modal-header">
				  <h5 class="modal-title" id="passForgottenLabel">Forgot Password</h5>
				  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				  </button>
				</div>
				<div class="modal-body">
					<h3>Enter your Email</h3>
					<div class="row" id="status"></div>
					<div class="row">
						<label class="col-sm-2" for="">Email:</label>
					  	<input class="col-sm-5" type="email" name="" id="emailRecovery">
					</div>
				</div>
				<div class="modal-footer">
				  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				  <button id="recover" type="button" class="btn btn-primary">Recover</button>
				</div>
			  </div>
			</div>
		</div>
	<script>
		var btn = document.getElementById("recover")
		var emailSignIn = document.getElementById("emailSignIn")
		var emailRecovery = document.getElementById("emailRecovery")
		emailRecovery.value=emailSignIn.value
		btn.addEventListener("click", async () => {
			await axios.post("/UIT-IE303-TravelWeb/api/forgotPassword", {
				email: emailRecovery.value
			}).then(function(res) {
				console.log(res.data)
			})
		})
	</script>
    </jsp:body>
</t:genericpage>