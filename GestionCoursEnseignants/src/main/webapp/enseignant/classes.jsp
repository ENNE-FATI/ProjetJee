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
    <title>My Courses — ENSA</title>

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
            --ensa-green: #194b38;
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

        /* --- COURSE GRID --- */
        .course-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 1.5rem;
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .course-card {
            background: #fff !important;
            border: 1px solid #e9ecef !important;
            border-radius: 16px;
            overflow: hidden;
            transition: all 0.3s ease;
            height: 100%;
            display: flex;
            flex-direction: column;
        }
        .course-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
            border-color: var(--ensa-yellow) !important;
        }

        .course-cover {
            height: 120px;
            background: linear-gradient(135deg, var(--ensa-yellow) 0%, #f5a623 100%);
            position: relative;
            display: flex;
            align-items: flex-end;
            padding: 1rem;
        }
        .course-code {
            background: rgba(255, 255, 255, 0.9);
            color: var(--ensa-dark);
            font-weight: 800;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 0.85rem;
            letter-spacing: 1px;
        }

        .course-body { padding: 1.5rem; flex-grow: 1; display: flex; flex-direction: column; }
        .course-title { font-size: 1.25rem; font-weight: 700; color: var(--ensa-dark) !important; margin-bottom: 0.5rem; }
        .course-meta { font-size: 0.9rem; color: #6c757d !important; margin-bottom: 1.5rem; }

        .btn-view {
            margin-top: auto;
            align-self: flex-start;
            background-color: var(--ensa-yellow);
            color: var(--ensa-dark);
            font-weight: 700;
            border: none;
            padding: 8px 20px;
            border-radius: 8px;
            transition: 0.2s;
            cursor: pointer;
        }
        .btn-view:hover { background-color: var(--ensa-yellow-hover); color: var(--ensa-dark); }

        /* --- COURSE DETAILS POPUP --- */
        .course-modal .modal-content { border: 0; border-radius: 20px; overflow: hidden; box-shadow: 0 20px 60px rgba(0,0,0,.25); }
        .course-modal-hero {
            background: linear-gradient(135deg, var(--ensa-green) 0%, #123b2d 100%);
            padding: 28px 28px 24px;
            position: relative;
            color: #fff;
        }
        .course-modal-hero .btn-close {
            position: absolute; top: 18px; right: 18px;
            filter: invert(1) grayscale(1) brightness(2);
            opacity: .8;
        }
        .course-modal-code {
            display: inline-block;
            background: var(--ensa-yellow);
            color: var(--ensa-dark);
            font-weight: 800;
            font-size: .8rem;
            letter-spacing: 1.5px;
            padding: 5px 14px;
            border-radius: 20px;
            margin-bottom: 14px;
        }
        .course-modal-title { color: #fff !important; font-size: 1.6rem; font-weight: 800; margin: 0; }

        .info-grid { display: grid; grid-template-columns: repeat(2, 1fr); gap: 14px; margin-bottom: 22px; }
        .info-item {
            background: #f8f9fb;
            border: 1px solid #eceff3;
            border-radius: 14px;
            padding: 14px 16px;
            display: flex; align-items: center; gap: 14px;
        }
        .info-item.full { grid-column: 1 / -1; }
        .info-icon {
            width: 42px; height: 42px; flex-shrink: 0;
            border-radius: 12px;
            background: rgba(255,188,59,.18);
            color: #c98400;
            display: flex; align-items: center; justify-content: center;
        }
        .info-label { font-size: .72rem; text-transform: uppercase; letter-spacing: 1px; color: #8a94a0; font-weight: 700; }
        .info-value { font-size: 1.02rem; font-weight: 700; color: var(--ensa-dark); }

        .action-title { font-size: .75rem; text-transform: uppercase; letter-spacing: 1.5px; color: #8a94a0; font-weight: 700; margin-bottom: 10px; }
        .action-row { display: grid; grid-template-columns: repeat(2, 1fr); gap: 12px; }
        .action-btn {
            display: flex; align-items: center; justify-content: center; gap: 8px;
            padding: 13px 14px; border-radius: 12px;
            font-weight: 700; text-decoration: none; border: 0; cursor: pointer;
            transition: .2s; font-size: .95rem;
        }
        .action-btn.primary { background: var(--ensa-yellow); color: var(--ensa-dark); }
        .action-btn.primary:hover { background: var(--ensa-yellow-hover); color: var(--ensa-dark); }
        .action-btn.secondary { background: #fff; color: var(--ensa-green); border: 2px solid var(--ensa-green); }
        .action-btn.secondary:hover { background: var(--ensa-green); color: #fff; }

        @media (max-width: 575px) {
            .info-grid, .action-row { grid-template-columns: 1fr; }
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

                <li><a class="side-link active" href="${pageContext.request.contextPath}/enseignant/classes"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M22 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg><span class="side-label ms-2">My Courses</span></a></li>

                <%-- IMPORTANT : on passe par le SERVLET (et non ressources.jsp) pour charger les cours --%>
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/ressources"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75"><rect x="3" y="3" width="18" height="18" rx="2"/><path d="M3 9h18M3 15h18M9 3v18M15 9v12"/></svg><span class="side-label ms-2">My Ressources</span></a></li>


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
                    <p class="eyebrow text-uppercase text-warning small fw-bold mb-1">Current Year</p>
                    <h1 id="page-title" class="fw-bold mb-2">My Courses</h1>
                    <p class="lede text-muted">Manage your assigned courses and classes.</p>
                </div>
            </section>

            <c:if test="${not empty erreur}">
                <div class="alert alert-danger rounded-3 border-0 shadow-sm"><c:out value="${erreur}"/></div>
            </c:if>

            <!-- COURSE GRID -->
            <ul class="course-grid">
                <c:forEach var="aff" items="${listeClasses}">
                    <li>
                        <article class="course-card">
                            <div class="course-cover">
                                <span class="course-code"><c:out value="${aff.cours.code}"/></span>
                            </div>
                            <div class="course-body">
                                <h2 class="course-title"><c:out value="${aff.cours.intitule}"/></h2>
                                <p class="course-meta"><i class="bi bi-calendar me-1"></i> Year: <c:out value="${aff.anneeUniversitaire.libelle}"/></p>

                                <!-- Bouton qui ouvre le popup avec les détails du cours -->
                                <button type="button" class="btn-view js-view-course"
                                        data-id="${aff.cours.id}"
                                        data-code="<c:out value='${aff.cours.code}'/>"
                                        data-intitule="<c:out value='${aff.cours.intitule}'/>"
                                        data-volume="${aff.cours.volumeHoraire}"
                                        data-year="<c:out value='${aff.anneeUniversitaire.libelle}'/>">
                                    View Course
                                </button>
                            </div>
                        </article>
                    </li>
                </c:forEach>
                <c:if test="${empty listeClasses}">
                    <div class="col-12 text-center py-5">
                        <h4 class="text-muted">No courses found.</h4>
                        <p class="text-muted small">You have not been assigned to any courses yet.</p>
                    </div>
                </c:if>
            </ul>
        </main>

        <footer class="app-footer text-center py-4 text-muted small">
            <p class="mb-0">© 2024 ENSA · Teacher Portal</p>
        </footer>
    </div>
</div>

<!-- ================= POPUP : DÉTAILS DU COURS ================= -->
<div class="modal fade course-modal" id="courseModal" tabindex="-1" aria-labelledby="courseModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">

            <div class="course-modal-hero">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <span class="course-modal-code" id="cmCode">CODE</span>
                <h2 class="course-modal-title" id="courseModalTitle">Course title</h2>
            </div>

            <div class="modal-body p-4">
                <div class="info-grid">
                    <div class="info-item">
                        <div class="info-icon">
                            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 2"/></svg>
                        </div>
                        <div>
                            <div class="info-label">Total hours</div>
                            <div class="info-value"><span id="cmVolume">0</span> h</div>
                        </div>
                    </div>

                    <div class="info-item">
                        <div class="info-icon">
                            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="4" width="18" height="18" rx="2"/><path d="M16 2v4M8 2v4M3 10h18"/></svg>
                        </div>
                        <div>
                            <div class="info-label">Academic year</div>
                            <div class="info-value" id="cmYear">-</div>
                        </div>
                    </div>

                    <div class="info-item full">
                        <div class="info-icon">
                            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
                        </div>
                        <div>
                            <div class="info-label">Teacher</div>
                            <div class="info-value"><c:out value="${sessionScope.user.prenom}"/> <c:out value="${sessionScope.user.nom}"/></div>
                        </div>
                    </div>
                </div>

                <p class="action-title">Quick actions</p>
                <div class="action-row">
                    <a class="action-btn primary" href="${pageContext.request.contextPath}/enseignant/ressources">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4M17 8l-5-5-5 5M12 3v12"/></svg>
                        Add a resource
                    </a>
                    <button type="button" class="action-btn secondary" id="cmZoomBtn">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polygon points="23 7 16 12 23 17 23 7"/><rect x="1" y="5" width="15" height="14" rx="2" ry="2"/></svg>
                        Schedule Zoom
                    </button>
                </div>
            </div>

        </div>
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
                        <select class="form-select" name="cours_id" id="zoomCoursSelect" required>
                            <option value="">Choose a course...</option>
                            <c:forEach var="aff" items="${listeClasses}">
                                <option value="${aff.cours.id}"><c:out value="${aff.cours.intitule}"/></option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Date &amp; Time</label>
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

<script src="${pageContext.request.contextPath}/enseignant/js/vendor/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        document.documentElement.setAttribute('data-bs-theme', 'light');

        /* ---------- Thème ---------- */
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

        /* ---------- Popup "View Course" ---------- */
        const courseModalEl = document.getElementById('courseModal');
        const zoomModalEl = document.getElementById('addZoomModal');
        const courseModal = new bootstrap.Modal(courseModalEl);
        const zoomModal = new bootstrap.Modal(zoomModalEl);
        let currentCourseId = '';

        document.querySelectorAll('.js-view-course').forEach(button => {
            button.addEventListener('click', () => {
                const d = button.dataset;
                currentCourseId = d.id || '';

                // textContent => pas de risque d'injection HTML
                document.getElementById('cmCode').textContent = d.code || '';
                document.getElementById('courseModalTitle').textContent = d.intitule || '';
                document.getElementById('cmVolume').textContent = d.volume || '0';
                document.getElementById('cmYear').textContent = d.year || '-';

                courseModal.show();
            });
        });

        // Bouton "Schedule Zoom" du popup : ferme le popup et ouvre le formulaire Zoom avec le cours présélectionné
        document.getElementById('cmZoomBtn').addEventListener('click', () => {
            courseModalEl.addEventListener('hidden.bs.modal', function openZoom() {
                courseModalEl.removeEventListener('hidden.bs.modal', openZoom);
                const select = document.getElementById('zoomCoursSelect');
                if (select) select.value = currentCourseId;
                zoomModal.show();
            });
            courseModal.hide();
        });
    });
</script>
</body>
</html>