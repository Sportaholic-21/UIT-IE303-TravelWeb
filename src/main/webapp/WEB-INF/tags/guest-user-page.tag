<%@tag description="Overall Page template for User" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/resources/images/logo-color.png" />
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
<link
	href="${pageContext.request.contextPath}/resources/user/css/material-dashboard.min.css?v=2.1.2"
	rel="stylesheet" />
	
	<link
	href="${pageContext.request.contextPath}/resources/user/css/style.css"
	rel="stylesheet" />

<link href="https://api.mapbox.com/mapbox-gl-js/v2.3.0/mapbox-gl.css"
	rel="stylesheet">
<script src="https://api.mapbox.com/mapbox-gl-js/v2.3.0/mapbox-gl.js"></script>
<body class="">
	<div class="wrapper ">
		<div class="container">
			<jsp:include page="/WEB-INF/views/template/user/navbar.jsp" />
			<div class="content">
				<div class="container-fluid pt-5">
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