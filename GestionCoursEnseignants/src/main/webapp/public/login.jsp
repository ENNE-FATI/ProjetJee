<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Login - ENSA</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Google Fonts for ENSA logo -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@800&display=swap" rel="stylesheet">

    <!-- Favicon -->
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/3309/3309804.png" type="image/x-icon">
    <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/3309/3309804.png" type="image/x-icon">

    <!-- CSS -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/public/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/public/plugins/slick/slick.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/public/plugins/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/public/plugins/animate/animate.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/public/plugins/aos/aos.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/public/plugins/venobox/venobox.css">
    <link href="<%= request.getContextPath() %>/public/css/style.css" rel="stylesheet">

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

        /* --- LOGIN SECTION BACKGROUND (Même image que l'inscription) --- */
        .login-section {
            position: relative;
            min-height: 80vh;
            display: flex;
            align-items: center;
            background-image: url('https://images.unsplash.com/photo-1523240795612-9a054b0db644?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            padding: 50px 0;
        }
        
        .login-section::before {
            content: "";
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background-color: rgba(0, 0, 0, 0.6); /* Même filtre sombre */
            z-index: 1;
        }

        .login-section .container {
            position: relative;
            z-index: 2;
        }

        /* --- LOGIN CARD --- */
        .login-card { 
            background: #fff; 
            padding: 40px; 
            border-radius: 10px; 
            box-shadow: 0 10px 30px rgba(0,0,0,0.2); 
        }
        
        .login-card h3 {
            font-weight: 800;
            color: #222;
        }

        .btn-primary { 
            background-color: #ffbc3b; 
            border-color: #ffbc3b; 
            color: #222; 
            font-weight: 700; 
            padding: 12px;
            transition: all 0.3s ease;
        }
        .btn-primary:hover { 
            background-color: #e0a330; 
            border-color: #e0a330; 
            color: #222; 
            transform: translateY(-2px);
        }

        .form-control {
            padding: 12px;
            height: auto;
            background-color: #f8f9fa;
            border: 1px solid #e9ecef;
        }
        .form-control:focus {
            box-shadow: none;
            border-color: #ffbc3b;
            background-color: #fff;
        }

        /* --- FOOTER (Light) --- */
        footer {
            background-color: #f8f9fa;
            border-top: 1px solid #e9ecef;
            color: #333;
            padding-top: 50px;
            margin-top: 0;
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
                <a class="navbar-brand" href="<%= request.getContextPath() %>/public/index.jsp">
                    ENSA
                </a>
                <button class="navbar-toggler rounded-0" type="button" data-toggle="collapse" data-target="#navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navigation">
                    <ul class="navbar-nav ml-auto text-center align-items-center">
                        <li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/public/index.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/public/about.jsp">About Us</a></li>
                        <li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/public/index.jsp#courses-section">Courses</a></li>
                        <li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/public/contact.jsp">Contact</a></li>
                        <li class="nav-item"><a class="btn-login" href="<%= request.getContextPath() %>/public/login.jsp">Login</a></li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</header>
<!-- /header -->

<!-- ================= LOGIN FORM ================= -->
<section class="login-section py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="login-card">
                    <div class="text-center mb-4">
                        <h3 class="mb-2">Welcome Back!</h3>
                        <p class="text-muted">Please login to your account</p>
                    </div>

                    <%-- Messages --%>
                    <% if ("inscrit".equals(request.getParameter("msg"))) { %>
                    <div class="alert alert-success text-center">Teacher account created successfully!</div>
                    <% } %>
                    <% if (request.getAttribute("erreur") != null) { %>
                    <div class="alert alert-danger text-center"><%= request.getAttribute("erreur") %></div>
                    <% } %>

                    <!-- Login Form -->
                    <form action="<%= request.getContextPath() %>/login" method="POST">
                        <div class="form-group mb-3">
                            <label for="email"><b>Email Address</b></label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="your@email.com" required>
                        </div>
                        <div class="form-group mb-4">
                            <label for="password"><b>Password</b></label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block w-100">Sign In</button>
                    </form>

                    <div class="text-center mt-4 pt-3 border-top">
                        <p class="text-muted mb-0">
                            Are you a new teacher? <br>
                            <a href="<%= request.getContextPath() %>/public/inscriptionEnseignant.jsp" class="text-warning font-weight-bold">Create your account here</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- /login -->

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
                    <li><a href="<%= request.getContextPath() %>/public/index.jsp">Home</a></li>
                    <li><a href="<%= request.getContextPath() %>/public/about.jsp">About Us</a></li>
                    <li><a href="<%= request.getContextPath() %>/public/index.jsp#courses-section">Courses</a></li>
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
<script src="<%= request.getContextPath() %>/public/plugins/jQuery/jquery.min.js"></script>
<script src="<%= request.getContextPath() %>/public/plugins/bootstrap/bootstrap.min.js"></script>
<script src="<%= request.getContextPath() %>/public/plugins/slick/slick.min.js"></script>
<script src="<%= request.getContextPath() %>/public/plugins/aos/aos.js"></script>
<script src="<%= request.getContextPath() %>/public/plugins/venobox/venobox.min.js"></script>
<script src="<%= request.getContextPath() %>/public/js/script.js"></script>

</body>
</html>