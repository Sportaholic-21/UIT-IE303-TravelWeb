<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@attribute name="pageCSSLink" fragment="true"%>
<%@attribute name="pageTitle" required="true" type="java.lang.String"%>
<%@attribute name="header" fragment="true"%>
<%@attribute name="footer" fragment="true"%>
<%@attribute name="pageScript" fragment="true"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />

<!-- font awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- css page style -->
<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/resources/css/style.css">

<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/resources/css/components/_navbar.css">
			
<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/resources/css/components/_sidebar.css">

<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/resources/css/components/_footer.css">
			
<jsp:invoke fragment="pageCSSLink" />

<title>Levart | ${pageTitle}</title>
</head>
<body>
	<jsp:include page="../views/template/navbar.jsp" />
	<jsp:include page="../views/template/sidebar.jsp" />

	<main id="body" class="main">
		<jsp:doBody />
	</main>

	<jsp:include page="../views/template/footer.jsp" />

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
		crossorigin="anonymous"></script>

	<script src="${pageContext.request.contextPath}/resources/js/toggle-btn-sidebar.js"></script>
	<!-- page script -->
	<jsp:invoke fragment="pageScript" />
</body>
</html>