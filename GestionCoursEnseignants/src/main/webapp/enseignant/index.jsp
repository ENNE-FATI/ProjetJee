<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%-- SECURITY CHECK --%>
<%
    if (session.getAttribute("user") == null && session.getAttribute("adminConnecte") == null) {
        response.sendRedirect(request.getContextPath() + "/public/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <script>
        document.documentElement.classList.add('js');
        (function(){
            try{
                var d=document.documentElement,t=localStorage.getItem('gradebook-theme');
                if(!t&&window.matchMedia&&window.matchMedia('(prefers-color-scheme: dark)').matches)t='dark';
                d.setAttribute('data-bs-theme',t==='dark'?'dark':'light');
                if(localStorage.getItem('gradebook-sidebar')==='collapsed')d.classList.add('sidebar-collapsed')
            }catch(e){}
        })();
    </script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dashboard — ENSA</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/enseignant/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/enseignant/css/style.css?v=20261103.1">
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@600;800&display=swap" rel="stylesheet">

    <style>
        :root {
            --ensa-yellow: #ffbc3b;
            --ensa-yellow-hover: #e0a330;
            --ensa-dark: #222;
        }

        body {
            font-family: 'Montserrat', sans-serif;
            background-color: #f4f6f9;
        }

        /* --- STAT CARDS --- */
        .stat-card { 
            background: #fff; 
            border: 1px solid #e9ecef; 
            border-radius: 16px; 
            padding: 1.5rem; 
            transition: all 0.3s ease; 
        }
        .stat-card:hover { 
            transform: translateY(-5px); 
            box-shadow: 0 10px 25px rgba(0,0,0,0.08); 
            border-color: var(--ensa-yellow);
        }
        .stat-icon { 
            width: 56px; height: 56px; 
            border-radius: 12px; 
            display: flex; align-items: center; justify-content: center; 
            font-size: 1.5rem; 
        }
        .stat-icon.yellow { background: rgba(255, 188, 59, 0.15); color: var(--ensa-yellow); }
        .stat-icon.red { background: rgba(220, 53, 69, 0.1); color: #dc3545; }
        .stat-icon.blue { background: rgba(13, 110, 253, 0.1); color: #0d6efd; }

        /* --- BUTTONS --- */
        .btn-primary {
            background-color: var(--ensa-yellow);
            border-color: var(--ensa-yellow);
            color: var(--ensa-dark);
            font-weight: 700;
        }
        .btn-primary:hover {
            background-color: var(--ensa-yellow-hover);
            border-color: var(--ensa-yellow-hover);
            color: var(--ensa-dark);
        }

        /* --- SIDEBAR --- */
        .sidebar-head .brand-name {
            font-weight: 800;
            color: var(--ensa-yellow);
        }
        .side-link.active {
            background-color: rgba(255, 188, 59, 0.1);
            color: var(--ensa-yellow);
            border-left: 3px solid var(--ensa-yellow);
        }

        /* --- THEME TOGGLE --- */
        .theme-toggle-btn { 
            background: #fff; border: 1px solid #e9ecef; color: #333; 
            border-radius: 8px; width: 40px; height: 40px; 
            display: flex; align-items: center; justify-content: center; 
            cursor: pointer; transition: 0.2s;
        }
        .theme-toggle-btn:hover { background: #f8f9fa; border-color: var(--ensa-yellow); }

        /* --- TABLE --- */
        .table-hover tbody tr:hover {
            background-color: rgba(255, 188, 59, 0.05);
        }
    </style>
</head>
<body class="page-gradebook">
<a class="skip-link" href="#main">Skip to main content</a>

<div class="app">
    <!-- ================= SIDEBAR ================= -->
    <aside class="sidebar offcanvas-lg offcanvas-start" id="sidebar" tabindex="-1" aria-label="Sidebar">
        <div class="sidebar-head">
            <a class="brand" href="${pageContext.request.contextPath}/enseignant/dashboard">
                <span class="brand-mark" style="background: var(--ensa-yellow); color: #fff; padding: 5px; border-radius: 8px;">
                    <svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="24" height="24"><path d="M2 5.5C4.8 4.3 8.6 4.4 12 6.3c3.4-1.9 7.2-2 10-.8V19c-2.8-1.2-6.6-1.1-10 .8-3.4-1.9-7.2-2-10-.8Z"/><path d="M12 6.3v13.5"/></svg>
                </span>
                <span class="brand-text ms-2">
                    <span class="brand-name">ENSA</span>
                    <span class="brand-sub text-muted" style="font-size: 0.7rem;">Teacher Portal</span>
                </span>
            </a>
            <button type="button" class="icon-btn sidebar-close d-lg-none js-only" data-bs-dismiss="offcanvas" data-bs-target="#sidebar"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75"><path d="M18 6 6 18M6 6l12 12"/></svg></button>
        </div>
        <nav class="sidebar-nav" aria-label="Main">
            <p class="side-heading text-uppercase text-muted small fw-bold mt-3">Teaching</p>
            <ul class="side-list">
                <li><a class="side-link active" href="${pageContext.request.contextPath}/enseignant/dashboard"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75"><rect x="3" y="3" width="7" height="9" rx="1.5"/><rect x="14" y="3" width="7" height="5" rx="1.5"/><rect x="14" y="12" width="7" height="9" rx="1.5"/><rect x="3" y="16" width="7" height="5" rx="1.5"/></svg><span class="side-label ms-2">Dashboard</span></a></li>
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/classes"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M22 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg><span class="side-label ms-2">My Courses</span></a></li>
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/gradebook.jsp"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75"><rect x="3" y="3" width="18" height="18" rx="2"/><path d="M3 9h18M3 15h18M9 3v18M15 9v12"/></svg><span class="side-label ms-2">Gradebook</span></a></li>
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/assignments.jsp"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75"><rect x="8" y="2" width="8" height="4" rx="1"/><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"/><path d="m9 14 2 2 4-4"/></svg><span class="side-label ms-2">Assignments</span></a></li>
            </ul>
            <p class="side-heading text-uppercase text-muted small fw-bold mt-3">Account</p>
            <ul class="side-list">
                <li><a class="side-link" href="${pageContext.request.contextPath}/logout"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4M16 17l5-5-5-5M21 12H9"/></svg><span class="side-label ms-2">Sign out</span></a></li>
            </ul>
        </nav>
    </aside>

    <div class="app-main">
        <!-- ================= TOPBAR ================= -->
        <header class="topbar bg-white shadow-sm px-4 py-3 d-flex align-items-center">
            <button type="button" class="icon-btn d-lg-none js-only" data-bs-toggle="offcanvas" data-bs-target="#sidebar"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75"><path d="M4 6h16M4 12h16M4 18h16"/></svg></button>

            <div class="ms-auto d-flex align-items-center gap-3">
                <!-- WELCOME NAME -->
                <span class="text-muted small d-none d-sm-inline">Welcome, <strong>${prenomEnseignant} ${nomEnseignant}</strong></span>

                <!-- NOTIFICATIONS -->
                <div class="dropdown">
                    <button type="button" class="theme-toggle-btn position-relative" data-bs-toggle="dropdown" aria-expanded="false" title="Notifications">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"/><path d="M13.73 21a2 2 0 0 1-3.46 0"/></svg>
                        <c:if test="${nbNotifications > 0}">
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" style="font-size: 0.6rem;">
                                    ${nbNotifications}
                            </span>
                        </c:if>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end shadow border-0" style="width: 320px; max-height: 400px; overflow-y: auto;">
                        <li><h6 class="dropdown-header text-uppercase small fw-bold">Notifications</h6></li>
                        <c:forEach var="n" items="${notifications}">
                            <c:if test="${not n.lue}">
                                <li>
                                    <a class="dropdown-item text-wrap border-bottom py-3" href="#">
                                        <small class="text-muted d-block mb-1" style="font-size: 0.75rem;">${n.dateEnvoi}</small>
                                        <span class="d-block text-truncate fw-semibold" style="font-size: 0.9rem;">${n.message}</span>
                                    </a>
                                </li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${empty notifications or nbNotifications == 0}">
                            <li><span class="dropdown-item text-muted text-center py-4">No new notifications</span></li>
                        </c:if>
                    </ul>
                </div>

                <!-- THEME TOGGLE -->
                <button type="button" class="theme-toggle-btn" id="theme-toggle">
                    <svg id="icon-sun" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="display:none;"><circle cx="12" cy="12" r="4"/><path d="M12 2v2M12 20v2M4.93 4.93l1.41 1.41M17.66 17.66l1.41 1.41M2 12h2M20 12h2M6.34 17.66l-1.41 1.41M19.07 4.93l-1.41 1.41"/></svg>
                    <svg id="icon-moon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 3a6 6 0 0 0 9 9 9 9 0 1 1-9-9Z"/></svg>
                </button>
            </div>
        </header>

        <!-- ================= MAIN CONTENT ================= -->
        <main id="main" class="page page-wide p-4" tabindex="-1">
            <section class="page-head mb-5">
                <div class="page-head-text">
                    <p class="eyebrow text-uppercase text-warning small fw-bold mb-1">Dashboard</p>
                    <h1 id="page-title" class="fw-bold mb-2">Hello, ${prenomEnseignant} ${nomEnseignant}!</h1>
                    <p class="lede text-muted">Here is a summary of your teaching activities today.</p>
                </div>
            </section>

            <!-- STATS CARDS -->
            <div class="row g-4 mb-5">
                <div class="col-md-4">
                    <div class="stat-card d-flex align-items-center gap-3">
                        <div class="stat-icon yellow">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M4 19.5v-15A2.5 2.5 0 0 1 6.5 2H20v20H6.5a2.5 2.5 0 0 1 0-5H20"/></svg>
                        </div>
                        <div>
                            <p class="text-muted mb-1 small fw-semibold">My Courses</p>
                            <h2 class="mb-0 fw-bold">${nbCours != null ? nbCours : 0}</h2>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="stat-card d-flex align-items-center gap-3">
                        <div class="stat-icon red">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"/><path d="M13.73 21a2 2 0 0 1-3.46 0"/></svg>
                        </div>
                        <div>
                            <p class="text-muted mb-1 small fw-semibold">Unread Notifications</p>
                            <h2 class="mb-0 fw-bold">${nbNotifications != null ? nbNotifications : 0}</h2>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="stat-card d-flex align-items-center gap-3">
                        <div class="stat-icon blue">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polygon points="23 7 16 12 23 17 23 7"/><rect x="1" y="5" width="15" height="14" rx="2" ry="2"/></svg>
                        </div>
                        <div>
                            <p class="text-muted mb-1 small fw-semibold">Upcoming Zoom Sessions</p>
                            <h2 class="mb-0 fw-bold">${prochainesSeances != null ? prochainesSeances.size() : 0}</h2>
                        </div>
                    </div>
                </div>
            </div>

            <!-- CONTENT CARDS -->
            <div class="row g-4">
                <!-- MY COURSES -->
                <div class="col-lg-7">
                    <div class="card border-0 shadow-sm rounded-4 h-100">
                        <div class="card-header bg-white border-0 pt-4 px-4 pb-0 d-flex justify-content-between align-items-center">
                            <h5 class="mb-0 fw-bold">My Courses</h5>
                            <a href="${pageContext.request.contextPath}/enseignant/classes" class="btn btn-sm btn-light fw-semibold">View All</a>
                        </div>
                        <div class="card-body px-4">
                            <div class="table-responsive">
                                <table class="table table-hover align-middle">
                                    <thead class="table-light text-muted small text-uppercase">
                                        <tr>
                                            <th class="border-0 rounded-start">Code</th>
                                            <th class="border-0">Course Name</th>
                                            <th class="border-0 rounded-end text-end">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="c" items="${mesCours}">
                                        <tr>
                                            <td><span class="badge bg-light text-dark border">${c[1]}</span></td>
                                            <td class="fw-semibold">${c[2]}</td>
                                            <td class="text-end">
                                                <a href="#" class="btn btn-sm btn-light text-primary">
                                                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/></svg>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty mesCours}">
                                        <tr><td colspan="3" class="text-center text-muted py-5">No courses assigned.</td></tr>
                                    </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- NOTIFICATIONS & ZOOM -->
                <div class="col-lg-5">
                    <!-- Notifications -->
                    <div class="card border-0 shadow-sm rounded-4 mb-4">
                        <div class="card-header bg-white border-0 pt-4 px-4 pb-0">
                            <h5 class="mb-0 fw-bold">Latest Notifications</h5>
                        </div>
                        <div class="card-body px-4">
                            <ul class="list-group list-group-flush">
                                <c:forEach var="n" items="${notifications}">
                                    <li class="list-group-item px-0 py-3 border-bottom">
                                        <div class="d-flex w-100 justify-content-between align-items-start">
                                            <div class="me-3">
                                                <h6 class="mb-1 fw-semibold">${n.message}</h6>
                                                <small class="text-muted">${n.dateEnvoi}</small>
                                            </div>
                                            <c:if test="${n.lue}">
                                                <span class="badge bg-light text-secondary border" style="font-size: 0.65rem;">Read</span>
                                            </c:if>
                                        </div>
                                    </li>
                                </c:forEach>
                                <c:if test="${empty notifications}">
                                    <li class="list-group-item px-0 text-center text-muted py-5">No notifications.</li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                    
                    <!-- Zoom Sessions -->
                    <div class="card border-0 shadow-sm rounded-4">
                        <div class="card-header bg-white border-0 pt-4 px-4 pb-0">
                            <h5 class="mb-0 fw-bold">Upcoming Zoom Sessions</h5>
                        </div>
                        <div class="card-body px-4">
                            <ul class="list-group list-group-flush">
                                <c:forEach var="s" items="${prochainesSeances}">
                                    <li class="list-group-item px-0 py-3 border-bottom d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="mb-1 fw-semibold">${s[3]}</h6>
                                            <small class="text-muted">${s[1]}</small>
                                        </div>
                                        <a href="${s[2]}" target="_blank" class="btn btn-sm btn-primary rounded-pill px-3">Join</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${empty prochainesSeances}">
                                    <li class="list-group-item px-0 text-center text-muted py-5">No sessions scheduled.</li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        
        <footer class="app-footer text-center py-4 text-muted small">
            <p class="mb-0">© 2024 ENSA · Teacher Portal</p>
        </footer>
    </div>
</div>

<script src="${pageContext.request.contextPath}/enseignant/js/vendor/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const btn = document.getElementById('theme-toggle');
        const sun = document.getElementById('icon-sun');
        const moon = document.getElementById('icon-moon');
        const html = document.documentElement;
        let theme = html.getAttribute('data-bs-theme') || 'light';
        function updateIcons(t) {
            if (t === 'dark') { sun.style.display = 'block'; moon.style.display = 'none'; }
            else { sun.style.display = 'none'; moon.style.display = 'block'; }
        }
        updateIcons(theme);
        if (btn) {
            btn.addEventListener('click', () => {
                theme = theme === 'dark' ? 'light' : 'dark';
                html.setAttribute('data-bs-theme', theme);
                localStorage.setItem('gradebook-theme', theme);
                updateIcons(theme);
            });
        }
    });
</script>
</body>
</html>