<div id="layoutSidenav_nav">
  <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
    <div class="sb-sidenav-menu">
      <div class="nav">
        <div class="sb-sidenav-menu-heading">Core</div>
        <a class="nav-link" href="${pageContext.request.contextPath}/admin">
          <div class="sb-nav-link-icon">
            <i class="fas fa-tachometer-alt"></i>
          </div>
          Dashboard
        </a>
        <div class="sb-sidenav-menu-heading">Interface</div>
        <a
          class="nav-link collapsed"
          href="#"
          data-toggle="collapse"
          data-target="#collapseLayouts"
          aria-expanded="false"
          aria-controls="collapseLayouts"
        >
          <div class="sb-nav-link-icon">
            <i class="fas fa-columns"></i>
          </div>
          Users
          <div class="sb-sidenav-collapse-arrow">
            <i class="fas fa-angle-down"></i>
          </div>
        </a>
        <div
          class="collapse"
          id="collapseLayouts"
          aria-labelledby="headingOne"
          data-parent="#sidenavAccordion"
        >
          <nav class="sb-sidenav-menu-nested nav">
            <a
              class="nav-link"
              href="#"
              >User List</a
            >
            <a
              class="nav-link"
              href="${pageContext.request.contextPath}/admin/user/add"
              >Add User</a
            >
          </nav>
        </div>
        <a
          class="nav-link collapsed"
          href="#"
          data-toggle="collapse"
          data-target="#collapsePages"
          aria-expanded="false"
          aria-controls="collapsePages"
        >
          <div class="sb-nav-link-icon">
            <i class="fas fa-book-open"></i>
          </div>
          Tours
          <div class="sb-sidenav-collapse-arrow">
            <i class="fas fa-angle-down"></i>
          </div>
        </a>
        <div
          class="collapse"
          id="collapsePages"
          aria-labelledby="headingTwo"
          data-parent="#sidenavAccordion"
        >
          <nav
            class="sb-sidenav-menu-nested nav accordion"
            id="sidenavAccordionPages"
          >
            <a
              class="nav-link collapsed"
              href="#"
              data-toggle="collapse"
              data-target="#pagesCollapseAuth"
              aria-expanded="false"
              aria-controls="pagesCollapseAuth"
            >
              Tour List
              <div class="sb-sidenav-collapse-arrow">
                <i class="fas fa-angle-down"></i>
              </div>
            </a>
          </nav>
        </div>
        <a
          class="nav-link collapsed"
          href="#"
          data-toggle="collapse"
          data-target="#collapseBookedTour"
          aria-expanded="false"
          aria-controls="collapseBookedTour"
        >
          <div class="sb-nav-link-icon">
            <i class="fas fa-book-open"></i>
          </div>
          Booked Tours
          <div class="sb-sidenav-collapse-arrow">
            <i class="fas fa-angle-down"></i>
          </div>
        </a>
        <div
          class="collapse"
          id="collapseBookedTour"
          aria-labelledby="headingTwo"
          data-parent="#sidenavAccordion"
        >
          <nav
            class="sb-sidenav-menu-nested nav accordion"
            id="sidenavAccordionPages"
          >
            <a
              class="nav-link"
              href="${pageContext.request.contextPath}/admin/booked-tour"
            >
              Booked Tour List
              <div class="sb-sidenav-collapse-arrow">
                <i class="fas fa-angle-down"></i>
              </div>
            </a>
            <a
              class="nav-link"
              href="${pageContext.request.contextPath}/admin/booked-tour/add"
            >
              Add Booked Tour
              <div class="sb-sidenav-collapse-arrow">
                <i class="fas fa-angle-down"></i>
              </div>
            </a>
          </nav>
        </div>

        <a
          class="nav-link collapsed"
          href="#"
          data-toggle="collapse"
          data-target="#collapseFeedback"
          aria-expanded="false"
          aria-controls="collapseFeedback"
        >
          <div class="sb-nav-link-icon">
            <i class="fas fa-book-open"></i>
          </div>
          Feedbacks
          <div class="sb-sidenav-collapse-arrow">
            <i class="fas fa-angle-down"></i>
          </div>
        </a>
        <div
          class="collapse"
          id="collapseFeedback"
          aria-labelledby="headingTwo"
          data-parent="#sidenavAccordion"
        >
          <nav
            class="sb-sidenav-menu-nested nav accordion"
            id="sidenavAccordionPages"
          >
            <a
              class="nav-link collapsed"
              href="${pageContext.request.contextPath}/admin/feedbacks"
              >Feedback List
              <div class="sb-sidenav-collapse-arrow">
                <i class="fas fa-angle-down"></i>
              </div>
            </a>
          </nav>
        </div>
      </div>
    </div>
  </nav>
</div>
