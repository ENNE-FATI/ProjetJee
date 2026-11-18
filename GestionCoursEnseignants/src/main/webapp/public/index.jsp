<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">

<head>
  <meta charset="utf-8">
  <title>Educenter - Accueil</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Favicon -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/public/images/favicon.ico" type="image/x-icon">
  <link rel="icon" href="${pageContext.request.contextPath}/public/images/favicon.ico" type="image/x-icon">

  <!-- CSS (Chemins corrigés vers /public/) -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/public/plugins/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/public/plugins/slick/slick.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/public/plugins/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/public/plugins/animate/animate.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/public/plugins/aos/aos.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/public/plugins/venobox/venobox.css">
  <link href="${pageContext.request.contextPath}/public/css/style.css" rel="stylesheet">

  <style>
    .header { position: fixed !important; top: 0; width: 100%; z-index: 9999; background-color: #fff; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
    body { padding-top: 80px; }
    .btn-login { color: #333 !important; font-weight: 700; text-transform: uppercase; padding: 8px 15px !important; margin-left: 10px; transition: all 0.3s ease; }
    .btn-login:hover { color: #ffbc3b !important; background-color: transparent !important; text-decoration: underline; }

    /* Correction pour les images de fond */
    .bg-cover { background-size: cover !important; background-position: center center !important; background-repeat: no-repeat !important; }

    /* CORRECTION POUR LES IMAGES DES CARTES : Evite l'étirement moche */
    .card-img-top {
      height: 220px; /* Force une hauteur uniforme */
      object-fit: cover; /* Coupe l'image proprement pour remplir le cadre sans la déformer */
    }
    .about-img {
      height: 350px;
      object-fit: cover;
      width: 100%;
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
          <img src="${pageContext.request.contextPath}/public/images/logo.png" alt="logo" style="max-height: 50px;">
        </a>
        <button class="navbar-toggler rounded-0" type="button" data-toggle="collapse" data-target="#navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navigation">
          <ul class="navbar-nav ml-auto text-center align-items-center">
            <li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/public/index.jsp">Accueil</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/public/about.jsp">À propos</a></li>
            <li class="nav-item"><a class="nav-link" href="#courses-section">Cours</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/public/contact.jsp">Contact</a></li>
            <li class="nav-item"><a class="btn-login" href="${pageContext.request.contextPath}/public/login.jsp">Login</a></li>
          </ul>
        </div>
      </nav>
    </div>
  </div>
</header>

<!-- ================= SLIDER ================= -->
<section class="hero-section overlay bg-cover" style="background-image: url('${pageContext.request.contextPath}/public/images/banner/banner-1.jpg');">
  <div class="container">
    <div class="hero-slider">
      <div class="hero-slider-item">
        <div class="row">
          <div class="col-md-8">
            <h1 class="text-white" data-animation-out="fadeOutRight" data-delay-out="5" data-duration-in=".3" data-animation-in="fadeInLeft" data-delay-in=".1">Votre avenir radieux est notre mission</h1>
            <p class="text-white mb-4" data-animation-out="fadeOutRight" data-delay-out="5" data-duration-in=".3" data-animation-in="fadeInLeft" data-delay-in=".4">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
            <a href="${pageContext.request.contextPath}/public/contact.jsp" class="btn btn-primary" data-animation-out="fadeOutRight" data-delay-out="5" data-duration-in=".3" data-animation-in="fadeInLeft" data-delay-in=".7">S'inscrire</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- ================= BANNER FEATURE ================= -->
<section class="section-sm pb-0">
  <div class="container">
    <div class="row">
      <div class="col-md-4 mb-4">
        <div class="card border-0 text-center">
          <div class="card-body">
            <i class="ti-book text-primary h1"></i>
            <h5 class="mt-3">Cours de qualité</h5>
          </div>
        </div>
      </div>
      <div class="col-md-4 mb-4">
        <div class="card border-0 text-center">
          <div class="card-body">
            <i class="ti-medall text-primary h1"></i>
            <h5 class="mt-3">Professeurs experts</h5>
          </div>
        </div>
      </div>
      <div class="col-md-4 mb-4">
        <div class="card border-0 text-center">
          <div class="card-body">
            <i class="ti-desktop text-primary h1"></i>
            <h5 class="mt-3">Apprentissage en ligne</h5>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- ================= ABOUT ================= -->
<section class="section" id="about-section">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-md-6 order-2 order-md-1">
        <h2 class="section-title">À propos de Educenter</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
        <a href="${pageContext.request.contextPath}/public/about.jsp" class="btn btn-primary-outline">En savoir plus</a>
      </div>
      <div class="col-md-6 order-1 order-md-2 mb-4 mb-md-0">
        <img class="about-img" src="${pageContext.request.contextPath}/public/images/about/about-us.jpg" alt="about image">
      </div>
    </div>
  </div>
</section>

<!-- ================= COURSES ================= -->
<section class="section-sm" id="courses-section">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="d-flex align-items-center section-title justify-content-between">
          <h2 class="mb-0 text-nowrap mr-3">Nos Cours</h2>
          <div class="border-top w-100 border-primary d-none d-sm-block"></div>
        </div>
      </div>
    </div>
    <div class="row justify-content-center">
      <div class="col-lg-4 col-sm-6 mb-5">
        <div class="card p-0 border-primary rounded-0 hover-shadow">
          <img class="card-img-top rounded-0" src="${pageContext.request.contextPath}/public/images/courses/course-1.jpg" alt="course thumb">
          <div class="card-body">
            <a href="#"><h4 class="card-title">Photographie</h4></a>
            <p class="card-text mb-4">Lorem ipsum dolor sit amet.</p>
            <a href="#" class="btn btn-primary btn-sm">S'inscrire</a>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 mb-5">
        <div class="card p-0 border-primary rounded-0 hover-shadow">
          <img class="card-img-top rounded-0" src="${pageContext.request.contextPath}/public/images/courses/course-2.jpg" alt="course thumb">
          <div class="card-body">
            <a href="#"><h4 class="card-title">Programmation</h4></a>
            <p class="card-text mb-4">Lorem ipsum dolor sit amet.</p>
            <a href="#" class="btn btn-primary btn-sm">S'inscrire</a>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 mb-5">
        <div class="card p-0 border-primary rounded-0 hover-shadow">
          <img class="card-img-top rounded-0" src="${pageContext.request.contextPath}/public/images/courses/course-3.jpg" alt="course thumb">
          <div class="card-body">
            <a href="#"><h4 class="card-title">Design Graphique</h4></a>
            <p class="card-text mb-4">Lorem ipsum dolor sit amet.</p>
            <a href="#" class="btn btn-primary btn-sm">S'inscrire</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- ================= CTA ================= -->
<section class="section bg-primary">
  <div class="container">
    <div class="row">
      <div class="col-12 text-center">
        <h2 class="text-white mb-4">Prêt à commencer votre voyage éducatif ?</h2>
        <a href="${pageContext.request.contextPath}/public/contact.jsp" class="btn btn-light btn-lg">Contactez-nous</a>
      </div>
    </div>
  </div>
</section>

<!-- ================= SUCCESS STORY ================= -->
<section class="section">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 mx-auto text-center">
        <h2 class="section-title">Histoires de réussite</h2>
        <p class="lead">"Grâce à Educenter, j'ai pu acquérir les compétences nécessaires pour décrocher le job de mes rêves."</p>
        <h5 class="mt-4">- John Doe, Ancien Élève</h5>
      </div>
    </div>
  </div>
</section>

<!-- ================= EVENTS ================= -->
<section class="section bg-gray">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="d-flex align-items-center section-title justify-content-between">
          <h2 class="mb-0 text-nowrap mr-3">Événements à venir</h2>
          <div class="border-top w-100 border-primary d-none d-sm-block"></div>
        </div>
      </div>
    </div>
    <div class="row justify-content-center">
      <div class="col-lg-5 col-md-6 mb-4">
        <div class="card border-0 shadow-sm p-4 bg-white">
          <h5 class="card-title">Conférence Tech 2024</h5>
          <p class="text-muted small mb-2"><i class="ti-calendar mr-2"></i> 15 Octobre 2024</p>
          <p class="card-text">Rejoignez-nous pour une journée de conférences sur les dernières technologies.</p>
        </div>
      </div>
      <div class="col-lg-5 col-md-6 mb-4">
        <div class="card border-0 shadow-sm p-4 bg-white">
          <h5 class="card-title">Atelier de Design</h5>
          <p class="text-muted small mb-2"><i class="ti-calendar mr-2"></i> 22 Octobre 2024</p>
          <p class="card-text">Apprenez les bases du design UX/UI avec des professionnels du secteur.</p>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- ================= TEACHERS ================= -->
<section class="section">
  <div class="container">
    <div class="row">
      <div class="col-12 text-center mb-5">
        <h2 class="section-title">Nos Professeurs</h2>
      </div>
    </div>
    <div class="row justify-content-center">
      <div class="col-lg-3 col-sm-6 mb-4">
        <div class="card border-0 text-center">
          <img src="${pageContext.request.contextPath}/public/images/teachers/teacher-1.jpg" alt="teacher" class="card-img-top rounded-circle w-75 mx-auto mt-3" style="height: 200px; object-fit: cover;">
          <div class="card-body">
            <h5 class="card-title">Jane Doe</h5>
            <p class="text-muted small">Professeure de Mathématiques</p>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-sm-6 mb-4">
        <div class="card border-0 text-center">
          <img src="${pageContext.request.contextPath}/public/images/teachers/teacher-2.jpg" alt="teacher" class="card-img-top rounded-circle w-75 mx-auto mt-3" style="height: 200px; object-fit: cover;">
          <div class="card-body">
            <h5 class="card-title">John Smith</h5>
            <p class="text-muted small">Professeur d'Informatique</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- ================= BLOG ================= -->
<section class="section pt-0">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <h2 class="section-title">Dernières Nouvelles</h2>
      </div>
    </div>
    <div class="row justify-content-center">
      <div class="col-lg-4 col-sm-6 mb-4">
        <div class="card border-0 shadow-sm">
          <img src="${pageContext.request.contextPath}/public/images/blog/blog-1.jpg" class="card-img-top" alt="blog">
          <div class="card-body">
            <h5 class="card-title">Comment réussir ses examens ?</h5>
            <p class="card-text text-muted small">Conseils et astuces pour optimiser vos révisions.</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 mb-4">
        <div class="card border-0 shadow-sm">
          <img src="${pageContext.request.contextPath}/public/images/blog/blog-2.jpg" class="card-img-top" alt="blog">
          <div class="card-body">
            <h5 class="card-title">Les métiers de demain</h5>
            <p class="card-text text-muted small">Découvrez les secteurs qui recrutent le plus.</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- ================= FOOTER ================= -->
<footer>
  <div class="footer bg-footer section border-bottom">
    <div class="container">
      <div class="row">
        <div class="col-lg-4 col-sm-8 mb-5 mb-lg-0">
          <a class="logo-footer" href="${pageContext.request.contextPath}/public/index.jsp">
            <img class="img-fluid mb-4" src="${pageContext.request.contextPath}/public/images/logo.png" alt="logo" style="max-height: 50px;">
          </a>
          <p class="text-white-50">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
        </div>
      </div>
    </div>
  </div>
  <div class="copyright py-4 bg-dark text-center">
    <div class="container">
      <p class="mb-0 text-white-50">© 2024 Educenter. Tous droits réservés.</p>
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