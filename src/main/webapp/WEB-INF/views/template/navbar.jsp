<nav class="navbar navbar-expand-lg text-white position-absolute">
  <div class="container-xxl">
    <a class="ms-5 navbar-brand d-flex align-items-center" href="home">
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
        <li class="nav-item me-4">
          <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/home">Home</a>
        </li>
        <li class="nav-item me-4 dropdown">
          <a
            class="nav-link dropdown-toggle"
            href="#"
            id="navbarDropdown"
            role="button"
            data-bs-toggle="dropdown"
            aria-expanded="false"
          >
            Tour Types
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="tour-list">Relax</a></li>
            <li><a class="dropdown-item" href="tour-list">Sport</a></li>
            <li><a class="dropdown-item" href="tour-list">Cutural</a></li>
            <li><a class="dropdown-item" href="tour-list">History</a></li>
          </ul>
        </li>

        <li class="nav-item me-4">
          <a class="nav-link" href="${pageContext.request.contextPath}/about-us">About us</a>
        </li>

        <li class="nav-item me-4">
          <a class="nav-link" href="${pageContext.request.contextPath}/forum">Forum</a>
        </li>

        <li class="nav-item ms-2">
          <a class="nav-link nav__cta rounded-pill nav__contact-link" href="${pageContext.request.contextPath}/contact">Contact</a>
        </li>
      </ul>

      <ul class="navbar-nav mb-2 mb-lg-0 align-items-center">
        <li class="nav-item">
        <% if (request.getAttribute("username") == null) {%>
          <a class="nav-link text-uppercase" href="${pageContext.request.contextPath}/sign-in">Sign in</a>
        <% } else {%>
          <a class="nav-link" href="${pageContext.request.contextPath}/user?tab=profile">${username}</a>
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
</nav>
