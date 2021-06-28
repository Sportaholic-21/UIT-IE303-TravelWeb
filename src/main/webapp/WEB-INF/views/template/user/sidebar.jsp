<div class="sidebar" data-color="purple" data-background-color="white"
	data-image="${pageContext.request.contextPath}/resources/user/img/sidebar-1.jpg">
	<div class="logo">
		<a href="${pageContext.request.contextPath}" class="simple-text logo-normal">
			Levart </a>
	</div>
	<div class="sidebar-wrapper">
		<ul class="nav">
			<li class="nav-item ${active.equals('profile') ? 'active' : ''}"><a class="nav-link"
				href="${pageContext.request.contextPath}/user?tab=profile"> <i class="material-icons">person</i>
					<p>Profile</p>
			</a></li>
			<li class="nav-item ${active.equals('security') ? 'active' : ''}"><a class="nav-link"
				href="${pageContext.request.contextPath}/user?tab=security"> <i class="material-icons">person</i>
					<p>Security</p>
			</a></li>
			<li class="nav-item ${active.equals('bookedTours') ? 'active' : ''}"><a class="nav-link" href="${pageContext.request.contextPath}/user?tab=booked-tours">
					<i class="material-icons">content_paste</i>
					<p>Booked Tours</p>
			</a></li>
		</ul>
	</div>
</div>