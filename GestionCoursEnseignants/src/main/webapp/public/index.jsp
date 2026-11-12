<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
  <meta charset="utf-8">
  <title>Educenter - Home</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="plugins/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="plugins/slick/slick.css">
  <link rel="stylesheet" href="plugins/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="plugins/animate/animate.css">
  <link rel="stylesheet" href="plugins/aos/aos.css">
  <link rel="stylesheet" href="plugins/venobox/venobox.css">
  <link href="css/style.css" rel="stylesheet">
  <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
  <link rel="icon" href="images/favicon.ico" type="image/x-icon">

  <style>
    .header { position: fixed !important; top: 0; width: 100%; z-index: 9999; background-color: #fff; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
    body { padding-top: 80px; }
    .btn-login {
      color: #333 !important;
      font-weight: 700;
      text-transform: uppercase;
      padding: 8px 15px !important;
      margin-left: 10px;
      transition: all 0.3s ease;
    }
    .btn-login:hover {
      color: #ffbc3b !important;
      background-color: transparent !important;
      text-decoration: underline;
    }
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
            <li class="nav-item active"><a class="nav-link" href="index.jsp">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
            <li class="nav-item"><a class="nav-link" href="#courses-section">Courses</a></li>
            <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
            <li class="nav-item"><a class="btn-login" href="login.jsp">Login</a></li>
          </ul>
        </div>
      </nav>
    </div>
  </div>
</header>
<!-- /header -->

<!-- hero slider -->
<section class="hero-section overlay bg-cover" data-background="images/banner/banner-1.jpg">
  <div class="container">
    <div class="hero-slider">
      <div class="hero-slider-item">
        <div class="row">
          <div class="col-md-8">
            <h1 class="text-white" data-animation-out="fadeOutRight" data-delay-out="5" data-duration-in=".3" data-animation-in="fadeInLeft" data-delay-in=".1">Your bright future is our mission</h1>
            <p class="text-muted mb-4" data-animation-out="fadeOutRight" data-delay-out="5" data-duration-in=".3" data-animation-in="fadeInLeft" data-delay-in=".4">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
            <a href="contact.jsp" class="btn btn-primary" data-animation-out="fadeOutRight" data-delay-out="5" data-duration-in=".3" data-animation-in="fadeInLeft" data-delay-in=".7">Apply now</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- /hero slider -->

<!-- about us -->
<section class="section" id="about-section">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-md-6 order-2 order-md-1">
        <h2 class="section-title">About Educenter</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
        <a href="about.jsp" class="btn btn-primary-outline">Learn more</a>
      </div>
      <div class="col-md-6 order-1 order-md-2 mb-4 mb-md-0">
        <img class="img-fluid w-100" src="images/about/about-us.jpg" alt="about image">
      </div>
    </div>
  </div>
</section>
<!-- /about us -->

<!-- courses -->
<section class="section-sm" id="courses-section">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="d-flex align-items-center section-title justify-content-between">
          <h2 class="mb-0 text-nowrap mr-3">Our Course</h2>
          <div class="border-top w-100 border-primary d-none d-sm-block"></div>
        </div>
      </div>
    </div>
    <div class="row justify-content-center">
      <div class="col-lg-4 col-sm-6 mb-5">
        <div class="card p-0 border-primary rounded-0 hover-shadow">
          <img class="card-img-top rounded-0" src="images/courses/course-1.jpg" alt="course thumb">
          <div class="card-body">
            <a href="#"><h4 class="card-title">Photography</h4></a>
            <p class="card-text mb-4">Lorem ipsum dolor sit amet.</p>
            <a href="#" class="btn btn-primary btn-sm">Apply now</a>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 mb-5">
        <div class="card p-0 border-primary rounded-0 hover-shadow">
          <img class="card-img-top rounded-0" src="images/courses/course-2.jpg" alt="course thumb">
          <div class="card-body">
            <a href="#"><h4 class="card-title">Programming</h4></a>
            <p class="card-text mb-4">Lorem ipsum dolor sit amet.</p>
            <a href="#" class="btn btn-primary btn-sm">Apply now</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- /courses -->

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