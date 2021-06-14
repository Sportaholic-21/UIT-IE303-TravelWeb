<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-expand-lg text-white">
  <div class="container-xxl">
    <a class="ms-5 navbar-brand d-flex align-items-center" href="${pageContext.request.contextPath}/home">
      <div class="navbar__logo--img me-3">
        <img
          src="${pageContext.request.contextPath}/resources/images/logo.png"
          alt="Levart logo"
          class="img-fluid"
        />
      </div>
      <h1 class="fw-bold">Levart</h1>
    </a>
    <button
      class="navbar-toggler"
      type="button"
      data-bs-toggle="collapse"
      data-bs-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto me-auto mb-lg-0 text-uppercase">
     
        <li class="nav-item me-4 li-nav">
          <a class="nav-link active a-nav " aria-current="page" href="${pageContext.request.contextPath}/home" style="color: white">Home</a>
        </li>
        
        <li class="nav-item me-4 li-nav">
          <a class="nav-link a-nav" href="${pageContext.request.contextPath}/all-tours" style="color: white">All Tours</a>
        </li>
        
        <li class="nav-item me-4 dropdown li-nav">
          <a
            class="nav-link dropdown-toggle a-nav"
            href="#"
            id="navbarDropdown"
            role="button"
            data-bs-toggle="dropdown"
            aria-expanded="false"
          style="color: white">
            Tour Types
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/tour-list?typologyID=1">Relax</a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/tour-list?typologyID=2">Cultural</a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/tour-list?typologyID=3">Adventure</a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/tour-list?typologyID=4">History</a></li>
          </ul>
        </li>

        <li class="nav-item me-4 li-nav">
          <a class="nav-link a-nav" href="${pageContext.request.contextPath}/about" style="color: white">About us</a>
        </li>

        <li class="nav-item ms-2 li-nav">
          <a class="nav-link a-nav" href="${pageContext.request.contextPath}/contact" style="color: white">Contact</a>
        </li>
      </ul>

      <ul class="navbar-nav mb-2 mb-lg-0 align-items-center">
      	<li class="nav-item mr-3">
      		<a href="${pageContext.request.contextPath}/wishlist"><i class="fas fa-heart fs-4" style="color: white"><span id="wishListNum" class="whilist-number" style="color: white">${wishListNum > 0 ? wishListNum : 0}</span></i></a>
      	</li>
        <li class="nav-item li-nav">
        <% if (request.getAttribute("username") == null) {%>
          <a class="nav-link text-uppercase a-nav" href="${pageContext.request.contextPath}/sign-in" style="color: white">Sign in</a>
        <% } else {%>
          <div class="collapse navbar-collapse justify-content-end">
			<ul class="navbar-nav">
				<li class="nav-item dropdown"><a class="nav-link"
					href="javascript:;" id="navbarDropdownProfile"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: white">
					${username}
				</a>
					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="navbarDropdownProfile">
						<a class="dropdown-item" href="${pageContext.request.contextPath}/${account.username}">Overview</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/user?tab=profile">Setting</a>
						<c:choose>
			              	<c:when test="${account.accountRole == 0}">
			              		<a class="dropdown-item" href="${pageContext.request.contextPath}/admin">Admin Dashboard</a>
			              	</c:when>
			              </c:choose>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" id="signOut">Log out</a>
					</div></li>
			</ul>
		</div>
        <% }%>
        </li>
          
        <li class="nav-item" id="sidebar-menu">
          <div class="me-5 ms-3 nav__menu-img">
            <img
              src="${pageContext.request.contextPath}/resources/images/menu.png"
              alt="Levart menu icon"
              class="img-fluid"
            />
          </div>
        </li>
      </ul>
    </div>
  </div>
  <script type="text/javascript">
  var url=window.location.pathname;
  var li_list=document.querySelectorAll(".li-nav");
  var a_list=document.querySelectorAll(".a-nav");
  if (url==a_list[0].pathname) li_list[0].classList.add("li-active")
  else if(url==a_list[1].pathname) li_list[1].classList.add("li-active")
  else if(url==a_list[3].pathname) li_list[3].classList.add("li-active")
  else if(url==a_list[4].pathname) li_list[4].classList.add("li-active")
  else if(url==a_list[5].pathname) li_list[5].classList.add("li-active")
  else if(url.slice(0,-2)=="${pageContext.request.contextPath}/tour-detail") li_list[1].classList.add("li-active")
   else if(url==a_list[2].pathname) li_list[2].classList.add("li-active")
  </script>
</nav>
