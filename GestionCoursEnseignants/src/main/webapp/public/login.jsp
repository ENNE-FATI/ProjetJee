<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="utf-8">
    <title>Login - Educenter</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="<%= request.getContextPath() %>/public/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/public/plugins/slick/slick.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/public/plugins/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/public/plugins/animate/animate.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/public/plugins/aos/aos.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/public/plugins/venobox/venobox.css">
    <link href="<%= request.getContextPath() %>/public/css/style.css" rel="stylesheet">
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/public/images/favicon.ico" type="image/x-icon">
    <link rel="icon" href="<%= request.getContextPath() %>/public/images/favicon.ico" type="image/x-icon">

    <style>
        .header { position: fixed !important; top: 0; width: 100%; z-index: 9999; background-color: #fff; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        body { padding-top: 80px; background-color: #f8f9fa; }
        .btn-login { color: #333 !important; font-weight: 700; text-transform: uppercase; padding: 8px 15px !important; margin-left: 10px; transition: all 0.3s ease; }
        .btn-login:hover { color: #ffbc3b !important; background-color: transparent !important; text-decoration: underline; }
        .login-card { background: #fff; padding: 40px; border-radius: 10px; box-shadow: 0 10px 30px rgba(0,0,0,0.1); margin-top: 30px; margin-bottom: 50px; }
        .btn-primary { background-color: #ffbc3b; border-color: #ffbc3b; color: #333; font-weight: 700; }
        .btn-primary:hover { background-color: #e0a330; border-color: #e0a330; color: #333; }
    </style>
</head>

<body>

<!-- header -->
<header class="header">
    <div class="navigation w-100">
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light p-0">
                <a class="navbar-brand" href="<%= request.getContextPath() %>/public/index.jsp"><img src="<%= request.getContextPath() %>/public/images/logo.png" alt="logo" style="max-height: 50px;"></a>
                <button class="navbar-toggler rounded-0" type="button" data-toggle="collapse" data-target="#navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navigation">
                    <ul class="navbar-nav ml-auto text-center align-items-center">
                        <li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/public/index.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/public/about.jsp">About</a></li>
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

                    <%-- Messages --%>
                    <% if ("inscrit".equals(request.getParameter("msg"))) { %>
                    <div class="alert alert-success text-center">Compte enseignant créé avec succès !</div>
                    <% } %>
                    <% if (request.getAttribute("erreur") != null) { %>
                    <div class="alert alert-danger text-center"><%= request.getAttribute("erreur") %></div>
                    <% } %>

                    <!-- Formulaire de connexion -->
                    <form action="<%= request.getContextPath() %>/login" method="POST">
                        <div class="form-group mb-3">
                            <label for="email"><b>Email Address</b></label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="votre@email.com" required>
                        </div>
                        <div class="form-group mb-4">
                            <label for="password"><b>Password</b></label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block w-100">Sign In</button>
                    </form>

                    <div class="text-center mt-4 pt-3 border-top">
                        <p class="text-muted mb-0">
                            Vous êtes un nouvel enseignant ? <br>
                            <a href="<%= request.getContextPath() %>/public/inscriptionEnseignant.jsp" class="text-warning font-weight-bold">Créez votre compte ici</a>
                        </p>
                    </div>
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
                    <a class="logo-footer" href="<%= request.getContextPath() %>/public/index.jsp"><img class="img-fluid mb-4" src="<%= request.getContextPath() %>/public/images/logo.png" alt="logo" style="max-height: 50px;"></a>
                </div>
            </div>
        </div>
    </div>
</footer>

<script src="<%= request.getContextPath() %>/public/plugins/jQuery/jquery.min.js"></script>
<script src="<%= request.getContextPath() %>/public/plugins/bootstrap/bootstrap.min.js"></script>
<script src="<%= request.getContextPath() %>/public/plugins/slick/slick.min.js"></script>
<script src="<%= request.getContextPath() %>/public/plugins/aos/aos.js"></script>
<script src="<%= request.getContextPath() %>/public/plugins/venobox/venobox.min.js"></script>
<script src="<%= request.getContextPath() %>/public/js/script.js"></script>

</body>
</html>