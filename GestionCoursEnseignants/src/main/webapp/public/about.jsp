<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
  <meta charset="utf-8">
  <title>About Us - Educenter</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="plugins/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="plugins/slick/slick.css">
  <link rel="stylesheet" href="plugins/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="plugins/animate/animate.css">
  <link rel="stylesheet" href="plugins/aos/aos.css">
  <link rel="stylesheet" href="plugins/venobox/venobox.css">
  <link href="css/style.css" rel="stylesheet">
  
  <style>
    .header { position: fixed !important; top: 0; width: 100%; z-index: 9999; background-color: #fff; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
    body { padding-top: 80px; }
    .btn-login { color: #333 !important; font-weight: 700; text-transform: uppercase; padding: 8px 15px !important; margin-left: 10px; transition: all 0.3s ease; }
    .btn-login:hover { color: #ffbc3b !important; background-color: transparent !important; text-decoration: underline; }
  </style>
</head>

<body>
  
<!-- header -->
<header class="header">
  <div class="navigation w-100">
    <div class="container">
      <nav class="navbar navbar-expand-lg navbar-light p-0">
        <a class="navbar-brand" href="index.jsp"><img src="images/logo.png" alt="logo" style="max-height: 50px;"></a>
        <button class="navbar-toggler rounded-0" type="button" data-toggle="collapse" data-target="#navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navigation">
          <ul class="navbar-nav ml-auto text-center align-items-center">
            <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
            <li class="nav-item active"><a class="nav-link" href="about.jsp">About</a></li>
            <li class="nav-item"><a class="nav-link" href="index.jsp#courses-section">Courses</a></li>
            <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
            <li class="nav-item"><a class="btn-login" href="login.jsp">Login</a></li>
          </ul>
        </div>
      </nav>
    </div>
  </div>
</header>
<!-- /header -->

<!-- page title -->
<section class="page-title-section overlay" data-background="images/backgrounds/page-title.jpg">
  <div class="container">
    <div class="row">
      <div class="col-md-8">
        <ul class="list-inline custom-breadcrumb">
          <li class="list-inline-item"><a class="h2 text-primary font-secondary" href="about.jsp">About Us</a></li>
        </ul>
        <p class="text-lighten">Notre histoire, notre mission et nos valeurs.</p>
      </div>
    </div>
  </div>
</section>
<!-- /page title -->

<!-- about -->
<section class="section">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <img class="img-fluid w-100 mb-4" src="images/about/about-page.jpg" alt="about image">
        <h2 class="section-title">NOTRE HISTOIRE</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et.dolore magna aliqua. Ut enim ad minim veniam, quis nostrud. Lorem ipsum dolor sit amet consectetur, adipisicing elit.</p>
      </div>
    </div>
  </div>
</section>
<!-- /about -->

<!-- footer -->
<footer>
  <div class="footer bg-footer section border-bottom">
    <div class="container">
      <div class="row">
        <div class="col-lg-4 col-sm-8 mb-5 mb-lg-0">
          <a class="logo-footer" href="index.jsp"><img class="img-fluid mb-4" src="images/logo.png" alt="logo" style="max-height: 50px;"></a>
        </div>
      </div>
    </div>
  </div>
</footer>

<script src="plugins/jQuery/jquery.min.js"></script>
<script src="plugins/bootstrap/bootstrap.min.js"></script>
<script src="plugins/slick/slick.min.js"></script>
<script src="plugins/aos/aos.js"></script>
<script src="plugins/venobox/venobox.min.js"></script>
<script src="js/script.js"></script>

</body>
</html>