<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Kiaalap - Modern Education Management Dashboard for Universities">
    <title>${not empty enseignant ? 'Modifier' : 'Ajouter'} un Enseignant</title>

    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/admin/assets/favicon-9EIT7vLh.ico">
    <script type="module" crossorigin src="${pageContext.request.contextPath}/admin/assets/main-ZZRh_wak.js"></script>
    <script type="module" crossorigin src="${pageContext.request.contextPath}/admin/assets/chart-runtime-BMJJQUfu.js"></script>
    <link rel="stylesheet" crossorigin href="${pageContext.request.contextPath}/admin/assets/main-BV-wpnXD.css">
    <link rel="stylesheet" crossorigin href="${pageContext.request.contextPath}/admin/assets/main-DVYj-QCH.css">
    <link rel="stylesheet" crossorigin href="${pageContext.request.contextPath}/admin/assets/charts-layout-C732DjRu.css">
    
    <style>
        *{box-sizing:border-box;margin:0;padding:0}
        body{background:#f5f7fa;font-family:-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,sans-serif}
        .sidebar{z-index:1040;background:#1f2937;width:260px;height:100vh;position:fixed;top:0;left:0}
        .main-wrapper{min-height:100vh;margin-left:260px;transition:margin-left .3s}
        .top-navbar{background:#fff;height:60px;padding:0 1rem;box-shadow:0 1px 3px #0000001a}
        .dashboard-content{padding:24px}
    </style>
</head>
<body>
<a href="#main-content" class="visually-hidden-focusable">Skip to main content</a>
<div class="search-backdrop" id="searchBackdrop"></div>
<div class="sidebar-overlay" id="sidebarOverlay"></div>

<!-- Sidebar -->
<aside class="sidebar" id="sidebar">
    <div class="sidebar-header">
        <div class="sidebar-brand">
            <h5><i class="bi bi-mortarboard-fill"></i> Kiaalap</h5>
            <button type="button" class="sidebar-close" id="sidebarClose"><i class="bi bi-x-lg"></i></button>
        </div>
    </div>
    <nav class="sidebar-nav">
        <div class="menu-section">
            <div class="menu-section-title">Main</div>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link active" href="${pageContext.request.contextPath}/admin/dashboard">
                        <i class="bi bi-speedometer2"></i><span>Dashboard</span>
                    </a>
                </li>
            </ul>
        </div>
        <div class="menu-section">
            <div class="menu-section-title">Academic</div>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link has-submenu" href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#professorsSubmenu" aria-expanded="false">
                        <i class="bi bi-person-badge"></i><span>Teachers</span>
                    </a>
                    <ul id="professorsSubmenu" class="submenu collapse list-unstyled">
                        <li><a class="nav-link" href="${pageContext.request.contextPath}/listeEnseignants">All Teachers</a></li>
                        <li><a class="nav-link" href="${pageContext.request.contextPath}/admin/ajouterEnseignant.jsp">Add Teacher</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link has-submenu" href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#coursesSubmenu" aria-expanded="false">
                        <i class="bi bi-book"></i><span>Courses</span>
                    </a>
                    <ul id="coursesSubmenu" class="submenu collapse list-unstyled">
                        <li><a class="nav-link" href="${pageContext.request.contextPath}/admin/cours">All Courses</a></li>
                        <li><a class="nav-link" href="${pageContext.request.contextPath}/admin/cours?action=ajouter">Add Course</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link has-submenu" href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#assignmentsSubmenu" aria-expanded="false">
                        <i class="bi bi-link-45deg"></i><span>Assignments</span>
                    </a>
                    <ul id="assignmentsSubmenu" class="submenu collapse list-unstyled">
                        <li><a class="nav-link" href="${pageContext.request.contextPath}/affectations">All Assignments</a></li>
                        <!-- Lien vers le Servlet pour charger les listes -->
                        <li><a class="nav-link" href="${pageContext.request.contextPath}/ajouterAffectation">New Assignment</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link has-submenu" href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#notificationsSubmenu" aria-expanded="false">
                        <i class="bi bi-bell"></i><span>Notifications</span>
                    </a>
                    <ul id="notificationsSubmenu" class="submenu collapse list-unstyled">
                        <li><a class="nav-link" href="${pageContext.request.contextPath}/ListeNotificationsServlet">All Notifications</a></li>
                        <li><a class="nav-link" href="${pageContext.request.contextPath}/NotifierEnseignantServlet">Send Notification</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="menu-section">
            <div class="menu-section-title">Pages</div>
            <ul class="nav flex-column">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/logout"><i class="bi bi-box-arrow-right"></i><span>Logout</span></a></li>
            </ul>
        </div>
    </nav>
</aside>

<!-- Main Content Wrapper -->
<div class="main-wrapper" id="mainWrapper">
    <header class="navbar top-navbar">
        <div class="container-fluid d-flex align-items-center h-100">
            <button type="button" class="hamburger-menu" id="sidebarToggle" aria-label="Toggle sidebar" aria-controls="sidebar">
                <i class="bi bi-list"></i>
            </button>

            <nav aria-label="Header breadcrumb" class="d-none d-lg-block ms-3">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard">Home</a></li>
                    <li class="breadcrumb-item active">${not empty enseignant ? 'Modifier' : 'Ajouter'} un Enseignant</li>
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
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout"><i class="bi bi-box-arrow-right me-2"></i>Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </header>

    <main class="dashboard-content" id="main-content">
        <div class="container-fluid">
            <div class="mb-3">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h1 class="h3 font-bold">${not empty enseignant ? 'Modifier' : 'Ajouter'} un Enseignant</h1>
                        <p class="text-muted text-sm">Remplissez les informations ci-dessous.</p>
                    </div>
                    <div>
                        <a href="${pageContext.request.contextPath}/listeEnseignants" class="btn btn-outline-secondary">
                            <i class="bi bi-arrow-left me-2"></i>Retour
                        </a>
                    </div>
                </div>
            </div>

            <div class="dashboard-card">
                <div class="dashboard-card-body">
                    <form action="${pageContext.request.contextPath}/${not empty enseignant ? 'modifierEnseignant' : 'ajouterEnseignant'}" method="POST">
                        <!-- Champ caché pour l'ID (en mode modification) -->
                        <input type="hidden" name="id" value="${enseignant != null ? enseignant[0] : ''}">
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Nom <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="nom" value="${enseignant != null ? enseignant[1] : ''}" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Prénom <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="prenom" value="${enseignant != null ? enseignant[2] : ''}" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Email <span class="text-danger">*</span></label>
                                <input type="email" class="form-control" name="email" value="${enseignant != null ? enseignant[3] : ''}" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Mot de passe <span class="text-danger">*</span></label>
                                <input type="password" class="form-control" name="password" ${enseignant != null ? '' : 'required'}>
                            </div>
                            <div class="col-md-12 mb-3">
                                <label class="form-label">Spécialité <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="specialite" value="${enseignant != null ? enseignant[4] : ''}" required>
                            </div>
                        </div>

                        <div class="mt-4">
                            <button type="submit" class="btn btn-primary">${not empty enseignant ? 'Enregistrer les modifications' : 'Ajouter l\'enseignant'}</button>
                            <a href="${pageContext.request.contextPath}/listeEnseignants" class="btn btn-outline-secondary">Annuler</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
</div>
</body>
</html>