<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

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
							<div class = "title signup">Sign Up</div>
						</div>
						
						<div class = "form-container">
							<div class = "slide-controls">
								<input type = "radio" name = "slider" id = "login" checked>
								<input type = "radio" name = "slider" id = "signup">
								<label for = "login" class = "slide login">Sign In</label>
								<label for = "signup" class = "slide signup">Sign Up</label>
								<div class = "slide-tab"></div>
							</div>
							
							<div class = "form-inner">
								<form action="#" class = "login">
									<div class = "field">
										<input type="email" placeholder="Email Address" required>
									</div>
									<div class = "field">
										<input type="password" placeholder="Password" required>
									</div>
									<div class = "pass-link">
										<a href="#">Forgot password ?</a>
									</div>
									
									<div class = "remember__field">
										<input type="checkbox" placeholder="" name= "remeberme" value="Remember me" checked>
										<label for ="remeberme">Remember me</label>
									</div>
									
									<div class = "field">
										<input type="submit" value="Sign in" class="submit">
									</div>
								</form>
								
								<form action="#" class = "signup">
									<div class = "field">
										<input type="text" placeholder="Name" required>
									</div>
									<div class = "field">
										<input type="tel" placeholder="Phone number" required>
									</div>
									<div class = "field">
										<input type="email" placeholder="Email Address" required>
									</div>
									<div class = "field">
										<input type="password" placeholder="Password" required>
									</div>
									<div class = "field">
										<input type="password" placeholder="Confirm password" required>
									</div>
									
									<div class = "field">
										<input type="submit" value="Sign up" class="submit">
									</div>
								</form>
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
		<script>
			const loginText = document.querySelector(".title-text .login");
			const loginForm = document.querySelector("form.login");
			const loginBtn = document.querySelector("label.login");
			const signupBtn = document.querySelector("label.signup");
			const signupLink = document.querySelector("form .signup-link a");
			signupBtn.onclick = (()=>{
				loginForm.style.marginLeft = "-50%";
				loginText.style.marginLeft = "-50%";
			});
			loginBtn.onclick = (()=>{
				loginForm.style.marginLeft = "0%";
				loginText.style.marginLeft = "0%";
			});
			signupLink.onclick = (()=>{
				signupBtn.click();
				return false;
			});
		</script>
    </jsp:body>
</t:genericpage>