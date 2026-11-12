<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="ma.gestion.entity.Cours" %>
<%
    Cours cours = (Cours) request.getAttribute("cours");
    boolean edition = (cours != null);
    String erreur = (String) request.getAttribute("erreur");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= edition ? "Edit" : "Add" %> course - Kiaalap Dashboard</title>

    <!-- ⚠️ CHEMINS CORRIGÉS ICI -->
    <link rel="icon" type="image/x-icon" href="<%= request.getContextPath() %>/admin/assets/favicon-9EIT7vLh.ico">
    <script type="module" crossorigin src="<%= request.getContextPath() %>/admin/assets/main-ZZRh_wak.js"></script>
    <link rel="stylesheet" crossorigin href="<%= request.getContextPath() %>/admin/assets/main-BV-wpnXD.css">
    <link rel="stylesheet" crossorigin href="<%= request.getContextPath() %>/admin/assets/main-DVYj-QCH.css">
</head>
<body>

<div class="search-backdrop" id="searchBackdrop"></div>
<div class="sidebar-overlay" id="sidebarOverlay"></div>

<!-- Sidebar -->
<aside class="sidebar" id="sidebar">
    <div class="sidebar-header">
        <div class="sidebar-brand">
            <h5>
                <i class="bi bi-mortarboard-fill"></i>
                Kiaalap
            </h5>
            <button type="button" class="sidebar-close" id="sidebarClose" aria-label="Close sidebar">
                <i class="bi bi-x-lg"></i>
            </button>
        </div>
    </div>

    <nav class="sidebar-nav" aria-label="Main navigation">
        <div class="menu-section">
            <div class="menu-section-title">Main</div>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link" href="<%= request.getContextPath() %>/admin/dashboard.jsp">
                        <i class="bi bi-speedometer2"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
            </ul>
        </div>

        <div class="menu-section">
            <div class="menu-section-title">Academic</div>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link" href="<%= request.getContextPath() %>/admin/listeEnseignants.jsp">
                        <i class="bi bi-person-badge"></i>
                        <span>Teachers</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link has-submenu active" href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#coursesSubmenu" aria-expanded="true">
                        <i class="bi bi-book"></i>
                        <span>Courses</span>
                    </a>
                    <ul id="coursesSubmenu" class="submenu collapse show list-unstyled">
                        <li><a class="nav-link" href="<%= request.getContextPath() %>/admin/cours">All Courses</a></li>
                        <li><a class="nav-link active" href="<%= request.getContextPath() %>/admin/cours?action=ajouter">Add Course</a></li>
                    </ul>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="<%= request.getContextPath() %>/admin/affectations.jsp">
                        <i class="bi bi-link-45deg"></i>
                        <span>Assignments</span>
                    </a>
                </li>
            </ul>
        </div>

        <div class="menu-section">
            <div class="menu-section-title">Pages</div>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link" href="<%= request.getContextPath() %>/login.jsp">
                        <i class="bi bi-box-arrow-right"></i>
                        <span>Logout</span>
                    </a>
                </li>
            </ul>
        </div>
    </nav>
</aside>

<!-- Main Wrapper -->
<div class="main-wrapper" id="mainWrapper">
    <header class="navbar top-navbar">
        <div class="container-fluid d-flex align-items-center h-100">
            <button type="button" class="hamburger-menu" id="sidebarToggle" aria-label="Toggle sidebar" aria-controls="sidebar">
                <i class="bi bi-list"></i>
            </button>

            <nav aria-label="Header breadcrumb" class="d-none d-lg-block ms-3">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a href="<%= request.getContextPath() %>/admin/dashboard.jsp">Home</a></li>
                    <li class="breadcrumb-item"><a href="<%= request.getContextPath() %>/admin/cours">Courses</a></li>
                    <li class="breadcrumb-item active"><%= edition ? "Edit" : "Add" %></li>
                </ol>
            </nav>

            <div class="navbar-brand d-lg-none fw-bold me-auto">Kiaalap</div>
            <div class="flex-grow-1 d-none d-lg-block"></div>

            <div class="d-flex align-items-center gap-2">
                <div class="dropdown">
                    <button type="button" class="btn btn-light d-flex align-items-center" data-bs-toggle="dropdown" aria-label="Admin account menu">
                        <span class="user-avatar me-2">AD</span>
                        <span class="d-none d-md-inline">Admin User</span>
                        <i class="bi bi-chevron-down ms-1"></i>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="<%= request.getContextPath() %>/login.jsp"><i class="bi bi-box-arrow-right me-2"></i>Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </header>

    <main class="dashboard-content" id="main-content">
        <div class="container-fluid">

            <% if (erreur != null && !erreur.isEmpty()) { %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <i class="bi bi-exclamation-triangle me-2"></i> <%= erreur %>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
            <% } %>

            <div class="mb-3">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h1 class="h3 fw-bold mb-2"><%= edition ? "Edit Course" : "Add New Course" %></h1>
                        <p class="text-muted mb-0">
                            <%= edition ? "Modifier les informations du cours" : "Créer un nouveau cours" %>
                        </p>
                    </div>
                    <a href="<%= request.getContextPath() %>/admin/cours" class="btn btn-light">
                        <i class="bi bi-arrow-left me-2"></i>Back to Courses
                    </a>
                </div>
            </div>

            <form class="needs-validation" action="<%= request.getContextPath() %>/admin/cours" method="POST" novalidate>

                <input type="hidden" name="action" value="<%= edition ? "mettreAJour" : "enregistrer" %>">
                <% if (edition) { %>
                <input type="hidden" name="id" value="<%= cours.getId() %>">
                <% } %>

                <div class="dashboard-card mb-3">
                    <div class="dashboard-card-header">
                        <h5 class="dashboard-card-title">Informations du cours</h5>
                    </div>
                    <div class="dashboard-card-body">

                        <div class="dashboard-grid grid-cols-2 mb-3">
                            <div>
                                <label for="code" class="form-label">Code du cours <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="code" name="code"
                                       value="<%= edition ? cours.getCode() : "" %>"
                                       placeholder="e.g., CS101" required>
                                <div class="invalid-feedback">Veuillez fournir un code.</div>
                            </div>
                            <div>
                                <label for="intitule" class="form-label">Intitulé <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="intitule" name="intitule"
                                       value="<%= edition ? cours.getIntitule() : "" %>"
                                       placeholder="e.g., Introduction to Computer Science" required>
                                <div class="invalid-feedback">Veuillez fournir un intitulé.</div>
                            </div>
                        </div>

                        <div class="dashboard-grid grid-cols-2 mb-3">
                            <div>
                                <label for="volumeHoraire" class="form-label">Volume horaire (heures) <span class="text-danger">*</span></label>
                                <input type="number" class="form-control" id="volumeHoraire" name="volumeHoraire"
                                       min="1" max="500"
                                       value="<%= edition ? cours.getVolumeHoraire() : 30 %>" required>
                                <div class="invalid-feedback">Volume entre 1 et 500 heures.</div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="d-flex gap-3">
                    <button type="submit" class="btn btn-primary">
                        <i class="bi bi-check-lg me-2"></i>
                        <%= edition ? "Mettre à jour" : "Créer le cours" %>
                    </button>
                    <a href="<%= request.getContextPath() %>/admin/cours" class="btn btn-outline-secondary">
                        <i class="bi bi-x-lg me-2"></i>Annuler
                    </a>
                </div>

            </form>

        </div>
    </main>
</div>

<script>
    (function() {
        'use strict';
        window.addEventListener('load', function() {
            var forms = document.getElementsByClassName('needs-validation');
            Array.prototype.filter.call(forms, function(form) {
                form.addEventListener('submit', function(event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>

</body>
</html>