<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
  <meta charset="utf-8">
  <title>Contact Us - Educenter</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="plugins/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="plugins/slick/slick.css">
  <link rel="stylesheet" href="plugins/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="plugins/animate/animate.css">
  <link rel="stylesheet" href="plugins/aos/aos.css">
  <link rel="stylesheet" href="plugins/venobox/venobox.css">
  <link href="css/style.css" rel="stylesheet">
  <style>
    .btn-login { background-color: #4125dd; color: white !important; border-radius: 5px; padding: 8px 20px !important; margin-left: 15px; font-weight: 600; }
    .btn-login:hover { background-color: #311aa8; }
  </style>
</head>

<body>
  
<!-- header -->
<header class="fixed-top header">
  <div class="navigation w-100">
    <div class="container">
      <nav class="navbar navbar-expand-lg navbar-light p-0">
        <a class="navbar-brand" href="index.jsp"><img src="images/logo.png" alt="logo"></a>
        <button class="navbar-toggler rounded-0" type="button" data-toggle="collapse" data-target="#navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navigation">
          <ul class="navbar-nav ml-auto text-center align-items-center">
            <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
            <li class="nav-item"><a class="nav-link" href="#">COURSES</a></li>
            <li class="nav-item"><a class="nav-link" href="#">EVENTS</a></li>
            <li class="nav-item"><a class="nav-link" href="#">BLOG</a></li>
            <li class="nav-item active"><a class="nav-link" href="contact.jsp">CONTACT</a></li>
            <li class="nav-item"><a class="btn btn-login" href="login.jsp">Login</a></li>
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
          <li class="list-inline-item"><a class="h2 text-primary font-secondary" href="contact.jsp">Contact Us</a></li>
        </ul>
        <p class="text-lighten">Do you have any questions? Please do not hesitate to contact us directly. Our team will come back to you within a matter of hours to help you.</p>
      </div>
    </div>
  </div>
</section>
<!-- /page title -->

<!-- contact -->
<section class="section">
  <div class="container">
    <div class="row">
      <div class="col-md-5 mb-4 mb-md-0">
        <p class="mb-0">University Address:</p>
        <h5 class="mb-3">23621 15 Mile Rd #C104, Clinton MI, 48035, New York, USA</h5>
        <p class="mb-0">Phone Number:</p>
        <h5 class="mb-3">+1 (2) 345 6789</h5>
        <p class="mb-0">Email Address:</p>
        <h5 class="mb-3">contact@yourdomain.com</h5>
      </div>
      <div class="col-md-7">
        <form action="#" class="row">
          <div class="col-12">
            <input type="text" class="form-control mb-3" id="name" name="name" placeholder="Your Name">
          </div>
          <div class="col-12">
            <input type="email" class="form-control mb-3" id="email" name="email" placeholder="Your Email">
          </div>
          <div class="col-12">
            <input type="text" class="form-control mb-3" id="subject" name="subject" placeholder="Subject">
          </div>
          <div class="col-12">
            <textarea name="message" id="message" class="form-control mb-3" placeholder="Your Message"></textarea>
          </div>
          <div class="col-12">
            <button type="submit" class="btn btn-primary">Send Message</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</section>
<!-- /contact -->

<!-- footer -->
<footer>
  <div class="footer bg-footer section border-bottom">
    <div class="container">
      <div class="row">
        <div class="col-lg-4 col-sm-8 mb-5 mb-lg-0">
          <a class="logo-footer" href="index.jsp"><img class="img-fluid mb-4" src="images/logo.png" alt="logo"></a>
          <ul class="list-unstyled">
            <li class="mb-2">23621 15 Mile Rd #C104, Clinton MI, 48035, New York, USA</li>
            <li class="mb-2">+1 (2) 345 6789</li>
            <li class="mb-2">contact@yourdomain.com</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</footer>
<!-- /footer -->

<script src="plugins/jQuery/jquery.min.js"></script>
<script src="plugins/bootstrap/bootstrap.min.js"></script>
<script src="plugins/slick/slick.min.js"></script>
<script src="plugins/aos/aos.js"></script>
<script src="plugins/venobox/venobox.min.js"></script>
<script src="js/script.js"></script>

</body>
</html>