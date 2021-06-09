<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<footer
  class="footer p-5"
  style="
    background: url('${pageContext.request.contextPath}/resources/images/parallax-7.jpg');
  "
>
  <div class="container mt-5 mb-4">
    <div class="row justify-content-center align-items-end">
      <div class="col-5">
        <h3 class="fw-lighter fs-6">KEEP IN TOUCH</h3>
        <h2 class="fw-bolder fs-1 mb-0">Travel with Us</h2>
      </div>

      <form class="d-flex mb-1 col-4">
        <input placeholder="Email"   class="form-control me-2 rounded-pill p-2"
          type="text"
        />
        <button
          class="btn btn-info text-white rounded-pill pe-4 ps-4"
          type="submit"
        >
          SEND
        </button>
      </form>
    </div>
    <div class="row bg-white p-5 mt-5">
      <div class="col-5">
        <div class="d-flex align-items-center">
          <div class="me-3 footer__logo">
            <img
              src="${pageContext.request.contextPath}/resources/images/logo-color.png"
              alt="Levart logo"
              class="img-fluid"
            />
          </div>
          <h1 class="fw-bold">Levart</h1>
        </div>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ut
          diam et nibh condimentum venenatis eu ac magnasin. Quisque interdum
          est mauris, eget ullamcorper.
        </p>
        <div class="d-flex">
          <a href="https://twitter.com/" class="me-3"
            ><i class="fa fa-twitter footer__icon-social"></i
          ></a>
          <a href="https://www.youtube.com/" class="me-3"
            ><i class="fa fa-youtube footer__icon-social"></i
          ></a>
          <a href="https://www.facebook.com/" class="me-3"
            ><i class="fa fa-facebook-f footer__icon-social"></i
          ></a>
        </div>
      </div>
      <div class="col-3 ps-5">
        <h4>OUR AGENCY</h4>
        <ul class="footer__agency-link">
          <li><a href="#">Services</a></li>
          <li><a href="#">Insurancee</a></li>
          <li><a href="#">Agency</a></li>
          <li><a href="#">Tourism</a></li>
          <li><a href="#">Payment</a></li>
        </ul>
      </div>
      <div class="col-4">
        <h4>CONTACT</h4>
        <ul class="footer__contact">
          <li class="mt-3 d-flex align-items-center">
            <i class="fa fa-map-marker me-2 footer__contact-icon"></i>123 Levart
            Ho Chi Minh, Vietnam.
          </li>
          <li class="mt-3 d-flex align-items-center">
            <i class="fa fa-phone me-2 footer__contact-icon"></i>0123456789
          </li>
          <li class="mt-3 d-flex align-items-center">
            <i class="fa fa-envelope me-2 footer__contact-icon"></i
            >levart@gmail.com
          </li>
        </ul>
      </div>
    </div>
    <div class="bg-info text-center text-white p-3 footer__slogan">
      A NEW SKY, A NEW LIFE
    </div>
  </div>
</footer>
