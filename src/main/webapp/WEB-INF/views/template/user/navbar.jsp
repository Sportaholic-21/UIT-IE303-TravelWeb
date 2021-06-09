<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav
	class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
	<div class="container">
		<a href="${pageContext.request.contextPath}/home"
			class="pl-4 mt-3 font-weight-bold">Levart</a>
		<div class="container-fluid">
			<div class="collapse navbar-collapse justify-content-end">
				<p class="pr-4 mt-3 font-weight-bold">It's A Big World Out
					There, Go Explore!!</p>
				<ul class="navbar-nav">
					<li class="nav-item">
						<div class="collapse navbar-collapse justify-content-end">
							<ul class="navbar-nav">
								<li class="nav-item dropdown"><a class="nav-link"
									href="javascript:;" id="navbarDropdownProfile"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> ${account.username} </a>
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
										<a class="dropdown-item" id="signOut" style="cursor: pointer">Log out</a>
									</div></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</nav>