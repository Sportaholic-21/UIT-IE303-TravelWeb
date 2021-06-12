<%@tag description="Overall Page template for Admin"
	pageEncoding="UTF-8"%>
<%@attribute name="pageHeading" required="true" type="java.lang.String"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Levart | Admin</title>

<link
	href="${pageContext.request.contextPath}/resources/admin/css/styles.css"
	rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
	
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/logo-color.png"/>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="/WEB-INF/views/template/admin/navbar.jsp" />

	<div id="layoutSidenav">
		<jsp:include page="/WEB-INF/views/template/admin/sidebar.jsp" />
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid">
					<h1 class="mt-4">${pageHeading}</h1>
					<jsp:doBody />
				</div>
			</main>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/js/scripts.js"></script>
		<script
		src="${pageContext.request.contextPath}/resources/admin/js/validate-form.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/assets/demo/chart-area-demo.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/passDataToModalDelete.js"></script>
		
		<script
		src="${pageContext.request.contextPath}/resources/user/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/user/js/bootstrap-material-design.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/passDataToModalDelete.js"></script>
	<!-- page script -->
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/logout.js"></script>
</body>
</html>
