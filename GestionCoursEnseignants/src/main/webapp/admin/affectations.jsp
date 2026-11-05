<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Affectations - Kiaalap Dashboard</title>
    
    <!-- Load stylesheets -->
    <script type="module" crossorigin src="assets/main-ZZRh_wak.js"></script>
    <link rel="stylesheet" crossorigin href="assets/main-BV-wpnXD.css">
    <link rel="stylesheet" crossorigin href="assets/main-DVYj-QCH.css">
    
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
    <div class="sidebar-overlay" id="sidebarOverlay"></div>

<!-- Sidebar -->
<aside class="sidebar" id="sidebar">
    <div class="sidebar-header">
        <div class="sidebar-brand">
            <h5><i class="bi bi-mortarboard-fill"></i> Kiaalap</h5>
            <button type="button" class="sidebar-close" id="sidebarClose" aria-label="Close sidebar"><i class="bi bi-x-lg"></i></button>
        </div>
    </div>

    <nav class="sidebar-nav" aria-label="Main navigation">
        <div class="menu-section">
            <div class="menu-section-title">Main</div>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link has-submenu" href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#dashboardSubmenu">
                        <i class="bi bi-speedometer2"></i><span>Dashboard</span>
                    </a>
                    <ul id="dashboardSubmenu" class="submenu collapse list-unstyled">
                        <li><a class="nav-link" href="dashboard.jsp">Dashboard v.1</a></li>
                    </ul>
                </li>
            </ul>
        </div>

        <div class="menu-section">
            <div class="menu-section-title">Academic</div>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link has-submenu" href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#professorsSubmenu">
                        <i class="bi bi-person-badge"></i><span>Enseignants</span>
                    </a>
                    <ul id="professorsSubmenu" class="submenu collapse list-unstyled">
                        <li><a class="nav-link" href="listeEnseignants.jsp">Liste des enseignants</a></li>
                        <li><a class="nav-link" href="ajouterEnseignant.jsp">Ajouter un enseignant</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link has-submenu" href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#coursesSubmenu">
                        <i class="bi bi-book"></i><span>Cours</span>
                    </a>
                    <ul id="coursesSubmenu" class="submenu collapse list-unstyled">
                        <li><a class="nav-link" href="listeCours.jsp">Liste des cours</a></li>
                        <li><a class="nav-link" href="ajouterCours.jsp">Ajouter un cours</a></li>
                    </ul>
                </li>
                <!-- NOUVEAU MENU AFFECTATIONS -->
                <li class="nav-item">
                    <a class="nav-link has-submenu active" href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#affectationsSubmenu" aria-expanded="true">
                        <i class="bi bi-link-45deg"></i><span>Affectations</span>
                    </a>
                    <ul id="affectationsSubmenu" class="submenu collapse show list-unstyled">
                        <li><a class="nav-link active" href="affectations.jsp">Liste des affectations</a></li>
                        <li><a class="nav-link" href="ajouterAffectation.jsp">Nouvelle affectation</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        
        <div class="menu-section">
            <div class="menu-section-title">Pages</div>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp"><i class="bi bi-box-arrow-right"></i><span>Déconnexion</span></a>
                </li>
            </ul>
        </div>
    </nav>
</aside>

<div class="main-wrapper" id="mainWrapper">
    <header class="navbar top-navbar">
        <div class="container-fluid d-flex align-items-center h-100">
            <button type="button" class="hamburger-menu" id="sidebarToggle"><i class="bi bi-list"></i></button>
            <nav aria-label="Header breadcrumb" class="d-none d-lg-block ms-3">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a href="dashboard.jsp">Accueil</a></li>
                    <li class="breadcrumb-item active">Affectations</li>
                </ol>
            </nav>
        </div>
    </header>

    <main class="dashboard-content" id="main-content">
        <div class="container-fluid">
            <!-- Page Header -->
            <div class="mb-4">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h1 class="h3 font-bold">Gestion des Affectations</h1>
                        <p class="text-muted text-sm">Affectez les enseignants aux cours et gérez les volumes horaires.</p>
                    </div>
                    <div class="d-flex gap-2">
                        <a href="ajouterAffectation.jsp" class="btn btn-primary">
                            <i class="bi bi-plus-circle me-2"></i>Nouvelle Affectation
                        </a>
                    </div>
                </div>
            </div>

            <!-- Statistiques -->
            <div class="dashboard-row">
                <div class="dashboard-grid grid-cols-4 gap-3">
                    <div class="dashboard-card">
                        <div class="dashboard-card-body text-center">
                            <div class="mb-3">
                                <div class="stat-icon-large bg-primary bg-opacity-10 rounded-circle d-flex align-items-center justify-content-center mx-auto" style="width: 60px; height: 60px;">
                                    <i class="bi bi-link-45deg" style="font-size: 24px; color: #0d6efd;"></i>
                                </div>
                            </div>
                            <div class="stat-value text-primary fw-bold mb-1" style="font-size: 2rem;">24</div>
                            <div class="stat-label text-muted mb-2">Total Affectations</div>
                        </div>
                    </div>
                    <div class="dashboard-card">
                        <div class="dashboard-card-body text-center">
                            <div class="mb-3">
                                <div class="stat-icon-large bg-success bg-opacity-10 rounded-circle d-flex align-items-center justify-content-center mx-auto" style="width: 60px; height: 60px;">
                                    <i class="bi bi-book" style="font-size: 24px; color: #198754;"></i>
                                </div>
                            </div>
                            <div class="stat-value text-success fw-bold mb-1" style="font-size: 2rem;">12</div>
                            <div class="stat-label text-muted mb-2">Cours Assignés</div>
                        </div>
                    </div>
                    <div class="dashboard-card">
                        <div class="dashboard-card-body text-center">
                            <div class="mb-3">
                                <div class="stat-icon-large bg-info bg-opacity-10 rounded-circle d-flex align-items-center justify-content-center mx-auto" style="width: 60px; height: 60px;">
                                    <i class="bi bi-person-badge" style="font-size: 24px; color: #0dcaf0;"></i>
                                </div>
                            </div>
                            <div class="stat-value text-info fw-bold mb-1" style="font-size: 2rem;">8</div>
                            <div class="stat-label text-muted mb-2">Enseignants Assignés</div>
                        </div>
                    </div>
                    <div class="dashboard-card">
                        <div class="dashboard-card-body text-center">
                            <div class="mb-3">
                                <div class="stat-icon-large bg-warning bg-opacity-10 rounded-circle d-flex align-items-center justify-content-center mx-auto" style="width: 60px; height: 60px;">
                                    <i class="bi bi-clock" style="font-size: 24px; color: #ffc107;"></i>
                                </div>
                            </div>
                            <div class="stat-value text-warning fw-bold mb-1" style="font-size: 2rem;">120h</div>
                            <div class="stat-label text-muted mb-2">Heures Totales</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Tableau des affectations -->
            <div class="dashboard-row">
                <div class="dashboard-card">
                    <div class="dashboard-card-header">
                        <div class="d-flex justify-content-between align-items-center">
                            <h5 class="mb-0">Toutes les affectations</h5>
                            <div class="d-flex gap-2">
                                <div class="input-group" style="width: 300px;">
                                    <span class="input-group-text"><i class="bi bi-search"></i></span>
                                    <input type="text" class="form-control" placeholder="Rechercher...">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="dashboard-card-body">
                        <div class="table-responsive">
                            <table class="table table-hover align-middle">
                                <thead class="table-light">
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Cours</th>
                                        <th scope="col">Enseignant</th>
                                        <th scope="col">Semestre</th>
                                        <th scope="col">Nombre d'heures</th>
                                        <th scope="col">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Ligne d'exemple -->
                                    <tr>
                                        <td class="fw-bold">1</td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <div class="bg-primary bg-opacity-10 rounded-circle d-flex align-items-center justify-content-center me-3" style="width: 40px; height: 40px;">
                                                    <i class="bi bi-book text-primary"></i>
                                                </div>
                                                <div>
                                                    <div class="fw-semibold">Programmation Java</div>
                                                    <div class="text-muted small">Code: CS101</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <img src="https://ui-avatars.com/api/?name=Dr+John+Smith&background=0d6efd&color=fff" class="rounded-circle me-2" width="32" height="32" alt="Dr. John Smith">
                                                <div>
                                                    <div class="fw-semibold small">Dr. John Smith</div>
                                                    <div class="text-muted" style="font-size: 0.75rem;">Informatique</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td><span class="badge bg-info">Automne 2025</span></td>
                                        <td>
                                            <div class="fw-bold text-dark">40 h</div>
                                        </td>
                                        <td>
                                            <div class="dropdown">
                                                <button type="button" class="btn btn-light btn-sm" data-bs-toggle="dropdown">
                                                    <i class="bi bi-three-dots"></i>
                                                </button>
                                                <ul class="dropdown-menu">
                                                    <li><a class="dropdown-item" href="modifierAffectation.jsp"><i class="bi bi-pencil me-2"></i>Modifier</a></li>
                                                    <li><hr class="dropdown-divider"></li>
                                                    <li><a class="dropdown-item text-danger" href="#"><i class="bi bi-trash me-2"></i>Supprimer</a></li>
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                    <!-- Ajouter d'autres lignes statiques ou en JSTL plus tard -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    
    <footer class="dashboard-footer">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6"><p class="mb-0">&copy; 2026 Kiaalap. All rights reserved.</p></div>
            </div>
        </div>
    </footer>
</div>
</body>
</html>