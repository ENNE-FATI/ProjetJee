<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>About Us - ENSA</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Google Fonts for ENSA logo -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@800&display=swap" rel="stylesheet">

  <!-- Favicon -->
  <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/3309/3309804.png" type="image/x-icon">
  <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/3309/3309804.png" type="image/x-icon">

  <!-- CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/public/plugins/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/public/plugins/slick/slick.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/public/plugins/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/public/plugins/animate/animate.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/public/plugins/aos/aos.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/public/plugins/venobox/venobox.css">
  <link href="${pageContext.request.contextPath}/public/css/style.css" rel="stylesheet">

  <style>
    /* --- HEADER --- */
    .header { position: fixed !important; top: 0; width: 100%; z-index: 9999; background-color: #fff !important; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
    body { padding-top: 80px; }
    
    /* --- ENSA LOGO --- */
    .navbar-brand { 
        font-family: 'Montserrat', sans-serif;
        font-weight: 800; 
        font-size: 2.5rem;
        color: #ffbc3b !important; 
        text-transform: uppercase; 
        letter-spacing: 2px;
    }

    /* --- BUTTONS --- */
    .btn-login { color: #333 !important; font-weight: 700; text-transform: uppercase; padding: 8px 15px !important; margin-left: 10px; transition: all 0.3s ease; }
    .btn-login:hover { color: #ffbc3b !important; background-color: transparent !important; text-decoration: underline; }

    /* --- PAGE TITLE (Banner) --- */
    .page-title-section {
      position: relative;
      background-image: url('https://images.unsplash.com/photo-1541339907198-e08756dedf3f?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80'); 
      background-size: cover !important;
      background-position: center !important;
      background-repeat: no-repeat !important;
      padding: 120px 0 !important;
      display: flex;
      align-items: center;
    }
    
    /* Dark overlay */
    .page-title-section::before {
        content: "";
        position: absolute;
        top: 0; left: 0; right: 0; bottom: 0;
        background-color: rgba(0, 0, 0, 0.6);
        z-index: 1;
    }
    
    .page-title-section .container {
        position: relative;
        z-index: 2;
    }

    /* --- ABOUT IMAGE --- */
    .about-img-page {
      max-height: 450px;
      width: 100%;
      object-fit: cover;
      border-radius: 8px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    }

    /* --- FOOTER (Light) --- */
    footer {
        background-color: #f8f9fa; 
        border-top: 1px solid #e9ecef;
        color: #333;
        padding-top: 50px;
        margin-top: 50px;
    }
    .footer-container {
        max-width: 960px;
        margin: 0 auto;
    }
    .footer h2 {
        font-family: 'Montserrat', sans-serif;
        font-weight: 800;
        color: #ffbc3b;
        margin-bottom: 15px;
    }
    .footer h5 {
        color: #222;
        font-weight: 700;
    }
    .footer p, .footer a {
        color: #666;
        font-size: 0.9rem;
        text-decoration: none;
    }
    .footer a:hover {
        color: #ffbc3b;
    }
    .copyright {
        background-color: #fff;
        border-top: 1px solid #e9ecef;
        padding: 20px 0;
        margin-top: 40px;
    }
  </style>
</head>

<body>

<!-- ================= HEADER ================= -->
<header class="header">
  <div class="navigation w-100">
    <div class="container">
      <nav class="navbar navbar-expand-lg navbar-light p-0">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/public/index.jsp">
          ENSA
        </a>
        <button class="navbar-toggler rounded-0" type="button" data-toggle="collapse" data-target="#navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navigation">
          <ul class="navbar-nav ml-auto text-center align-items-center">
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/public/index.jsp">Home</a></li>
            <li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/public/about.jsp">About Us</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/public/index.jsp#courses-section">Courses</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/public/contact.jsp">Contact</a></li>
            <li class="nav-item"><a class="btn-login" href="${pageContext.request.contextPath}/public/login.jsp">Login</a></li>
          </ul>
        </div>
      </nav>
    </div>
  </div>
</header>
<!-- /header -->

<!-- ================= PAGE TITLE ================= -->
<section class="page-title-section">
  <div class="container">
    <div class="row">
      <div class="col-md-8">
        <ul class="list-inline custom-breadcrumb">
          <li class="list-inline-item"><a class="h2 text-primary font-secondary" href="${pageContext.request.contextPath}/public/about.jsp">About Us</a></li>
        </ul>
        <p class="text-lighten text-white">Our history, mission, and values.</p>
      </div>
    </div>
  </div>
</section>
<!-- /page title -->

<!-- ================= ABOUT ================= -->
<section class="section">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <!-- HD and sharp image -->
        <img class="img-fluid w-100 mb-5 about-img-page" src="https://images.unsplash.com/photo-1523240795612-9a054b0db644?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80" alt="about image">

        <h2 class="section-title">OUR STORY</h2>
        <p class="lead">ENSA (National School of Applied Sciences) is a higher education institution dedicated to training high-level engineers.</p>
        <p>Since our creation, we have been committed to providing an education of excellence, combining theory and practice. Our programs are designed to meet current and future technological and industrial challenges.</p>
        <p>We believe in innovation, applied research, and openness to the world. Our students benefit from quality supervision and modern infrastructure to develop their full potential and become the leaders of tomorrow.</p>
      </div>
    </div>
  </div>
</section>
<!-- /about -->

<!-- ================= FOOTER ================= -->
<footer>
  <div class="footer-container container">
    <div class="row text-center text-md-left">
        <!-- Logo & Description -->
        <div class="col-md-6 mb-4 mb-md-0">
          <h2>ENSA</h2>
          <p>Empowering students to achieve their dreams through quality education and innovation.</p>
        </div>
        <!-- Quick Links -->
        <div class="col-md-3 mb-4 mb-md-0">
            <h5 class="mb-3">Quick Links</h5>
            <ul class="list-unstyled">
                <li><a href="${pageContext.request.contextPath}/public/index.jsp">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/public/about.jsp">About Us</a></li>
                <li><a href="${pageContext.request.contextPath}/public/index.jsp#courses-section">Courses</a></li>
            </ul>
        </div>
        <!-- Contact -->
        <div class="col-md-3">
            <h5 class="mb-3">Contact</h5>
            <p class="mb-1">contact@ensa.edu</p>
            <p>+1 234 567 890</p>
        </div>
    </div>
  </div>
  
  <div class="copyright text-center">
    <div class="container">
      <p class="mb-0 text-muted">© 2024 ENSA. All Rights Reserved.</p>
    </div>
  </div>
</footer>

<!-- ================= SCRIPTS ================= -->
<script src="${pageContext.request.contextPath}/public/plugins/jQuery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/public/plugins/bootstrap/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/public/plugins/slick/slick.min.js"></script>
<script src="${pageContext.request.contextPath}/public/plugins/aos/aos.js"></script>
<script src="${pageContext.request.contextPath}/public/plugins/venobox/venobox.min.js"></script>
<script src="${pageContext.request.contextPath}/public/js/script.js"></script>

<script>
  if(typeof AOS !== 'undefined') {
    AOS.init();
  }
</script>
</body>
</html>