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

<jsp:invoke fragment="pageCSSLink" />
<link rel="stylesheet" id="nicdark-style-css" href="http://www.nicdarkthemes.com/themes/travel/wp/demo/love-travel/wp-content/themes/lovetravel/style.css?ver=5.2.1" type="text/css" media="all">
   
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
			
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/logo-color.png"/>
			
<title>Levart | ${pageTitle}</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/template/navbar.jsp" />
	<jsp:include page="/WEB-INF/views/template/sidebar.jsp" />

	<main id="body" class="main" style="position: relative; top: -88px;">
		<jsp:doBody />
	</main>

	<jsp:include page="/WEB-INF/views/template/footer.jsp" />

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
		crossorigin="anonymous"></script>

	<script src="${pageContext.request.contextPath}/resources/js/passDataToModalDelete.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/toggle-btn-sidebar.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/addWishlist.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/hideShowNav.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/user/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/user/js/bootstrap-material-design.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/passDataToModalDelete.js"></script>
	<!-- page script -->
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<script>
		axios.get("sidebarTourList")
	</script>
	<script src="${pageContext.request.contextPath}/resources/js/forgotPassword.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/logout.js"></script>
	<jsp:invoke fragment="pageScript" />
	<script>
        !(function() {
            let e = document.createElement("script"),
                t = document.head || document.getElementsByTagName("head")[0];
            (e.src =
                "https://cdn.jsdelivr.net/npm/rasa-webchat@1.x.x/lib/index.js"),
            // Replace 1.x.x with the version that you want
            (e.async = !0),
            (e.onload = () => {
                window.WebChat.default({
                        selector: "#webchat",
                        initPayload: '/greet',
                        customData: {
                            language: "en"
                        },
                        socketUrl: "http://localhost:5005",
                        socketPath: "/socket.io/",
                        title: "Levart",
                        subtitle: "Welcome",
                        params: {
                            "storage": "session"
                        }
                    },
                    null
                );
            }),
            t.insertBefore(e, t.firstChild);
        })();
    </script>
</body>
</html>