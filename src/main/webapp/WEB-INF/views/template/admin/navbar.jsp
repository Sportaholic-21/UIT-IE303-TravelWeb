<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
	<a class="navbar-brand" href="${pageContext.request.contextPath}/home">Levart</a>
	<button class="btn btn-link btn-sm order-1 order-lg-0"
		id="sidebarToggle" href="#!">
		<i class="fas fa-bars"></i>
	</button>
	
	<!-- Navbar-->
	<ul class="navbar-nav ml-auto">
		<li class="nav-item dropdown"><a class="nav-link"
			href="javascript:;" id="navbarDropdownProfile" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false"> ${account.username} </a>
			<div class="dropdown-menu dropdown-menu-right"
				aria-labelledby="navbarDropdownProfile">
				<a class="dropdown-item"
					href="${pageContext.request.contextPath}/${account.username}">Overview</a>
				<a class="dropdown-item"
					href="${pageContext.request.contextPath}/user?tab=profile">Setting</a>
				<c:choose>
					<c:when test="${account.accountRole == 0}">
						<a class="dropdown-item"
							href="${pageContext.request.contextPath}/admin">Admin
							Dashboard</a>
					</c:when>
				</c:choose>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" id="signOut" style="cursor: pointer">Log
					out</a>
			</div></li>
	</ul>
</nav>
