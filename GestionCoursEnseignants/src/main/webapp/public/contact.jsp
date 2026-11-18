<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">

<head>
  <meta charset="utf-8">
  <title>Contactez-nous - Educenter</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

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

    /* Correction pour l'image de fond de la bannière */
    .page-title-section {
      background-size: cover !important;
      background-position: center !important;
      background-repeat: no-repeat !important;
      padding: 100px 0 !important;
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
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/public/index.jsp">Accueil</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/public/about.jsp">À propos</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/public/index.jsp#courses-section">Cours</a></li>
            <li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/public/contact.jsp">Contact</a></li>
            <li class="nav-item"><a class="btn-login" href="${pageContext.request.contextPath}/public/login.jsp">Login</a></li>
          </ul>
        </div>
      </nav>
    </div>
  </div>
</header>
<!-- /header -->

<!-- ================= PAGE TITLE ================= -->
<!-- Image de fond corrigée -->
<section class="page-title-section overlay" style="background-image: url('${pageContext.request.contextPath}/public/images/backgrounds/page-title.jpg');">
  <div class="container">
    <div class="row">
      <div class="col-md-8">
        <ul class="list-inline custom-breadcrumb">
          <li class="list-inline-item"><a class="h2 text-primary font-secondary" href="${pageContext.request.contextPath}/public/contact.jsp">Contactez-nous</a></li>
        </ul>
        <p class="text-lighten">Avez-vous des questions ? N'hésitez pas à nous contacter directement.</p>
      </div>
    </div>
  </div>
</section>
<!-- /page title -->

<!-- ================= CONTACT ================= -->
<section class="section">
  <div class="container">
    <div class="row">
      <div class="col-md-5 mb-4 mb-md-0">
        <p class="mb-0">Adresse de l'Université :</p>
        <h5 class="mb-3">23621 15 Mile Rd #C104, Clinton MI, 48035, New York, USA</h5>
        <p class="mb-0">Numéro de téléphone :</p>
        <h5 class="mb-3">+1 (2) 345 6789</h5>
        <p class="mb-0">Adresse Email :</p>
        <h5 class="mb-3">contact@yourdomain.com</h5>
      </div>
      <div class="col-md-7">
        <!-- Vous pouvez ajouter action="votre-servlet" si vous voulez traiter le formulaire -->
        <form action="#" class="row">
          <div class="col-12">
            <input type="text" class="form-control mb-3" id="name" name="name" placeholder="Votre Nom" required>
          </div>
          <div class="col-12">
            <input type="email" class="form-control mb-3" id="email" name="email" placeholder="Votre Email" required>
          </div>
          <div class="col-12">
            <input type="text" class="form-control mb-3" id="subject" name="subject" placeholder="Sujet" required>
          </div>
          <div class="col-12">
            <textarea name="message" id="message" class="form-control mb-3" placeholder="Votre Message" rows="5" required></textarea>
          </div>
          <div class="col-12">
            <button type="submit" class="btn btn-primary">Envoyer le message</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</section>
<!-- /contact -->

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
<!-- Scripts corrigés avec /public/ -->
<script src="${pageContext.request.contextPath}/public/plugins/jQuery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/public/plugins/bootstrap/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/public/plugins/slick/slick.min.js"></script>
<script src="${pageContext.request.contextPath}/public/plugins/aos/aos.js"></script>
<script src="${pageContext.request.contextPath}/public/plugins/venobox/venobox.min.js"></script>
<script src="${pageContext.request.contextPath}/public/js/script.js"></script>

</body>
</html>