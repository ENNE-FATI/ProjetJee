<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Assignments - Kiaalap</title>

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
        .table-responsive { overflow: visible !important; }
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
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/dashboard">
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
                    <a class="nav-link has-submenu active" href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#assignmentsSubmenu" aria-expanded="true">
                        <i class="bi bi-link-45deg"></i><span>Assignments</span>
                    </a>
                    <ul id="assignmentsSubmenu" class="submenu collapse show list-unstyled">
                        <li><a class="nav-link active" href="${pageContext.request.contextPath}/affectations">All Assignments</a></li>
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
                    <li class="breadcrumb-item active">All Assignments</li>
                </ol>
            </nav>
            <div class="navbar-brand d-lg-none fw-bold me-auto">Kiaalap</div>
            <div class="flex-grow-1 d-none d-lg-block"></div>
        </div>
    </header>

    <main class="dashboard-content" id="main-content">
        <div class="container-fluid">
            <div class="mb-3">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h1 class="h3 font-bold">All Assignments</h1>
                        <p class="text-muted text-sm">Manage course assignments for teachers.</p>
                    </div>
                    <div>
                        <a href="${pageContext.request.contextPath}/ajouterAffectation" class="btn btn-primary"><i class="bi bi-plus-lg me-2"></i>New Assignment</a>
                    </div>
                </div>
            </div>

            <div class="dashboard-row">
                <div class="dashboard-card">
                    <div class="dashboard-card-header">
                        <h5 class="dashboard-card-title mb-0">Assignments Directory</h5>
                    </div>
                    <div class="dashboard-card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <thead class="table-light">
                                    <tr>
                                        <th scope="col" class="border-0">ID</th>
                                        <th scope="col" class="border-0">Course</th>
                                        <th scope="col" class="border-0">Teacher</th>
                                        <th scope="col" class="border-0">Date</th>
                                        <th scope="col" class="border-0">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="aff" items="${listeAffectations}">
                                        <tr>
                                            <td>${aff[0]}</td>
                                            <td><div class="fw-medium">${aff[1]} - ${aff[2]}</div></td>
                                            <td>${aff[4]} ${aff[3]}</td>
                                            <td>${aff[5]}</td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/supprimerAffectation?id=${aff[0]}" class="btn btn-sm btn-light text-danger" onclick="return confirm('Supprimer cette affectation ?')">
                                                    <i class="bi bi-trash"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    
                                    <c:if test="${empty listeAffectations}">
                                        <tr>
                                            <td colspan="5" class="text-center text-muted p-4">Aucune affectation trouvée.</td>
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