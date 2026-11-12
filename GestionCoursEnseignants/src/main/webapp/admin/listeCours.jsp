<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="ma.gestion.entity.Cours" %>
<%
    List<Cours> listeCours = (List<Cours>) request.getAttribute("cours");
    String msg = request.getParameter("msg");
    int total = (listeCours != null) ? listeCours.size() : 0;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All courses - Kiaalap Dashboard</title>

    <!-- ⚠️ CHEMINS CORRIGÉS ICI -->
    <link rel="icon" type="image/x-icon" href="<%= request.getContextPath() %>/admin/assets/favicon-9EIT7vLh.ico">
    <script type="module" crossorigin src="<%= request.getContextPath() %>/admin/assets/main-ZZRh_wak.js"></script>
    <link rel="stylesheet" crossorigin href="<%= request.getContextPath() %>/admin/assets/main-BV-wpnXD.css">
    <link rel="stylesheet" crossorigin href="<%= request.getContextPath() %>/admin/assets/main-DVYj-QCH.css">
</head>
<body>

<a href="#main-content" class="visually-hidden-focusable">Skip to main content</a>
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
                        <li><a class="nav-link active" href="<%= request.getContextPath() %>/admin/cours">All Courses</a></li>
                        <li><a class="nav-link" href="<%= request.getContextPath() %>/admin/cours?action=ajouter">Add Course</a></li>
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
                    <li class="breadcrumb-item"><a href="dashboard.jsp">Home</a></li>
                    <li class="breadcrumb-item active">All Courses</li>
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

            <% if ("ajoute".equals(msg)) { %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <i class="bi bi-check-circle me-2"></i> Cours ajouté avec succès !
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
            <% } else if ("modifie".equals(msg)) { %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <i class="bi bi-check-circle me-2"></i> Cours modifié avec succès !
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
            <% } else if ("supprime".equals(msg)) { %>
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                <i class="bi bi-trash me-2"></i> Cours supprimé.
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
            <% } else if ("erreur".equals(msg)) { %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <i class="bi bi-exclamation-triangle me-2"></i> Une erreur est survenue.
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
            <% } %>

            <div class="mb-3">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h1 class="h3 fw-bold mb-1">All Courses</h1>
                        <p class="text-muted mb-0">Manage your institution's course catalog</p>
                    </div>
                    <div>
                        <a href="<%= request.getContextPath() %>/admin/cours?action=ajouter" class="btn btn-primary">
                            <i class="bi bi-plus-circle me-2"></i> Add New Course
                        </a>
                    </div>
                </div>
            </div>

            <div class="dashboard-grid grid-cols-4 mb-4">
                <div class="dashboard-card p-3">
                    <div class="text-muted small text-uppercase fw-semibold">Total Cours</div>
                    <div class="fs-3 fw-bold text-dark"><%= total %></div>
                </div>
            </div>

            <div class="dashboard-card overflow-hidden">
                <div class="table-responsive">
                    <table class="table table-hover align-middle mb-0">
                        <thead>
                        <tr>
                            <th style="width: 40px;"><input class="form-check-input" type="checkbox"></th>
                            <th>Code</th>
                            <th>Intitulé</th>
                            <th>Volume horaire</th>
                            <th class="text-end">Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            if (listeCours == null || listeCours.isEmpty()) {
                        %>
                        <tr>
                            <td colspan="5" class="text-center text-muted py-5">
                                <i class="bi bi-inbox fs-2 d-block mb-2"></i>
                                Aucun cours enregistré pour le moment.
                            </td>
                        </tr>
                        <%
                        } else {
                            for (Cours c : listeCours) {
                        %>
                        <tr>
                            <td><input class="form-check-input" type="checkbox"></td>
                            <td class="fw-semibold text-primary"><%= c.getCode() %></td>
                            <td><%= c.getIntitule() %></td>
                            <td><span class="badge bg-light text-dark border"><%= c.getVolumeHoraire() %> heures</span></td>
                            <td class="text-end">
                                <div class="dropdown">
                                    <button type="button" class="btn btn-sm btn-light" data-bs-toggle="dropdown">
                                        <i class="bi bi-three-dots-vertical"></i>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                            <a class="dropdown-item" href="<%= request.getContextPath() %>/admin/cours?action=modifier&id=<%= c.getId() %>">
                                                <i class="bi bi-pencil me-2 text-primary"></i> Modifier
                                            </a>
                                        </li>
                                        <li><hr class="dropdown-divider"></li>
                                        <li>
                                            <a class="dropdown-item text-danger" href="<%= request.getContextPath() %>/admin/cours?action=supprimer&id=<%= c.getId() %>" onclick="return confirm('Supprimer le cours <%= c.getCode() %> ?');">
                                                <i class="bi bi-trash me-2"></i> Supprimer
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </main>

    <footer class="dashboard-footer">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6">
                    <p class="mb-0">&copy; 2026 Kiaalap. All rights reserved.</p>
                </div>
            </div>
        </div>
    </footer>
</div>

</body>
</html>