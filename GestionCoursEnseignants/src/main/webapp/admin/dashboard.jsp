<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Kiaalap - Modern Education Management Dashboard for Universities">
    <title>Dashboard - Kiaalap</title>

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
            <button type="button" class="hamburger-menu" id="sidebarToggle"><i class="bi bi-list"></i></button>
            <nav aria-label="Header breadcrumb" class="d-none d-lg-block ms-3">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard">Home</a></li>
                    <li class="breadcrumb-item active">Dashboard</li>
                </ol>
            </nav>
            <div class="navbar-brand d-lg-none fw-bold me-auto">Kiaalap</div>
            <div class="flex-grow-1 d-none d-lg-block"></div>
            <div class="d-flex align-items-center gap-2">
                <div class="dropdown">
                    <button type="button" class="btn btn-light d-flex align-items-center" data-bs-toggle="dropdown">
                        <span class="user-avatar me-2">AD</span><span class="d-none d-md-inline">Admin User</span><i class="bi bi-chevron-down ms-1"></i>
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
                <h1 class="h3 font-bold">Dashboard Overview</h1>
                <p class="text-muted text-sm">Welcome back! Here's a summary of your institution's activity.</p>
            </div>

            <div class="dashboard-row">
                <div class="dashboard-grid grid-cols-4">
                    <div class="stats-card">
                        <div class="stats-card-label">Total Teachers</div>
                        <div class="stats-card-value">${totalEnseignants != null ? totalEnseignants : 0}</div>
                        <span class="stats-card-change positive">+2 this month</span>
                        <div class="progress-custom"><div class="progress-bar-custom bg-success" style="width: 20%"></div></div>
                    </div>
                    <div class="stats-card">
                        <div class="stats-card-label">Total Courses</div>
                        <div class="stats-card-value">${totalCours != null ? totalCours : 0}</div>
                        <span class="stats-card-change positive">+10 this month</span>
                        <div class="progress-custom"><div class="progress-bar-custom bg-primary" style="width: 30%"></div></div>
                    </div>
                    <div class="stats-card">
                        <div class="stats-card-label">Total Assignments</div>
                        <div class="stats-card-value">${totalAffectations != null ? totalAffectations : 0}</div>
                        <span class="stats-card-change positive">+5 this week</span>
                        <div class="progress-custom"><div class="progress-bar-custom bg-info" style="width: 60%"></div></div>
                    </div>
                    <div class="stats-card">
                        <div class="stats-card-label">Hours Assigned</div>
                        <div class="stats-card-value">${totalHeures != null ? totalHeures : 0} h</div>
                        <span class="stats-card-change positive">+80h this week</span>
                        <div class="progress-custom"><div class="progress-bar-custom bg-warning" style="width: 80%"></div></div>
                    </div>
                </div>
            </div>

            <div class="dashboard-row">
                <div class="dashboard-card">
                    <div class="dashboard-card-header">
                        <h5 class="dashboard-card-title mb-0">Quick Actions</h5>
                    </div>
                    <div class="dashboard-card-body">
                        <div class="d-flex gap-3 flex-wrap">
                            <a href="${pageContext.request.contextPath}/admin/ajouterEnseignant.jsp" class="btn btn-primary btn-lg">
                                <i class="bi bi-person-plus me-2"></i>Add New Teacher
                            </a>
                            <a href="${pageContext.request.contextPath}/admin/cours?action=ajouter" class="btn btn-success btn-lg">
                                <i class="bi bi-book me-2"></i>Create New Course
                            </a>
                            <a href="${pageContext.request.contextPath}/NotifyTeacherServlet" class="btn btn-warning btn-lg text-white">
                                <i class="bi bi-bell me-2"></i>Notify a Teacher
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="dashboard-grid grid-cols-2">
                <div class="dashboard-card">
                    <div class="dashboard-card-header d-flex justify-content-between align-items-center">
                        <h5 class="dashboard-card-title mb-0">Recently Added Teachers</h5>
                        <a href="${pageContext.request.contextPath}/listeEnseignants" class="btn btn-outline-primary btn-sm">View All</a>
                    </div>
                    <div class="dashboard-card-body">
                        <div class="list-group list-group-flush">
                            <c:forEach var="ens" items="${derniersEnseignants}" varStatus="status">
                                <c:if test="${status.index < 3}">
                                    <div class="list-group-item d-flex align-items-center px-0 py-3">
                                        <img src="https://ui-avatars.com/api/?name=${ens.nom}+${ens.prenom}&background=0d6efd&color=fff" alt="Avatar" class="rounded-circle me-3" width="40" height="40">
                                        <div class="flex-grow-1">
                                            <h6 class="mb-1">${ens.prenom} ${ens.nom}</h6>
                                            <small class="text-muted">${ens.specialite}</small>
                                        </div>
                                        <span class="badge bg-success">Active</span>
                                    </div>
                                </c:if>
                            </c:forEach>
                            <c:if test="${empty derniersEnseignants}">
                                <p class="text-muted text-center p-3">Aucun enseignant ajouté récemment.</p>
                            </c:if>
                        </div>
                    </div>
                </div>

                <div class="dashboard-card">
                    <div class="dashboard-card-header d-flex justify-content-between align-items-center">
                        <h5 class="dashboard-card-title mb-0">Recent Course Assignments</h5>
                        <a href="${pageContext.request.contextPath}/affectations" class="btn btn-outline-primary btn-sm">View All</a>
                    </div>
                    <div class="dashboard-card-body">
                        <div class="list-group list-group-flush">
                            <c:forEach var="aff" items="${derniersAffectations}">
                                <div class="list-group-item d-flex align-items-center px-0 py-3">
                                    <div class="bg-primary bg-opacity-10 text-primary rounded-circle d-flex align-items-center justify-content-center me-3" style="width: 40px; height: 40px;">
                                        <i class="bi bi-book" style="color: #0d6efd;"></i>
                                    </div>
                                    <div class="flex-grow-1">
                                        <h6 class="mb-1">${aff[0]} - ${aff[1]}</h6>
                                        <small class="text-muted">Assigned to ${aff[3]} ${aff[2]}</small>
                                    </div>
                                    <span class="badge bg-success">Active</span>
                                </div>
                            </c:forEach>
                            <c:if test="${empty derniersAffectations}">
                                <p class="text-muted text-center p-3">Aucune affectation pour le moment.</p>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
</body>
</html>