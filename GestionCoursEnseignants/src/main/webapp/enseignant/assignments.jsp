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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Assignments — ENSA</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/enseignant/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/enseignant/css/style.css">
    
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

        /* FORCE LE MODE CLAIR */
        body {
            font-family: 'Montserrat', sans-serif;
            background-color: #f4f6f9 !important;
            color: #333 !important;
        }
        h1, h2, h3, h4, h5, h6 { color: var(--ensa-dark) !important; }

        /* --- SIDEBAR --- */
        .sidebar-head .brand-name { font-weight: 800; color: var(--ensa-yellow); }
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

        /* --- EMPTY STATE CARD --- */
        .empty-state-card {
            background: #fff !important;
            border: 1px dashed #ced4da !important;
            border-radius: 16px;
            padding: 4rem 2rem;
            text-align: center;
            transition: all 0.3s ease;
        }
        .empty-state-card:hover {
            border-color: var(--ensa-yellow) !important;
            background: rgba(255, 188, 59, 0.02) !important;
        }
        .empty-icon {
            width: 80px; height: 80px;
            background: rgba(255, 188, 59, 0.15);
            color: var(--ensa-yellow);
            border-radius: 50%;
            display: flex; align-items: center; justify-content: center;
            margin: 0 auto 1.5rem;
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
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/dashboard"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75"><rect x="3" y="3" width="7" height="9" rx="1.5"/><rect x="14" y="3" width="7" height="5" rx="1.5"/><rect x="14" y="12" width="7" height="9" rx="1.5"/><rect x="3" y="16" width="7" height="5" rx="1.5"/></svg><span class="side-label ms-2">Dashboard</span></a></li>
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/classes"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M22 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg><span class="side-label ms-2">My Courses</span></a></li>
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/gradebook.jsp"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75"><rect x="3" y="3" width="18" height="18" rx="2"/><path d="M3 9h18M3 15h18M9 3v18M15 9v12"/></svg><span class="side-label ms-2">Gradebook</span></a></li>
                
                <!-- LIEN ACTIF ICI -->
                <li><a class="side-link active" href="${pageContext.request.contextPath}/enseignant/assignments.jsp"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75"><rect x="8" y="2" width="8" height="4" rx="1"/><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"/><path d="m9 14 2 2 4-4"/></svg><span class="side-label ms-2">Assignments</span></a></li>

                <!-- BOUTON ZOOM AJOUTÉ ICI -->
                <li>
                    <a class="side-link" href="#" data-bs-toggle="modal" data-bs-target="#addZoomModal">
                        <svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75"><polygon points="23 7 16 12 23 17 23 7"/><rect x="1" y="5" width="15" height="14" rx="2" ry="2"/></svg>
                        <span class="side-label ms-2">Schedule Zoom</span>
                    </a>
                </li>
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
                <span class="text-muted small d-none d-sm-inline">Welcome, <strong>${sessionScope.user.prenom} ${sessionScope.user.nom}</strong></span>
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
                    <p class="eyebrow text-uppercase text-warning small fw-bold mb-1">Tasks</p>
                    <h1 id="page-title" class="fw-bold mb-2">Assignments</h1>
                    <p class="lede text-muted">Manage assignments for your classes.</p>
                </div>
            </section>

            <div class="row">
                <div class="col-12">
                    <!-- EMPTY STATE CARD -->
                    <div class="empty-state-card">
                        <div class="empty-icon">
                            <svg width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="8" y="2" width="8" height="4" rx="1"/><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"/><path d="m9 14 2 2 4-4"/></svg>
                        </div>
                        <h3>No Assignments Yet</h3>
                        <p class="text-muted mb-0">Assignment management is not yet activated in your database. Check back later.</p>
                    </div>
                </div>
            </div>
        </main>

        <footer class="app-footer text-center py-4 text-muted small">
            <p class="mb-0">© 2024 ENSA · Teacher Portal</p>
        </footer>
    </div>
</div>

<!-- ================= MODAL POUR AJOUTER UNE SÉANCE ZOOM ================= -->
<div class="modal fade" id="addZoomModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow-lg rounded-4">
            <div class="modal-header border-0 pb-0">
                <h5 class="modal-title fw-bold">Schedule Zoom Session</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body p-4">
                <form action="${pageContext.request.contextPath}/ajouterSeanceZoom" method="POST">
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Select Course</label>
                        <select class="form-select" name="cours_id" required>
                            <option value="">Choose a course...</option>
                            <c:forEach var="c" items="${mesCours}">
                                <option value="${c[0]}">${c[2]}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Date & Time</label>
                        <input type="datetime-local" class="form-control" name="dateHeure" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Duration (minutes)</label>
                        <input type="number" class="form-control" name="duree" placeholder="Ex: 60" required>
                    </div>
                    <div class="mb-4">
                        <label class="form-label fw-semibold">Zoom Link</label>
                        <input type="url" class="form-control" name="lienZoom" placeholder="https://zoom.us/j/..." required>
                    </div>
                    <input type="hidden" name="enseignant_id" value="${sessionScope.user.id}">
                    <button type="submit" class="btn btn-warning w-100 fw-bold text-dark">Schedule Session</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- SCRIPTS -->
<script src="${pageContext.request.contextPath}/enseignant/js/vendor/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        document.documentElement.setAttribute('data-bs-theme', 'light');
        
        const btn = document.getElementById('theme-toggle');
        const sun = document.getElementById('icon-sun');
        const moon = document.getElementById('icon-moon');
        const html = document.documentElement;
        let theme = 'light';

        function updateIcons(t) { 
            if (t === 'dark') { sun.style.display = 'block'; moon.style.display = 'none'; } 
            else { sun.style.display = 'none'; moon.style.display = 'block'; } 
        }
        updateIcons(theme);
        
        if (btn) {
            btn.addEventListener('click', () => {
                theme = theme === 'dark' ? 'light' : 'dark';
                html.setAttribute('data-bs-theme', theme);
                updateIcons(theme);
            });
        }
    });
</script>
</body>
</html>