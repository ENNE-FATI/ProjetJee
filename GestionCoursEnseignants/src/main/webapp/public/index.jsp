<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>ENSA - Home</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@800&display=swap" rel="stylesheet">

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
    /* --- HEADER (Correction du fond blanc) --- */
    .header { 
        position: fixed !important; 
        top: 0; 
        width: 100%; 
        z-index: 9999; 
        background-color: #fff !important; /* Force le blanc */
        box-shadow: 0 2px 10px rgba(0,0,0,0.1); 
    }
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

    /* --- HERO SECTION (Image en HTML) --- */
    .hero-section {
        position: relative;
        min-height: 600px;
        display: flex;
        align-items: center;
        background-color: #222; /* Couleur de fond si l'image bug */
    }
    
    /* Image d'arrière-plan forcée */
    .hero-img {
        position: absolute;
        top: 0; left: 0; 
        width: 100%; height: 100%;
        object-fit: cover;
        z-index: 1;
    }
    
    /* Voile sombre pour lire le texte */
    .hero-overlay {
        position: absolute;
        top: 0; left: 0; right: 0; bottom: 0;
        background: rgba(0, 0, 0, 0.6);
        z-index: 2;
    }
    
    /* Contenu au-dessus de l'image */
    .hero-content {
        position: relative;
        z-index: 3;
        color: white;
        padding: 50px 0;
    }

    /* --- BOUTONS --- */
    .btn-login { color: #333 !important; font-weight: 700; text-transform: uppercase; padding: 8px 15px !important; margin-left: 10px; transition: all 0.3s ease; }
    .btn-login:hover { color: #ffbc3b !important; background-color: transparent !important; text-decoration: underline; }

    /* --- FOOTER --- */
    footer { background-color: #f8f9fa; border-top: 1px solid #e9ecef; color: #333; padding-top: 50px; margin-top: 50px; }
    .footer-container { max-width: 960px; margin: 0 auto; }
    .footer h2 { font-family: 'Montserrat', sans-serif; font-weight: 800; color: #ffbc3b; margin-bottom: 15px; }
    .footer h5 { color: #222; font-weight: 700; }
    .footer p, .footer a { color: #666; font-size: 0.9rem; text-decoration: none; }
    .footer a:hover { color: #ffbc3b; }
    .copyright { background-color: #fff; border-top: 1px solid #e9ecef; padding: 20px 0; margin-top: 40px; }
    
    /* Images des cartes */
    .card-img-top { height: 220px; object-fit: cover; }
  </style>
</head>

<body>

<!-- ================= HEADER ================= -->
<header class="header">
  <div class="navigation w-100">
    <div class="container">
      <nav class="navbar navbar-expand-lg navbar-light p-0">
        <a class="navbar-brand" href="#">ENSA</a>
        <button class="navbar-toggler rounded-0" type="button" data-toggle="collapse" data-target="#navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navigation">
          <ul class="navbar-nav ml-auto text-center align-items-center">
            <li class="nav-item active"><a class="nav-link" href="#">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/public/about.jsp">About Us</a></li>
            <li class="nav-item"><a class="nav-link" href="#courses-section">Courses</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/public/contact.jsp">Contact</a></li>
            <li class="nav-item"><a class="btn-login" href="#">Login</a></li>
          </ul>
        </div>
      </nav>
    </div>
  </div>
</header>

<!-- ================= HERO SECTION ================= -->
<section class="hero-section">
  <!-- 1. L'image est chargée en HTML directement -->
  <img src="https://images.unsplash.com/photo-1523050854058-8df90110c9f1?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80" alt="Campus ENSA" class="hero-img">
  
  <!-- 2. Le voile sombre -->
  <div class="hero-overlay"></div>
  
  <!-- 3. Le texte -->
  <div class="container hero-content">
    <div class="row">
      <div class="col-md-8">
        <h1 class="text-white mb-4" style="font-weight: 800; text-shadow: 2px 2px 4px rgba(0,0,0,0.5);">Your Bright Future is Our Mission</h1>
        <p class="text-white lead mb-5" style="text-shadow: 1px 1px 2px rgba(0,0,0,0.5);">Join ENSA to acquire the necessary skills and excel in the world of engineering.</p>
        <a href="${pageContext.request.contextPath}/public/contact.jsp" class="btn btn-primary btn-lg">Apply Now</a>
      </div>
    </div>
  </div>
</section>

<!-- ================= FEATURES ================= -->
<section class="section-sm py-5">
  <div class="container">
    <div class="row">
      <div class="col-md-4 mb-4">
        <div class="card border-0 text-center shadow-sm p-4">
          <i class="ti-book text-primary" style="font-size: 3rem;"></i>
          <h5 class="mt-3">Quality Courses</h5>
        </div>
      </div>
      <div class="col-md-4 mb-4">
        <div class="card border-0 text-center shadow-sm p-4">
          <i class="ti-medall text-primary" style="font-size: 3rem;"></i>
          <h5 class="mt-3">Expert Teachers</h5>
        </div>
      </div>
      <div class="col-md-4 mb-4">
        <div class="card border-0 text-center shadow-sm p-4">
          <i class="ti-desktop text-primary" style="font-size: 3rem;"></i>
          <h5 class="mt-3">Online Learning</h5>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- ================= COURSES ================= -->
<section class="section" id="courses-section">
  <div class="container">
    <div class="row mb-5">
      <div class="col-12">
        <h2 class="section-title">Our Courses</h2>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-4 col-md-6 mb-4">
        <div class="card border-0 shadow-sm h-100">
          <img class="card-img-top" src="https://images.unsplash.com/photo-1516035069371-29a1b244cc32?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" alt="Photography">
          <div class="card-body">
            <h4 class="card-title">Photography</h4>
            <p class="card-text text-muted">Master the art of visual storytelling.</p>
            <a href="#" class="btn btn-primary btn-sm">Enroll</a>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-6 mb-4">
        <div class="card border-0 shadow-sm h-100">
          <img class="card-img-top" src="https://images.unsplash.com/photo-1555066931-4365d14bab8c?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" alt="Programming">
          <div class="card-body">
            <h4 class="card-title">Programming</h4>
            <p class="card-text text-muted">Learn to build software and applications.</p>
            <a href="#" class="btn btn-primary btn-sm">Enroll</a>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-6 mb-4">
        <div class="card border-0 shadow-sm h-100">
          <img class="card-img-top" src="https://images.unsplash.com/photo-1561070791-2526d30994b5?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" alt="Graphic Design">
          <div class="card-body">
            <h4 class="card-title">Graphic Design</h4>
            <p class="card-text text-muted">Create stunning visuals and interfaces.</p>
            <a href="#" class="btn btn-primary btn-sm">Enroll</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- ================= CTA ================= -->
<section class="section bg-primary text-center text-white py-5">
  <div class="container">
    <h2 class="mb-4 text-white">Ready to Start Your Educational Journey?</h2>
    <a href="${pageContext.request.contextPath}/public/contact.jsp" class="btn btn-light btn-lg">Contact Us</a>
  </div>
</section>

<!-- ================= FOOTER ================= -->
<footer>
  <div class="footer-container container">
    <div class="row text-center text-md-left">
        <div class="col-md-6 mb-4 mb-md-0">
          <h2>ENSA</h2>
          <p>Empowering students to achieve their dreams through quality education and innovation.</p>
        </div>
        <div class="col-md-3 mb-4 mb-md-0">
            <h5 class="mb-3">Quick Links</h5>
            <ul class="list-unstyled">
                <li><a href="#">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/public/about.jsp">About Us</a></li>
                <li><a href="#courses-section">Courses</a></li>
            </ul>
        </div>
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
</body>
</html>