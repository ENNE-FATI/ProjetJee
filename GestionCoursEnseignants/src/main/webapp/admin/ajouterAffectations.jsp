<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Assignment - Kiaalap</title>

    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/admin/assets/favicon-9EIT7vLh.ico">
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
    </style>
</head>
<body>
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
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/dashboard"><i class="bi bi-speedometer2"></i><span>Dashboard</span></a></li>
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
                    <a class="nav-link has-submenu active" href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#assignmentsSubmenu" aria-expanded="true">
                        <i class="bi bi-link-45deg"></i><span>Assignments</span>
                    </a>
                    <ul id="assignmentsSubmenu" class="submenu collapse show list-unstyled">
                        <li><a class="nav-link" href="${pageContext.request.contextPath}/affectations">All Assignments</a></li>
                        <li><a class="nav-link active" href="${pageContext.request.contextPath}/ajouterAffectation">New Assignment</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="menu-section">
            <div class="menu-section-title">Pages</div>
            <ul class="nav flex-column">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/public/login.jsp"><i class="bi bi-box-arrow-right"></i><span>Logout</span></a></li>
            </ul>
        </div>
    </nav>
</aside>

<!-- Main Content Wrapper -->
<div class="main-wrapper" id="mainWrapper">
    <header class="navbar top-navbar">
        <div class="container-fluid d-flex align-items-center h-100">
            <button type="button" class="hamburger-menu" id="sidebarToggle"><i class="bi bi-list"></i></button>
            <nav aria-label="Header breadcrumb" class="d-none d-lg-block ms-3">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard">Home</a></li>
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/affectations">Assignments</a></li>
                    <li class="breadcrumb-item active">New Assignment</li>
                </ol>
            </nav>
            <div class="navbar-brand d-lg-none fw-bold me-auto">Kiaalap</div>
            <div class="flex-grow-1 d-none d-lg-block"></div>
        </div>
    </header>

    <main class="dashboard-content" id="main-content">
        <div class="container-fluid">
            <div class="mb-4">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h1 class="h3 font-bold">New Assignment</h1>
                        <p class="text-muted text-sm">Assign a teacher to a course.</p>
                    </div>
                    <div>
                        <a href="${pageContext.request.contextPath}/affectations" class="btn btn-outline-secondary">
                            <i class="bi bi-arrow-left me-2"></i>Back to List
                        </a>
                    </div>
                </div>
            </div>

            <!-- Formulaire -->
            <form action="${pageContext.request.contextPath}/ajouterAffectation" method="POST">
                <div class="dashboard-row">
                    <div class="dashboard-card">
                        <div class="dashboard-card-header">
                            <h5 class="mb-0">Assignment Details</h5>
                        </div>
                        <div class="dashboard-card-body">
                            <div class="row">
                                <!-- Choix du Cours -->
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Course <span class="text-danger">*</span></label>
                                    <select class="form-select" name="cours_id" required>
                                        <option value="">Select a course...</option>
                                        <!-- Les cours sont injectés par le Servlet -->
                                        <c:if test="${not empty listeCours}">
                                            <c:forEach var="c" items="${listeCours}">
                                                <option value="${c[0]}">${c[1]} - ${c[2]}</option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                </div>

                                <!-- Choix de l'Enseignant -->
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Teacher <span class="text-danger">*</span></label>
                                    <select class="form-select" name="enseignant_id" required>
                                        <option value="">Select a teacher...</option>
                                        <c:if test="${not empty listeEnseignants}">
                                            <c:forEach var="e" items="${listeEnseignants}">
                                                <option value="${e[0]}">${e[1]} ${e[2]}</option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                </div>

                                <!-- Date d'affectation -->
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Date <span class="text-danger">*</span></label>
                                    <input type="date" class="form-control" name="dateAffectation" required>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="dashboard-row">
                    <div class="dashboard-card">
                        <div class="dashboard-card-body d-flex justify-content-end gap-2">
                            <a href="${pageContext.request.contextPath}/affectations" class="btn btn-outline-secondary">Annuler</a>
                            <button type="submit" class="btn btn-primary">
                                <i class="bi bi-check-circle me-2"></i>Enregistrer l'affectation
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </main>
</div>
</body>
</html>