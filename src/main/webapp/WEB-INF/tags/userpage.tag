<%@tag description="Overall Page template for User"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/logo-color.png"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Profile</title>
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- CSS Files -->
<link href="${pageContext.request.contextPath}/resources/user/css/material-dashboard.min.css"
	rel="stylesheet" />
	
<body class="">
	<div class="wrapper ">
		<jsp:include page="/WEB-INF/views/template/user/sidebar.jsp" />
		<div class="main-panel">
			<jsp:include page="/WEB-INF/views/template/user/navbar.jsp" />
			<div class="content">
				<div class="container-fluid">
					<jsp:doBody />
				</div>
			</div>
		</div>
	</div>
	<!--   Core JS Files   -->
	<script
		src="${pageContext.request.contextPath}/resources/user/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/user/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/user/js/bootstrap-material-design.min.js"></script>
</body>
</html>