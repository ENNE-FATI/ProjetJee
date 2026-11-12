<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
  <meta charset="utf-8">
  <title>Login - Educenter</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <!-- CSS -->
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
    .btn-login {
      color: #333 !important;
      font-weight: 600;
      text-transform: uppercase;
      padding: 8px 15px !important;
      margin-left: 10px;
      transition: color 0.3s ease;
    }
    .btn-login:hover {
      color: #ffbc3b !important;
      text-decoration: none;
    }
    .login-card {
        background: #fff;
        padding: 40px;
        border-radius: 10px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        margin-top: 50px;
    }
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
            <li class="nav-item"><a class="nav-link" href="about.jsp">À propos</a></li>
            <li class="nav-item"><a class="nav-link" href="index.jsp#courses-section">Cours</a></li>
            <li class="nav-item"><a class="nav-link" href="index.jsp#contact-section">Contact</a></li>
            <li class="nav-item"><a class="btn-login text-warning" href="login.jsp">Login</a></li>
          </ul>
        </div>
      </nav>
    </div>
  </div>
</header>
<!-- /header -->

<!-- Login Form -->
<section class="section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="login-card">
                    <div class="text-center mb-4">
                        <h3 class="mb-2">Welcome Back!</h3>
                        <p class="text-muted">Please login to your account</p>
                    </div>

                    <!-- Formulaire envoyant les données au Servlet /login -->
                    <form action="${pageContext.request.contextPath}/login" method="POST">
                        <div class="form-group mb-3">
                            <label for="username">Email Address</label>
                            <input type="email" class="form-control" id="username" name="username" placeholder="example@kiaalap.edu" required>
                        </div>
                        <div class="form-group mb-4">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block w-100">Sign In</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- footer -->
<footer>
  <div class="footer bg-footer section border-bottom">
    <div class="container">
      <div class="row">
        <div class="col-lg-4 col-sm-8 mb-5 mb-lg-0">
          <a class="logo-footer" href="index.jsp"><img class="img-fluid mb-4" src="images/logo.png" alt="logo"></a>
        </div>
      </div>
    </div>
  </div>
</footer>

<!-- JS -->
<script src="plugins/jQuery/jquery.min.js"></script>
<script src="plugins/bootstrap/bootstrap.min.js"></script>
<script src="plugins/slick/slick.min.js"></script>
<script src="plugins/aos/aos.js"></script>
<script src="plugins/venobox/venobox.min.js"></script>
<script src="js/script.js"></script>

</body>
</html>