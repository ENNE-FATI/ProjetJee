<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Gestion des Cours</title>
    
    <!-- On charge le CSS du template Kiaalap qui est dans le dossier admin -->
    <link rel="stylesheet" crossorigin href="../admin/assets/main-BV-wpnXD.css">
    <link rel="stylesheet" crossorigin href="../admin/assets/main-DVYj-QCH.css">
    
    <style>
        *{box-sizing:border-box;margin:0;padding:0}
        body{background:linear-gradient(135deg,#667eea 0%,#764ba2 100%);justify-content:center;align-items:center;min-height:100vh;font-family:-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,sans-serif;display:flex}
        .auth-container{width:100%;max-width:420px;padding:20px}
        .auth-card{background:#fff;border-radius:12px;padding:40px;box-shadow:0 10px 40px #0000001a}
        .auth-header{text-align:center;margin-bottom:30px}
        .brand-logo{background:#6366f1;border-radius:12px;justify-content:center;align-items:center;width:60px;height:60px;margin-bottom:20px;display:inline-flex}
        .brand-logo i{color:#fff;font-size:30px}
    </style>
</head>
<body>
    <div class="auth-container">
        <div class="auth-card">
            <div class="auth-header">
                <div class="brand-logo">
                    <i class="bi bi-mortarboard-fill"></i>
                </div>
                <h1 class="h3 mb-2 fw-bold">Welcome Back!</h1>
                <p class="text-muted">Please login to your account</p>
            </div>

            <form id="loginForm" action="login" method="POST">
                <div class="mb-3">
                    <label for="username" class="form-label">Email Address</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                        <input type="email" class="form-control" id="username" name="username" placeholder="example@kiaalap.edu" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-lock"></i></span>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                    </div>
                </div>

                <div class="d-grid gap-2">
                    <button class="btn btn-primary btn-lg" type="submit">
                        <i class="bi bi-box-arrow-in-right me-2"></i> Sign In
                    </button>
                </div>
            </form>

            <!-- BOUTONS DE SIMULATION POUR TESTER LA NAVIGATION -->
            <div class="text-center mt-4 pt-3 border-top">
                <p class="text-muted small mb-2">Simulate Login As:</p>
                <a href="../admin/dashboard.jsp" class="btn btn-sm btn-outline-primary">Admin Space</a>
                <a href="../enseignant/index.jsp" class="btn btn-sm btn-outline-success">Teacher Space</a>
            </div>
            
            <div class="text-center mt-3">
                <a href="index.jsp" class="text-decoration-none small">← Back to Public Site</a>
            </div>
        </div>
    </div>
</body>
</html>