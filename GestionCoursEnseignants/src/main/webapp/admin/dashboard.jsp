<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Kiaalap - Modern Education Management Dashboard for Universities">
    <meta name="keywords" content="education, dashboard, university, management, admin">
    <meta name="author" content="Kiaalap">

    <link rel="preconnect" href="https://images.unsplash.com" crossorigin>
    <link rel="preconnect" href="https://ui-avatars.com" crossorigin>
    <link rel="dns-prefetch" href="https://flagcdn.com">

    <title>Dashboard - Kiaalap Dashboard</title>

    <link rel="icon" type="image/x-icon" href="assets/favicon-9EIT7vLh.ico">

    <script type="module" crossorigin src="assets/main-ZZRh_wak.js"></script>
    <script type="module" crossorigin src="assets/chart-runtime-BMJJQUfu.js"></script>
    <link rel="stylesheet" crossorigin href="assets/main-BV-wpnXD.css">
    <link rel="stylesheet" crossorigin href="assets/main-DVYj-QCH.css">
    <link rel="stylesheet" crossorigin href="assets/charts-layout-C732DjRu.css">
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
                    <a class="nav-link has-submenu active" href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#dashboardSubmenu" aria-expanded="true">
                        <i class="bi bi-speedometer2"></i>
                        <span>Dashboard</span>
                    </a>
                    <ul id="dashboardSubmenu" class="submenu collapse show list-unstyled">
                        <li><a class="nav-link active" href="dashboard.jsp">Dashboard</a></li>
                    </ul>
                </li>
            </ul>
        </div>

        <div class="menu-section">
            <div class="menu-section-title">Academic</div>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link has-submenu " href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#professorsSubmenu" aria-expanded="false">
                        <i class="bi bi-person-badge"></i>
                        <span>Teachers</span>
                    </a>
                    <ul id="professorsSubmenu" class="submenu collapse  list-unstyled">
                        <li><a class="nav-link " href="listeEnseignants.jsp">All Teachers</a></li>
                        <li><a class="nav-link " href="ajouterEnseignant.jsp">Add Teacher</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link has-submenu " href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#coursesSubmenu" aria-expanded="false">
                        <i class="bi bi-book"></i>
                        <span>Courses</span>
                    </a>
                    <ul id="coursesSubmenu" class="submenu collapse  list-unstyled">
                        <li><a class="nav-link " href="listeCours.jsp">All Courses</a></li>
                        <li><a class="nav-link " href="ajouterCours.jsp">Add Course</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link has-submenu " href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#affectationsSubmenu" aria-expanded="false">
                        <i class="bi bi-link-45deg"></i>
                        <span>Assignments</span>
                    </a>
                    <ul id="affectationsSubmenu" class="submenu collapse  list-unstyled">
                        <li><a class="nav-link " href="affectations.jsp">All Assignments</a></li>
                        <li><a class="nav-link " href="ajouterAffectations.jsp">New Assignment</a></li>
                    </ul>
                </li>
            </ul>
        </div>

        <div class="menu-section">
            <div class="menu-section-title">Pages</div>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link " href="login.jsp">
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
    <!-- Header -->
    <header class="navbar top-navbar">
        <div class="container-fluid d-flex align-items-center h-100">
            <button type="button" class="hamburger-menu" id="sidebarToggle" aria-label="Toggle sidebar" aria-controls="sidebar">
                <i class="bi bi-list"></i>
            </button>

            <nav aria-label="Header breadcrumb" class="d-none d-lg-block ms-3">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a href="dashboard.jsp">Home</a></li>
                    <li class="breadcrumb-item active">Dashboard</li>
                </ol>
            </nav>

            <div class="navbar-brand d-lg-none fw-bold me-auto">Kiaalap</div>
            <div class="flex-grow-1 d-none d-lg-block"></div>

            <!-- Right Actions -->
            <div class="d-flex align-items-center gap-2">
                <!-- Quick Actions -->
                <div class="dropdown">
                    <button type="button" class="btn btn-light btn-icon" data-bs-toggle="dropdown" aria-label="Quick actions">
                        <i class="bi bi-plus-lg"></i>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="ajouterCours.jsp"><i class="bi bi-book me-2"></i>Add Course</a></li>
                        <li><a class="dropdown-item" href="ajouterEnseignant.jsp"><i class="bi bi-person-badge me-2"></i>Add Teacher</a></li>
                        <li><a class="dropdown-item" href="ajouterAffectation.jsp"><i class="bi bi-link-45deg me-2"></i>New Assignment</a></li>
                    </ul>
                </div>

                <!-- User Menu -->
                <div class="dropdown">
                    <button type="button" class="btn btn-light d-flex align-items-center" data-bs-toggle="dropdown" aria-label="Admin account menu">
                        <span class="user-avatar me-2">
                            AD
                        </span>
                        <span class="d-none d-md-inline">Admin User</span>
                        <i class="bi bi-chevron-down ms-1"></i>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="login.jsp"><i class="bi bi-box-arrow-right me-2"></i>Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <main class="dashboard-content" id="main-content">
        <div class="container-fluid">
            <!-- Page Header -->
            <div class="mb-3">
                <h1 class="h3 font-bold">Dashboard Overview</h1>
                <p class="text-muted text-sm">Welcome back! Here's a summary of your institution's activity.</p>
            </div>

            <!-- Stats Cards Row (MIS À JOUR) -->
            <div class="dashboard-row">
                <div class="dashboard-grid grid-cols-4">
                    <div class="stats-card">
                        <div class="stats-card-label">Total Teachers</div>
                        <div class="stats-card-value">24</div>
                        <span class="stats-card-change positive">+2 this month</span>
                        <div class="progress-custom">
                            <div class="progress-bar-custom bg-success" style="width: 20%"></div>
                        </div>
                    </div>

                    <div class="stats-card">
                        <div class="stats-card-label">Total Courses</div>
                        <div class="stats-card-value">156</div>
                        <span class="stats-card-change positive">+10 this month</span>
                        <div class="progress-custom">
                            <div class="progress-bar-custom bg-primary" style="width: 30%"></div>
                        </div>
                    </div>

                    <div class="stats-card">
                        <div class="stats-card-label">Total Assignments</div>
                        <div class="stats-card-value">42</div>
                        <span class="stats-card-change positive">+5 this week</span>
                        <div class="progress-custom">
                            <div class="progress-bar-custom bg-info" style="width: 60%"></div>
                        </div>
                    </div>

                    <div class="stats-card">
                        <div class="stats-card-label">Hours Assigned</div>
                        <div class="stats-card-value">1,200 h</div>
                        <span class="stats-card-change positive">+80h this week</span>
                        <div class="progress-custom">
                            <div class="progress-bar-custom bg-warning" style="width: 80%"></div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Quick Actions Row (SUGGESTION POUR LA SOUTENANCE) -->
            <div class="dashboard-row">
                <div class="dashboard-card">
                    <div class="dashboard-card-header">
                        <h5 class="dashboard-card-title mb-0">Quick Actions</h5>
                    </div>
                    <div class="dashboard-card-body">
                        <div class="d-flex gap-3 flex-wrap">
                            <a href="ajouterEnseignant.jsp" class="btn btn-primary btn-lg">
                                <i class="bi bi-person-plus me-2"></i>Add New Teacher
                            </a>
                            <a href="ajouterCours.jsp" class="btn btn-success btn-lg">
                                <i class="bi bi-book me-2"></i>Create New Course
                            </a>
                            <a href="ajouterAffectation.jsp" class="btn btn-info btn-lg text-white">
                                <i class="bi bi-link me-2"></i>Assign Course to Teacher
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Recent Activity Row -->
            <div class="dashboard-grid grid-cols-2">
                <!-- Recent Teachers -->
                <div class="dashboard-card">
                    <div class="dashboard-card-header d-flex justify-content-between align-items-center">
                        <h5 class="dashboard-card-title mb-0">Recently Added Teachers</h5>
                        <a href="listeEnseignants.jsp" class="btn btn-outline-primary btn-sm">View All</a>
                    </div>
                    <div class="dashboard-card-body">
                        <div class="list-group list-group-flush">
                            <div class="list-group-item d-flex align-items-center px-0 py-3">
                                <img src="https://ui-avatars.com/api/?name=John+Smith&background=0d6efd&color=fff" alt="John Smith" class="rounded-circle me-3" width="40" height="40" loading="lazy">
                                <div class="flex-grow-1">
                                    <h6 class="mb-1">Dr. John Smith</h6>
                                    <small class="text-muted">Computer Science Department</small>
                                    <div class="small text-muted">Added 2 hours ago</div>
                                </div>
                                <span class="badge bg-success">Active</span>
                            </div>
                            <div class="list-group-item d-flex align-items-center px-0 py-3">
                                <img src="https://ui-avatars.com/api/?name=Sarah+Johnson&background=198754&color=fff" alt="Sarah Johnson" class="rounded-circle me-3" width="40" height="40" loading="lazy">
                                <div class="flex-grow-1">
                                    <h6 class="mb-1">Dr. Sarah Johnson</h6>
                                    <small class="text-muted">Mathematics Department</small>
                                    <div class="small text-muted">Added 1 day ago</div>
                                </div>
                                <span class="badge bg-success">Active</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Recent Courses -->
                <div class="dashboard-card">
                    <div class="dashboard-card-header d-flex justify-content-between align-items-center">
                        <h5 class="dashboard-card-title mb-0">Recent Course Assignments</h5>
                        <a href="affectations.jsp" class="btn btn-outline-primary btn-sm">View All</a>
                    </div>
                    <div class="dashboard-card-body">
                        <div class="list-group list-group-flush">
                            <div class="list-group-item d-flex align-items-center px-0 py-3">
                                <div class="bg-primary bg-opacity-10 text-primary rounded-circle d-flex align-items-center justify-content-center me-3" style="width: 40px; height: 40px;">
                                    <i class="bi bi-code-slash" style="color: #0d6efd;"></i>
                                </div>
                                <div class="flex-grow-1">
                                    <h6 class="mb-1">Java Programming</h6>
                                    <small class="text-muted">Assigned to Dr. Smith</small>
                                    <div class="small text-muted">Fall 2025</div>
                                </div>
                                <span class="badge bg-success">Active</span>
                            </div>
                            <div class="list-group-item d-flex align-items-center px-0 py-3">
                                <div class="bg-success bg-opacity-10 text-success rounded-circle d-flex align-items-center justify-content-center me-3" style="width: 40px; height: 40px;">
                                    <i class="bi bi-calculator" style="color: #198754;"></i>
                                </div>
                                <div class="flex-grow-1">
                                    <h6 class="mb-1">Linear Algebra</h6>
                                    <small class="text-muted">Assigned to Dr. Johnson</small>
                                    <div class="small text-muted">Fall 2025</div>
                                </div>
                                <span class="badge bg-success">Active</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer class="dashboard-footer">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6">
                    <p class="mb-0">&copy; 2026 Kiaalap. All rights reserved.</p>
                </div>
                <div class="col-md-6 text-md-end">
                    <p class="mb-0">Built with <i class="bi bi-heart-fill text-danger"></i> for education</p>
                </div>
            </div>
        </div>
    </footer>
</div>

</body>
</html>