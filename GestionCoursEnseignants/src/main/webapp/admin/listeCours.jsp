<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Kiaalap - Modern Education Management Dashboard for Universities">
    <meta name="keywords" content="education, dashboard, university, management, admin">
    <meta name="author" content="Kiaalap">

    <!-- Preconnect to external domains -->
    <link rel="preconnect" href="https://images.unsplash.com" crossorigin>
    <link rel="preconnect" href="https://ui-avatars.com" crossorigin>
    <link rel="dns-prefetch" href="https://flagcdn.com">

    <title>All courses - Kiaalap Dashboard</title>

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="assets/favicon-9EIT7vLh.ico">

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
        .loading{background:#e5e7eb;animation:2s cubic-bezier(.4,0,.6,1) infinite pulse}
        .dashboard-card{background:#fff;border:1px solid #e5e7eb;border-radius:8px;box-shadow:0 1px 3px #0000001a}
        .dashboard-card-header{border-bottom:1px solid #e5e7eb;padding:16px 20px}
        .dashboard-card-body{padding:20px}
        .dashboard-card-title{color:#1f2937;margin:0;font-size:1.125rem;font-weight:600}
        .dashboard-row{margin-bottom:24px}
        .dashboard-grid{gap:24px;display:grid}
        .grid-cols-1{grid-template-columns:1fr}
        .grid-cols-2{grid-template-columns:repeat(2,1fr)}
        .grid-cols-3{grid-template-columns:repeat(3,1fr)}
        .grid-cols-4{grid-template-columns:repeat(4,1fr)}
        .grid-cols-3-1{grid-template-columns:3fr 1fr}
        @media (width<=1200px){.grid-cols-4,.grid-cols-3{grid-template-columns:repeat(2,1fr)}.grid-cols-3-1{grid-template-columns:1fr}}
        @media (width<=768px){.dashboard-grid{gap:16px}.grid-cols-4,.grid-cols-3,.grid-cols-2,.grid-cols-3-1{grid-template-columns:1fr}}
    </style>
</head>
<body>
    <!-- Skip to main content for accessibility -->
    <a href="#main-content" class="visually-hidden-focusable">Skip to main content</a>

    <!-- Required DOM elements for dashboard.js -->
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
                    <a class="nav-link has-submenu " href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#dashboardSubmenu" aria-expanded="false">
                        <i class="bi bi-speedometer2"></i>
                        <span>Dashboard</span>
                    </a>
                    <ul id="dashboardSubmenu" class="submenu collapse  list-unstyled">
                        <li><a class="nav-link " href="dashboard.jsp">Dashboard v.1</a></li>
                        <li><a class="nav-link " href="index-1.html">Dashboard v.2</a></li>
                        <li><a class="nav-link " href="index-2.html">Dashboard v.3</a></li>
                        <li><a class="nav-link " href="analytics.html">Analytics</a></li>
                        <li><a class="nav-link " href="widgets.html">Widgets</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="events.html">
                        <i class="bi bi-calendar-event"></i>
                        <span>Events</span>
                    </a>
                </li>
            </ul>
        </div>

        <div class="menu-section">
            <div class="menu-section-title">Academic</div>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link has-submenu " href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#professorsSubmenu" aria-expanded="false">
                        <i class="bi bi-person-badge"></i>
                        <span>Professors</span>
                    </a>
                    <ul id="professorsSubmenu" class="submenu collapse  list-unstyled">
                        <li><a class="nav-link " href="listeEnseignants.jsp">All Professors</a></li>
                        <li><a class="nav-link " href="ajouterEnseignant.jsp">Add Professor</a></li>
                        <li><a class="nav-link " href="edit-professor.html">Edit Professor</a></li>
                        <li><a class="nav-link " href="professor-profile.html">Professor Profile</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link has-submenu " href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#studentsSubmenu" aria-expanded="false">
                        <i class="bi bi-people"></i>
                        <span>Students</span>
                    </a>
                    <ul id="studentsSubmenu" class="submenu collapse  list-unstyled">
                        <li><a class="nav-link " href="all-students.html">All Students</a></li>
                        <li><a class="nav-link " href="add-student.html">Add Student</a></li>
                        <li><a class="nav-link " href="edit-student.html">Edit Student</a></li>
                        <li><a class="nav-link " href="student-profile.html">Student Profile</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link has-submenu active" href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#coursesSubmenu" aria-expanded="true">
                        <i class="bi bi-book"></i>
                        <span>Courses</span>
                    </a>
                    <ul id="coursesSubmenu" class="submenu collapse show list-unstyled">
                        <li><a class="nav-link active" href="listeCours.jsp">All Courses</a></li>
                        <li><a class="nav-link " href="ajouterCours.jsp">Add Course</a></li>
                        <li><a class="nav-link " href="edit-course.html">Edit Course</a></li>
                        <li><a class="nav-link " href="course-info.html">Course Info</a></li>
                        <li><a class="nav-link " href="course-payment.html">Course Payment</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link has-submenu " href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#librarySubmenu" aria-expanded="false">
                        <i class="bi bi-journal-bookmark"></i>
                        <span>Library</span>
                    </a>
                    <ul id="librarySubmenu" class="submenu collapse  list-unstyled">
                        <li><a class="nav-link " href="library-assets.html">Library Assets</a></li>
                        <li><a class="nav-link " href="add-library-assets.html">Add Library Asset</a></li>
                        <li><a class="nav-link " href="edit-library-assets.html">Edit Library Asset</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link has-submenu " href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#departmentsSubmenu" aria-expanded="false">
                        <i class="bi bi-building"></i>
                        <span>Departments</span>
                    </a>
                    <ul id="departmentsSubmenu" class="submenu collapse  list-unstyled">
                        <li><a class="nav-link " href="departments.html">Departments List</a></li>
                        <li><a class="nav-link " href="add-department.html">Add Department</a></li>
                        <li><a class="nav-link " href="edit-department.html">Edit Department</a></li>
                    </ul>
                </li>
            </ul>
        </div>

        <div class="menu-section">
            <div class="menu-section-title">Communication</div>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link has-submenu " href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#mailboxSubmenu" aria-expanded="false">
                        <i class="bi bi-envelope"></i>
                        <span>Mailbox</span>
                    </a>
                    <ul id="mailboxSubmenu" class="submenu collapse  list-unstyled">
                        <li><a class="nav-link " href="mailbox.html">Inbox</a></li>
                        <li><a class="nav-link " href="mailbox-compose.html">Compose</a></li>
                        <li><a class="nav-link " href="mailbox-view.html">View Message</a></li>
                    </ul>
                </li>
            </ul>
        </div>

        <div class="menu-section">
            <div class="menu-section-title">Interface</div>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link has-submenu " href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#componentsSubmenu" aria-expanded="false">
                        <i class="bi bi-layout-wtf"></i>
                        <span>Components</span>
                    </a>
                    <ul id="componentsSubmenu" class="submenu collapse  list-unstyled">
                        <li><a class="nav-link " href="buttons.html">Buttons</a></li>
                        <li><a class="nav-link " href="alerts.html">Alerts</a></li>
                        <li><a class="nav-link " href="modals.html">Modals</a></li>
                        <li><a class="nav-link " href="tabs.html">Tabs</a></li>
                        <li><a class="nav-link " href="accordion.html">Accordion</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link has-submenu " href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#formsSubmenu" aria-expanded="false">
                        <i class="bi bi-card-list"></i>
                        <span>Forms</span>
                    </a>
                    <ul id="formsSubmenu" class="submenu collapse  list-unstyled">
                        <li><a class="nav-link " href="basic-form-element.html">Basic Forms</a></li>
                        <li><a class="nav-link " href="advance-form-element.html">Advanced Forms</a></li>
                        <li><a class="nav-link " href="password-meter.html">Password Meter</a></li>
                        <li><a class="nav-link " href="multi-upload.html">File Upload</a></li>
                        <li><a class="nav-link " href="images-cropper.html">Image Cropper</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link has-submenu " href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#chartsSubmenu" aria-expanded="false">
                        <i class="bi bi-bar-chart"></i>
                        <span>Charts</span>
                    </a>
                    <ul id="chartsSubmenu" class="submenu collapse  list-unstyled">
                        <li><a class="nav-link " href="line-charts.html">Line Charts</a></li>
                        <li><a class="nav-link " href="area-charts.html">Area Charts</a></li>
                        <li><a class="nav-link " href="bar-charts.html">Bar Charts</a></li>
                        <li><a class="nav-link " href="c3.html">C3 Charts</a></li>
                        <li><a class="nav-link " href="peity.html">Peity Charts</a></li>
                        <li><a class="nav-link " href="rounded-chart.html">Rounded Charts</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link has-submenu " href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#tablesSubmenu" aria-expanded="false">
                        <i class="bi bi-table"></i>
                        <span>Tables</span>
                    </a>
                    <ul id="tablesSubmenu" class="submenu collapse  list-unstyled">
                        <li><a class="nav-link " href="static-table.html">Static Tables</a></li>
                        <li><a class="nav-link " href="data-table.html">Data Tables</a></li>
                    </ul>
                </li>
            </ul>
        </div>

        <div class="menu-section">
            <div class="menu-section-title">Developer Tools</div>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link " href="code-editor.html">
                        <i class="bi bi-code-slash"></i>
                        <span>Code Editor</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link has-submenu " href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#uiToolsSubmenu" aria-expanded="false">
                        <i class="bi bi-tools"></i>
                        <span>UI Components</span>
                    </a>
                    <ul id="uiToolsSubmenu" class="submenu collapse  list-unstyled">
                        <li><a class="nav-link " href="preloader.html">Preloaders</a></li>
                        <li><a class="nav-link " href="notifications.html">Notifications</a></li>
                        <li><a class="nav-link " href="tree-view.html">Tree View</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link has-submenu " href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#viewersSubmenu" aria-expanded="false">
                        <i class="bi bi-eye"></i>
                        <span>Viewers</span>
                    </a>
                    <ul id="viewersSubmenu" class="submenu collapse  list-unstyled">
                        <li><a class="nav-link " href="pdf-viewer.html">PDF Viewer</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link has-submenu " href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#mapsSubmenu" aria-expanded="false">
                        <i class="bi bi-map"></i>
                        <span>Maps</span>
                    </a>
                    <ul id="mapsSubmenu" class="submenu collapse  list-unstyled">
                        <li><a class="nav-link " href="google-map.html">Interactive Maps</a></li>
                        <li><a class="nav-link " href="data-maps.html">Data Maps</a></li>
                    </ul>
                </li>
            </ul>
        </div>

        <div class="menu-section">
            <div class="menu-section-title">Pages</div>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link has-submenu " href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#authSubmenu" aria-expanded="false">
                        <i class="bi bi-shield-lock"></i>
                        <span>Authentication</span>
                    </a>
                    <ul id="authSubmenu" class="submenu collapse  list-unstyled">
                        <li><a class="nav-link " href="login.jsp">Login</a></li>
                        <li><a class="nav-link " href="register.html">Register</a></li>
                        <li><a class="nav-link " href="lock.html">Lock Screen</a></li>
                        <li><a class="nav-link " href="password-recovery.html">Forgot Password</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link has-submenu " href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#errorsSubmenu" aria-expanded="false">
                        <i class="bi bi-exclamation-triangle"></i>
                        <span>Error Pages</span>
                    </a>
                    <ul id="errorsSubmenu" class="submenu collapse  list-unstyled">
                        <li><a class="nav-link " href="404.html">404 Error</a></li>
                        <li><a class="nav-link " href="500.html">500 Error</a></li>
                    </ul>
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
            <!-- Hamburger Menu -->
            <button type="button" class="hamburger-menu" id="sidebarToggle" aria-label="Toggle sidebar" aria-controls="sidebar">
                <i class="bi bi-list"></i>
            </button>

            <!-- Breadcrumb for desktop -->
            <nav aria-label="Header breadcrumb" class="d-none d-lg-block ms-3">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a href="dashboard.jsp">Home</a></li>
                    <li class="breadcrumb-item active">All courses</li>
                </ol>
            </nav>

            <!-- Logo for mobile -->
            <div class="navbar-brand d-lg-none fw-bold me-auto">Kiaalap</div>

            <!-- Spacer for desktop -->
            <div class="flex-grow-1 d-none d-lg-block"></div>

            <!-- Right Actions -->
            <div class="d-flex align-items-center gap-2">
                <!-- Search -->
                <div class="search-container">
                    <button type="button" class="btn btn-light btn-icon" id="searchToggle" aria-label="Open search" aria-controls="searchForm">
                        <i class="bi bi-search"></i>
                    </button>

                    <div class="search-form" id="searchForm" role="search" aria-label="Site search">
                        <i class="bi bi-search search-icon"></i>
                        <input type="text"
                               class="form-control"
                               id="searchInput" aria-label="Search pages"
                               placeholder="Search..."
                               data-bs-toggle="dropdown">
                        <button type="button" class="close-search" id="closeSearch" aria-label="Close search">
                            <i class="bi bi-x-lg"></i>
                        </button>

                        <ul class="dropdown-menu w-100 mt-2">
                            <li><a class="dropdown-item" href="#">Student Registration</a></li>
                            <li><a class="dropdown-item" href="#">Course Management</a></li>
                            <li><a class="dropdown-item" href="#">Grade Submission</a></li>
                            <li><a class="dropdown-item" href="#">Faculty Directory</a></li>
                            <li><a class="dropdown-item" href="#">Library Resources</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="#">Advanced Search</a></li>
                        </ul>
                    </div>
                </div>

                <!-- Notifications -->
                <div class="dropdown">
                    <button type="button" class="btn btn-light btn-icon position-relative" data-bs-toggle="dropdown" id="notificationsToggle" aria-label="Notifications">
                        <i class="bi bi-bell"></i>
                        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" style="font-size: 0.6rem;">3</span>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end" style="width: 320px;">
                        <li class="dropdown-header d-flex align-items-center justify-content-between">
                            <span>Notifications</span>
                            <small class="text-muted">3 new</small>
                        </li>
                        <li><hr class="dropdown-divider"></li>
                        <li>
                            <a class="dropdown-item py-2" href="#">
                                <div class="d-flex align-items-center">
                                    <div class="rounded-circle bg-primary bg-opacity-10 p-2 me-3" style="width: 40px; height: 40px;">
                                        <i class="bi bi-calendar-check text-primary"></i>
                                    </div>
                                    <div class="flex-grow-1">
                                        <div class="fw-semibold">New Event</div>
                                        <div class="text-muted small">Science Fair on March 15</div>
                                        <div class="text-muted small">5 minutes ago</div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a class="dropdown-item py-2" href="#">
                                <div class="d-flex align-items-center">
                                    <div class="rounded-circle bg-success bg-opacity-10 p-2 me-3" style="width: 40px; height: 40px;">
                                        <i class="bi bi-check-circle text-success"></i>
                                    </div>
                                    <div class="flex-grow-1">
                                        <div class="fw-semibold">Assignment Submitted</div>
                                        <div class="text-muted small">John submitted his project</div>
                                        <div class="text-muted small">2 hours ago</div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a class="dropdown-item py-2" href="#">
                                <div class="d-flex align-items-center">
                                    <div class="rounded-circle bg-warning bg-opacity-10 p-2 me-3" style="width: 40px; height: 40px;">
                                        <i class="bi bi-exclamation-triangle text-warning"></i>
                                    </div>
                                    <div class="flex-grow-1">
                                        <div class="fw-semibold">System Alert</div>
                                        <div class="text-muted small">Database backup completed</div>
                                        <div class="text-muted small">Yesterday</div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li><hr class="dropdown-divider"></li>
                        <li>
                            <a class="dropdown-item text-center" href="notifications.html">
                                <small>View all notifications</small>
                            </a>
                        </li>
                    </ul>
                </div>

                <!-- Quick Actions -->
                <div class="dropdown">
                    <button type="button" class="btn btn-light btn-icon" data-bs-toggle="dropdown" aria-label="Quick actions">
                        <i class="bi bi-plus-lg"></i>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="add-student.html"><i class="bi bi-person-plus me-2"></i>Add Student</a></li>
                        <li><a class="dropdown-item" href="ajouterCours.jsp"><i class="bi bi-book me-2"></i>Add Course</a></li>
                        <li><a class="dropdown-item" href="ajouterEnseignant.jsp"><i class="bi bi-person-badge me-2"></i>Add Professor</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#"><i class="bi bi-calendar-plus me-2"></i>Schedule Event</a></li>
                    </ul>
                </div>

                <!-- User Menu -->
                <div class="dropdown">
                    <button type="button" class="btn btn-light d-flex align-items-center" data-bs-toggle="dropdown" aria-label="Sarah Johnson account menu">
                        <span class="user-avatar me-2">
                            SJ
                        </span>
                        <span class="d-none d-md-inline">Sarah Johnson</span>
                        <i class="bi bi-chevron-down ms-1"></i>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="#"><i class="bi bi-person me-2"></i>Profile</a></li>
                        <li><a class="dropdown-item" href="#"><i class="bi bi-gear me-2"></i>Settings</a></li>
                        <li><a class="dropdown-item" href="#"><i class="bi bi-question-circle me-2"></i>Help Center</a></li>
                        <li><hr class="dropdown-divider"></li>
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
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h1 class="h3 font-bold mb-1">All Courses</h1>
                        <p class="text-muted">Manage your institution's course catalog</p>
                    </div>
                    <div>
                        <button type="button" class="btn btn-primary" onclick="window.location.href='ajouterCours.jsp'">
                            <i class="bi bi-plus-circle me-2"></i> Add New Course
                        </button>
                        <button type="button" class="btn btn-outline-secondary ms-2">
                            <i class="bi bi-download me-2"></i> Export
                        </button>
                    </div>
                </div>
            </div>

            <!-- Stats Row -->
            <div class="dashboard-grid grid-cols-4 mb-3">
                <div class="stats-card">
                    <div class="stats-card-label">Total Courses</div>
                    <div class="stats-card-value">156</div>
                    <span class="stats-card-change positive">+12% from last month</span>
                </div>
                <div class="stats-card">
                    <div class="stats-card-label">Active Courses</div>
                    <div class="stats-card-value">142</div>
                    <span class="stats-card-change positive">+8 new</span>
                </div>
                <div class="stats-card">
                    <div class="stats-card-label">Total Students</div>
                    <div class="stats-card-value">3,245</div>
                    <span class="stats-card-change positive">+18%</span>
                </div>
                <div class="stats-card">
                    <div class="stats-card-label">Avg. Enrollment</div>
                    <div class="stats-card-value">21</div>
                    <span class="stats-card-change negative">-2</span>
                </div>
            </div>

            <!-- Filters Row -->
            <div class="dashboard-card mb-3">
                <div class="dashboard-grid grid-cols-4 mb-3">
                    <div>
                        <label for="departmentFilter" class="form-label small">Department</label>
                        <select class="form-select" id="departmentFilter">
                            <option selected>All Departments</option>
                            <option value="1">Computer Science</option>
                            <option value="2">Mathematics</option>
                            <option value="3">Physics</option>
                            <option value="4">Chemistry</option>
                            <option value="5">Biology</option>
                        </select>
                    </div>
                    <div>
                        <label for="semesterFilter" class="form-label small">Semester</label>
                        <select class="form-select" id="semesterFilter">
                            <option selected>All Semesters</option>
                            <option value="1">Fall 2025</option>
                            <option value="2">Spring 2025</option>
                            <option value="3">Summer 2025</option>
                        </select>
                    </div>
                    <div>
                        <label for="statusFilter" class="form-label small">Status</label>
                        <select class="form-select" id="statusFilter">
                            <option selected>All Status</option>
                            <option value="1">Active</option>
                            <option value="2">Inactive</option>
                            <option value="3">Completed</option>
                        </select>
                    </div>
                    <div>
                        <label for="searchFilter" class="form-label small">Search</label>
                        <input type="text" class="form-control" id="searchFilter" placeholder="Search courses...">
                    </div>
                </div>
            </div>

            <!-- Courses Table -->
            <div class="dashboard-card">
                <div class="table-responsive">
                    <table class="table table-hover align-middle">
                        <thead>
                            <tr>
                                <th scope="col">
                                    <input class="form-check-input" type="checkbox" id="selectAll">
                                </th>
                                <th scope="col">Course Code</th>
                                <th scope="col">Course Name</th>
                                <th scope="col">Department</th>
                                <th scope="col">Professor</th>
                                <th scope="col">Credits</th>
                                <th scope="col">Students</th>
                                <th scope="col">Status</th>
                                <th scope="col">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- LIGNE 1 -->
                            <tr>
                                <td>
                                    <input class="form-check-input" type="checkbox">
                                </td>
                                <td class="fw-semibold">CS101</td>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <img src="https://images.unsplash.com/photo-1517077304055-6e89abbf09b0?w=50&h=50&fit=crop"
                                             alt="Course"
                                             class="rounded me-3"
                                             width="40"
                                             height="40"
                                             loading="lazy">
                                        <div>
                                            <div class="fw-semibold">Introduction to Computer Science</div>
                                            <small class="text-muted">Mon, Wed, Fri - 10:00 AM</small>
                                        </div>
                                    </div>
                                </td>
                                <td>Computer Science</td>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <img src="https://ui-avatars.com/api/?name=John+Smith&background=6366f1&color=fff"
                                             alt="Professor"
                                             class="rounded-circle me-2"
                                             width="30"
                                             height="30"
                                             loading="lazy">
                                        <span>Dr. John Smith</span>
                                    </div>
                                </td>
                                <td>3</td>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <span>45</span>
                                        <div class="progress ms-2" style="width: 60px; height: 6px;">
                                            <div class="progress-bar bg-success" role="progressbar" style="width: 90%" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                </td>
                                <td><span class="badge bg-success">Active</span></td>
                                <td>
                                    <div class="dropdown">
                                        <button type="button" class="btn btn-sm btn-light" data-bs-toggle="dropdown" aria-label="More options">
                                            <i aria-hidden="true" class="bi bi-three-dots-vertical"></i>
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="course-info.html"><i class="bi bi-eye me-2"></i> View</a></li>
                                            <li><a class="dropdown-item" href="edit-course.html"><i class="bi bi-pencil me-2"></i> Edit</a></li>
                                            <li><a class="dropdown-item" href="#"><i class="bi bi-people me-2"></i> Students</a></li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li><a class="dropdown-item text-danger" href="#"><i class="bi bi-trash me-2"></i> Delete</a></li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            <!-- LIGNE 2 -->
                            <tr>
                                <td>
                                    <input class="form-check-input" type="checkbox">
                                </td>
                                <td class="fw-semibold">MATH201</td>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <img src="https://images.unsplash.com/photo-1635070041078-e363dbe005cb?w=50&h=50&fit=crop"
                                             alt="Course"
                                             class="rounded me-3"
                                             width="40"
                                             height="40"
                                             loading="lazy">
                                        <div>
                                            <div class="fw-semibold">Calculus II</div>
                                            <small class="text-muted">Tue, Thu - 2:00 PM</small>
                                        </div>
                                    </div>
                                </td>
                                <td>Mathematics</td>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <img src="https://ui-avatars.com/api/?name=Emily+Chen&background=10b981&color=fff"
                                             alt="Professor"
                                             class="rounded-circle me-2"
                                             width="30"
                                             height="30"
                                             loading="lazy">
                                        <span>Dr. Emily Chen</span>
                                    </