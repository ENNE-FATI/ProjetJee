<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="ma.gestion.entity.Cours" %>
<%@ page import="ma.gestion.entity.Ressource" %>
<%@ page import="ma.gestion.entity.Enseignant" %>

<%!
    public String escapeHTML(Object value) {
        if (value == null) return "";
        return value.toString()
                .replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#39;");
    }
%>

<%
    Object userObj = session.getAttribute("user");

    if (userObj == null || !(userObj instanceof Enseignant)) {
        response.sendRedirect(request.getContextPath() + "/public/login.jsp");
        return;
    }
    Enseignant enseignant = (Enseignant) userObj;

    // Si la JSP est ouverte directement (sans passer par le servlet), on redirige vers le servlet
    if (request.getAttribute("mesCours") == null) {
        response.sendRedirect(request.getContextPath() + "/enseignant/ressources");
        return;
    }

    @SuppressWarnings("unchecked")
    List<Cours> mesCours = (List<Cours>) request.getAttribute("mesCours");
    @SuppressWarnings("unchecked")
    List<Ressource> listeRessources = (List<Ressource>) request.getAttribute("listeRessources");

    if (listeRessources == null) listeRessources = java.util.Collections.emptyList();

    String cp = request.getContextPath();
    String msg = request.getParameter("msg");

    String nomComplet = (enseignant.getPrenom() == null ? "" : enseignant.getPrenom())
            + " "
            + (enseignant.getNom() == null ? "" : enseignant.getNom());

    DateTimeFormatter fmt = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My Resources — ENSA</title>

    <link rel="stylesheet" href="<%= cp %>/enseignant/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="<%= cp %>/enseignant/css/style.css?v=20261103.1">

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
        .btn-primary:disabled { opacity: .5; cursor: not-allowed; }

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

        /* --- RESOURCES GRID --- */
        .res-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 1.5rem;
        }
        .res-card {
            background: #fff !important;
            border: 1px solid #e9ecef !important;
            border-radius: 16px;
            overflow: hidden;
            transition: all 0.3s ease;
            display: flex;
            flex-direction: column;
            height: 100%;
        }
        .res-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
            border-color: var(--ensa-yellow) !important;
        }
        .res-top {
            background: linear-gradient(135deg, var(--ensa-yellow) 0%, #f5a623 100%);
            padding: 1.25rem 1.5rem;
            color: #fff;
            font-size: 1.6rem;
            display: flex; align-items: center;
        }
        .res-body { padding: 1.5rem; flex-grow: 1; display: flex; flex-direction: column; }
        .res-title { font-size: 1.15rem; font-weight: 700; color: var(--ensa-dark) !important; margin-bottom: 0.75rem; word-break: break-word; }
        .res-meta { font-size: 0.9rem; color: #6c757d !important; margin-bottom: 0.4rem; }
        .btn-view {
            margin-top: auto;
            align-self: flex-start;
            background-color: var(--ensa-yellow);
            color: var(--ensa-dark);
            font-weight: 700;
            border: none;
            padding: 8px 20px;
            border-radius: 8px;
            text-decoration: none;
            transition: 0.2s;
        }
        .btn-view:hover { background-color: var(--ensa-yellow-hover); color: var(--ensa-dark); }

        .res-empty {
            grid-column: 1 / -1;
            background: #fff;
            border: 1px dashed #cbd0d7;
            border-radius: 18px;
            padding: 4rem 1rem;
            text-align: center;
        }

        /* ===== VERROU MODE CLAIR (même palette que index / classes) ===== */
        :root, [data-bs-theme="light"], [data-bs-theme="dark"] {
            color-scheme: light;
            --bs-body-bg: #f4f6f9;
            --bs-body-color: #333;
            --bs-border-color: #e9ecef;
            --bs-secondary-color: #6c757d;
            --bs-tertiary-bg: #f8f9fa;
            --bs-emphasis-color: #222;
        }
        .card, .modal-content, .dropdown-menu, .list-group-item,
        .topbar, .table, .form-control, .form-select {
            background-color: #fff !important;
            color: #333 !important;
            border-color: #e9ecef !important;
        }
        .text-muted { color: #6c757d !important; }
    </style>
</head>
<body class="page-gradebook">
<a class="skip-link" href="#main">Skip to main content</a>

<div class="app">
    <!-- ================= SIDEBAR (identique à index.jsp) ================= -->
    <aside class="sidebar offcanvas-lg offcanvas-start" id="sidebar" tabindex="-1" aria-label="Sidebar">
        <div class="sidebar-head">
            <a class="brand" href="<%= cp %>/enseignant/dashboard">
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
                <li><a class="side-link" href="<%= cp %>/enseignant/dashboard"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75"><rect x="3" y="3" width="7" height="9" rx="1.5"/><rect x="14" y="3" width="7" height="5" rx="1.5"/><rect x="14" y="12" width="7" height="9" rx="1.5"/><rect x="3" y="16" width="7" height="5" rx="1.5"/></svg><span class="side-label ms-2">Dashboard</span></a></li>
                <li><a class="side-link" href="<%= cp %>/enseignant/classes"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M22 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg><span class="side-label ms-2">My Courses</span></a></li>
                <li><a class="side-link active" href="<%= cp %>/enseignant/ressources"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75"><rect x="3" y="3" width="18" height="18" rx="2"/><path d="M3 9h18M3 15h18M9 3v18M15 9v12"/></svg><span class="side-label ms-2">My Ressources</span></a></li>

                <li>
                    <a class="side-link" href="#" data-bs-toggle="modal" data-bs-target="#addZoomModal">
                        <svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75"><polygon points="23 7 16 12 23 17 23 7"/><rect x="1" y="5" width="15" height="14" rx="2" ry="2"/></svg>
                        <span class="side-label ms-2">Schedule Zoom</span>
                    </a>
                </li>
            </ul>
            <p class="side-heading text-uppercase text-muted small fw-bold mt-3">Account</p>
            <ul class="side-list">
                <li><a class="side-link" href="<%= cp %>/logout"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4M16 17l5-5-5-5M21 12H9"/></svg><span class="side-label ms-2">Sign out</span></a></li>
            </ul>
        </nav>
    </aside>

    <div class="app-main">
        <!-- ================= TOPBAR ================= -->
        <header class="topbar bg-white shadow-sm px-4 py-3 d-flex align-items-center">
            <button type="button" class="icon-btn d-lg-none js-only" data-bs-toggle="offcanvas" data-bs-target="#sidebar"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75"><path d="M4 6h16M4 12h16M4 18h16"/></svg></button>

            <div class="ms-auto d-flex align-items-center gap-3">
                <span class="text-muted small d-none d-sm-inline">Welcome, <strong><%= escapeHTML(nomComplet) %></strong></span>

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
                    <p class="eyebrow text-uppercase text-warning small fw-bold mb-1">Autumn Term</p>
                    <h1 id="page-title" class="fw-bold mb-2">Teaching Resources</h1>
                    <p class="lede text-muted">Manage and share your course materials.</p>
                </div>
            </section>

            <% if ("ajoute".equals(msg)) { %><div class="alert alert-success rounded-3 border-0 shadow-sm">Resource published successfully!</div><% } %>
            <% if ("erreur".equals(msg)) { %><div class="alert alert-danger rounded-3 border-0 shadow-sm">An error occurred while publishing the resource.</div><% } %>
            <% if ("cours".equals(msg)) { %><div class="alert alert-danger rounded-3 border-0 shadow-sm">The selected course is not assigned to your account.</div><% } %>
            <% if ("taille".equals(msg)) { %><div class="alert alert-danger rounded-3 border-0 shadow-sm">Maximum file size is 10 MB.</div><% } %>
            <% if ("extension".equals(msg)) { %><div class="alert alert-danger rounded-3 border-0 shadow-sm">Only PDF, DOC, DOCX, PPT and PPTX files are allowed.</div><% } %>
            <% if ("champs".equals(msg)) { %><div class="alert alert-danger rounded-3 border-0 shadow-sm">Please complete all fields.</div><% } %>
            <% if (request.getAttribute("erreur") != null) { %><div class="alert alert-danger rounded-3 border-0 shadow-sm"><%= escapeHTML(request.getAttribute("erreur")) %></div><% } %>

            <div class="d-flex align-items-center justify-content-between flex-wrap gap-3 mb-4">
                <div class="fw-bold" style="color:#194b38;">
                    <%= mesCours.size() %> course(s) available
                </div>
                <button type="button" class="btn btn-primary px-4 py-2" data-bs-toggle="modal" data-bs-target="#resourceModal">
                    + Add Resource
                </button>
            </div>

            <!-- RESOURCES -->
            <div class="res-grid">
                <% if (listeRessources.isEmpty()) { %>
                <div class="res-empty">
                    <h4 class="fw-bold mb-2">No resources published yet</h4>
                    <p class="text-muted mb-0">Start sharing your materials with your students.</p>
                </div>
                <% } else { %>
                <% for (Ressource r : listeRessources) { %>
                <article class="res-card">
                    <div class="res-top">
                        <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><path d="M14 2v6h6M16 13H8M16 17H8M10 9H8"/></svg>
                    </div>
                    <div class="res-body">
                        <h3 class="res-title"><%= escapeHTML(r.getTitre()) %></h3>
                        <p class="res-meta">Type: <%= escapeHTML(r.getType()) %></p>
                        <p class="res-meta">Course: <%= r.getCours() != null ? escapeHTML(r.getCours().getIntitule()) : "Not specified" %></p>
                        <p class="res-meta mb-3">Published: <%= r.getDatePublication() != null ? r.getDatePublication().format(fmt) : "-" %></p>
                        <a class="btn-view" href="<%= cp %>/<%= escapeHTML(r.getChemin()) %>" target="_blank">View Resource</a>
                    </div>
                </article>
                <% } %>
                <% } %>
            </div>
        </main>

        <footer class="app-footer text-center py-4 text-muted small">
            <p class="mb-0">© 2024 ENSA · Teacher Portal</p>
        </footer>
    </div>
</div>

<!-- ================= MODAL : NOUVELLE RESSOURCE ================= -->
<div class="modal fade" id="resourceModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow-lg rounded-4">
            <div class="modal-header border-0 pb-0">
                <h5 class="modal-title fw-bold">New Resource</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body p-4">
                <form action="<%= cp %>/enseignant/ressources" method="post" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Resource Title</label>
                        <input type="text" class="form-control" name="titre" placeholder="Ex: Chapter 1 - Introduction" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Resource Type</label>
                        <select class="form-select" name="type" required>
                            <option value="PDF / Document">PDF / Document</option>
                            <option value="Presentation">Presentation</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Upload File (PDF, DOC, PPT)</label>
                        <input type="file" class="form-control" name="fichier" accept=".pdf,.doc,.docx,.ppt,.pptx" required>
                        <div class="form-text">Select a file from your computer (Max: 10MB).</div>
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-semibold">Associated Course</label>
                        <select class="form-select" name="cours_id" required <%= mesCours.isEmpty() ? "disabled" : "" %>>
                            <option value="">Select a course...</option>
                            <% for (Cours c : mesCours) { %>
                            <option value="<%= c.getId() %>">
                                <%= escapeHTML(c.getCode()) %> - <%= escapeHTML(c.getIntitule()) %>
                            </option>
                            <% } %>
                        </select>

                        <% if (mesCours.isEmpty()) { %>
                        <p class="text-danger small mt-2 mb-0">
                            No courses are assigned to your account. Please contact the administrator.
                        </p>
                        <% } %>
                    </div>

                    <button type="submit" class="btn btn-primary w-100 py-2" <%= mesCours.isEmpty() ? "disabled" : "" %>>
                        Publish Resource
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- ================= MODAL : SÉANCE ZOOM (comme index.jsp) ================= -->
<div class="modal fade" id="addZoomModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow-lg rounded-4">
            <div class="modal-header border-0 pb-0">
                <h5 class="modal-title fw-bold">Schedule Zoom Session</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body p-4">
                <form action="<%= cp %>/ajouterSeanceZoom" method="POST">
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Select Course</label>
                        <select class="form-select" name="cours_id" required>
                            <option value="">Choose a course...</option>
                            <% for (Cours c : mesCours) { %>
                            <option value="<%= c.getId() %>"><%= escapeHTML(c.getIntitule()) %></option>
                            <% } %>
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

<script src="<%= cp %>/enseignant/js/vendor/bootstrap.bundle.min.js"></script>
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