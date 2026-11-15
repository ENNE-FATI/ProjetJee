<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Kiaalap - Modern Education Management Dashboard for Universities">
    <title>All professors - Kiaalap Dashboard</title>

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/admin/assets/favicon-9EIT7vLh.ico">

    <!-- Load stylesheets et scripts avec les bons chemins -->
    <script type="module" crossorigin src="${pageContext.request.contextPath}/admin/assets/main-ZZRh_wak.js"></script>
    <link rel="stylesheet" crossorigin href="${pageContext.request.contextPath}/admin/assets/main-BV-wpnXD.css">
    <link rel="stylesheet" crossorigin href="${pageContext.request.contextPath}/admin/assets/main-DVYj-QCH.css">
    
    <style>
        *{box-sizing:border-box;margin:0;padding:0}
        body{background:#f5f7fa;font-family:-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,sans-serif}
        .sidebar{z-index:1040;background:#1f2937;width:260px;height:100vh;position:fixed;top:0;left:0}
        .main-wrapper{min-height:100vh;margin-left:260px;transition:margin-left .3s}
        .top-navbar{background:#fff;height:60px;padding:0 1rem;box-shadow:0 1px 3px #0000001a}
        .dashboard-content{padding:24px}
        
        /* CORRECTION POUR LE MENU DÉROULANT QUI ÉTAIT COUPÉ */
        .table-responsive { overflow: visible !important; }
        .dashboard-card { overflow: visible !important; }
        .dashboard-card-body { overflow: visible !important; }
        .table-hover tbody tr:hover { background-color: #f8f9fa; }
    </style>
</head>
<body>
    <div class="search-backdrop" id="searchBackdrop"></div>
    <div class="sidebar-overlay" id="sidebarOverlay"></div>

<!-- Sidebar (IDENTIQUE AU DASHBOARD) -->
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
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/dashboard">
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
                    <a class="nav-link has-submenu active" href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#professorsSubmenu" aria-expanded="true">
                        <i class="bi bi-person-badge"></i>
                        <span>Teachers</span>
                    </a>
                    <ul id="professorsSubmenu" class="submenu collapse show list-unstyled">
                        <li><a class="nav-link active" href="${pageContext.request.contextPath}/listeEnseignants">All Teachers</a></li>
                        <li><a class="nav-link" href="${pageContext.request.contextPath}/admin/ajouterEnseignant.jsp">Add Teacher</a></li>
                    </ul>
                </li>

                <!-- LE MENU COURSES AJOUTÉ ICI -->
                <li class="nav-item">
                    <a class="nav-link has-submenu" href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#coursesSubmenu" aria-expanded="false">
                        <i class="bi bi-book"></i>
                        <span>Courses</span>
                    </a>
                    <ul id="coursesSubmenu" class="submenu collapse list-unstyled">
                        <li><a class="nav-link" href="${pageContext.request.contextPath}/admin/cours">All Courses</a></li>
                        <li><a class="nav-link" href="${pageContext.request.contextPath}/admin/cours?action=ajouter">Add Course</a></li>
                    </ul>
                </li>
            </ul>
        </div>

        <div class="menu-section">
            <div class="menu-section-title">Pages</div>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/logout">
                        <i class="bi bi-box-arrow-right"></i>
                        <span>Logout</span>
                    </a>
                </li>
            </ul>
        </div>
    </nav>
</aside>

<!-- Main Content Wrapper -->
<div class="main-wrapper" id="mainWrapper">
    <header class="navbar top-navbar">
        <div class="container-fluid d-flex align-items-center h-100">
            <button type="button" class="hamburger-menu" id="sidebarToggle" aria-label="Toggle sidebar"><i class="bi bi-list"></i></button>
            <nav aria-label="Header breadcrumb" class="d-none d-lg-block ms-3">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard">Home</a></li>
                    <li class="breadcrumb-item active">All professors</li>
                </ol>
            </nav>
            <div class="navbar-brand d-lg-none fw-bold me-auto">Kiaalap</div>
            <div class="flex-grow-1 d-none d-lg-block"></div>
            <div class="d-flex align-items-center gap-2">
                <div class="dropdown">
                    <button type="button" class="btn btn-light d-flex align-items-center" data-bs-toggle="dropdown">
                        <span class="user-avatar me-2">AD</span><span class="d-none d-md-inline">Admin</span><i class="bi bi-chevron-down ms-1"></i>
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
            <!-- Page Header -->
            <div class="mb-3">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h1 class="h3 font-bold">All Professors</h1>
                        <p class="text-muted text-sm">Manage and view all faculty members in your institution.</p>
                    </div>
                    <div>
                        <a href="${pageContext.request.contextPath}/admin/ajouterEnseignant.jsp" class="btn btn-primary"><i class="bi bi-plus-lg me-2"></i>Add Professor</a>
                    </div>
                </div>
            </div>

            <!-- Professors Table -->
            <div class="dashboard-row">
                <div class="dashboard-card">
                    <div class="dashboard-card-header">
                        <div class="d-flex justify-content-between align-items-center">
                            <h5 class="dashboard-card-title mb-0">Professors Directory</h5>
                        </div>
                    </div>
                    <div class="dashboard-card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <thead class="table-light">
                                    <tr>
                                        <th scope="col" class="border-0">ID</th>
                                        <th scope="col" class="border-0">Professor</th>
                                        <th scope="col" class="border-0">Email</th>
                                        <th scope="col" class="border-0">Speciality</th>
                                        <th scope="col" class="border-0">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- BOUCLE DYNAMIQUE POUR AFFICHER LES VRAIS ENSEIGNANTS -->
                                    <c:forEach var="ens" items="${listeEnseignants}">
                                        <tr>
                                            <td>${ens[0]}</td> <!-- ID -->
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <img src="https://ui-avatars.com/api/?name=${ens[1]}+${ens[2]}&background=0d6efd&color=fff" alt="Avatar" class="rounded-circle me-3" style="width: 40px; height: 40px;">
                                                    <div class="fw-medium">${ens[1]} ${ens[2]}</div> <!-- Nom Prénom -->
                                                </div>
                                            </td>
                                            <td>${ens[3]}</td> <!-- Email -->
                                            <td>${ens[4]}</td> <!-- Spécialité -->
                                            <td>
                                                <div class="dropdown">
                                                    <button class="btn btn-link text-decoration-none p-1" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                        <i class="bi bi-three-dots-vertical"></i>
                                                    </button>
                                                    <ul class="dropdown-menu dropdown-menu-end">
                                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/modifierEnseignant?id=${ens[0]}"><i class="bi bi-pencil me-2"></i>Modifier</a></li>
                                                        <li><hr class="dropdown-divider"></li>
                                                        <li><a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/supprimerEnseignant?id=${ens[0]}" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet enseignant ?');"><i class="bi bi-trash me-2"></i>Supprimer</a></li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    
                                    <!-- Si la liste est vide -->
                                    <c:if test="${empty listeEnseignants}">
                                        <tr>
                                            <td colspan="5" class="text-center text-muted p-4">Aucun enseignant trouvé dans la base de données.</td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
</body>
</html>