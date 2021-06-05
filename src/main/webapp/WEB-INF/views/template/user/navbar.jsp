<nav
	class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
	<div class="container-fluid">
		<div class="collapse navbar-collapse justify-content-end">
		<p class="pr-4 mt-3 font-weight-bold">It's A Big World Out There, Go Explore!!</p>
			<ul class="navbar-nav">
				<li class="nav-item dropdown"><a class="nav-link"
					href="javascript:;" id="navbarDropdownProfile"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="material-icons">person</i>
						<p class="d-lg-none d-md-block">Account</p>
				</a>
					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="navbarDropdownProfile">
						<a class="dropdown-item" href="${pageContext.request.contextPath}/user/${account.username}">Overview</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/user/${account.username}?tab=profile">Profile</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Log out</a>
					</div></li>
			</ul>
		</div>
	</div>
</nav>