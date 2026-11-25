<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%-- VÉRIFICATION DE SÉCURITÉ --%>
<%
    if (session.getAttribute("user") == null && session.getAttribute("adminConnecte") == null) {
        response.sendRedirect(request.getContextPath() + "/public/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Rapports — ENSA</title>
    <link rel="icon" href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 32 32'%3E%3Crect width='32' height='32' rx='8' fill='%23c2603c'/%3E%3Cpath d='M6 10.5c2.6-1.1 6-1 10 .9 4-1.9 7.4-2 10-.9v12.6c-2.6-1.1-6-1-10 .9-4-1.9-7.4-2-10-.9Z' fill='none' stroke='%23fbf6ea' stroke-width='2' stroke-linejoin='round'/%3E%3C/svg%3E">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:ital,wght@0,400;0,500;0,600;0,700;1,400&family=Newsreader:ital,opsz,wght@0,6..72,400;0,6..72,500;0,6..72,600;1,6..72,400;1,6..72,500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/enseignant/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/enseignant/css/style.css?v=20261103.1">
    
    <style>
        /* FORCE LE MODE CLAIR POUR ÉVITER LE BUG D'AFFICHAGE */
        body { background-color: #f4f6f9 !important; color: #333 !important; }
        h1, h2, h3, h4, h5, h6 { color: #222 !important; }
        .theme-toggle-btn { background: #fff; border: 1px solid #e9ecef; color: #333; border-radius: 8px; width: 38px; height: 38px; display: flex; align-items: center; justify-content: center; cursor: pointer; }
        .theme-toggle-btn:hover { background: #f8f9fa; }
        /* Force le texte des cartes à être lisible */
        .stat-label, .card-title, .stat-value { color: #222 !important; }
    </style>
</head>
<body class="page-reports">
<a class="skip-link" href="#main">Skip to main content</a>

<div class="app">
    <aside class="sidebar offcanvas-lg offcanvas-start" id="sidebar" tabindex="-1" aria-label="Sidebar">
        <div class="sidebar-head">
            <a class="brand" href="${pageContext.request.contextPath}/enseignant/dashboard" aria-label="ENSA">
                <span class="brand-mark" aria-hidden="true"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><path d="M2 5.5C4.8 4.3 8.6 4.4 12 6.3c3.4-1.9 7.2-2 10-.8V19c-2.8-1.2-6.6-1.1-10 .8-3.4-1.9-7.2-2-10-.8Z"/><path d="M12 6.3v13.5"/></svg></span>
                <span class="brand-text">
                    <span class="brand-name">ENSA</span>
                    <span class="brand-sub">Teacher Portal</span>
                </span>
            </a>
            <button type="button" class="icon-btn sidebar-close d-lg-none js-only" data-bs-dismiss="offcanvas" data-bs-target="#sidebar" aria-label="Close menu"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><path d="M18 6 6 18M6 6l12 12"/></svg></button>
        </div>

        <nav class="sidebar-nav" aria-label="Main">
            <p class="side-heading">Teaching</p>
            <ul class="side-list">
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/dashboard" data-tip="Dashboard"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="3" width="7" height="9" rx="1.5"/><rect x="14" y="3" width="7" height="5" rx="1.5"/><rect x="14" y="12" width="7" height="9" rx="1.5"/><rect x="3" y="16" width="7" height="5" rx="1.5"/></svg><span class="side-label">Dashboard</span></a></li>
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/classes" data-tip="Classes"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M22 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg><span class="side-label">Classes</span></a></li>
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/gradebook.jsp" data-tip="Gradebook"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="3" width="18" height="18" rx="2"/><path d="M3 9h18M3 15h18M9 3v18M15 9v12"/></svg><span class="side-label">Gradebook</span></a></li>
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/assignments.jsp" data-tip="Assignments"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><rect x="8" y="2" width="8" height="4" rx="1"/><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"/><path d="m9 14 2 2 4-4"/></svg><span class="side-label">Assignments</span></a></li>
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/lesson-plans.jsp" data-tip="Lesson plans"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="4" width="18" height="18" rx="2"/><path d="M16 2v4M8 2v4M3 10h18M8 14h.01M12 14h.01M16 14h.01M8 18h.01M12 18h.01"/></svg><span class="side-label">Lesson plans</span></a></li>
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/reports.jsp" aria-current="page" data-tip="Reports"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><path d="M3 3v18h18"/><path d="M8 17v-4M13 17V8M18 17v-7"/></svg><span class="side-label">Reports</span></a></li>
            </ul>
            <p class="side-heading">Account</p>
            <ul class="side-list">
                <li><a class="side-link" href="${pageContext.request.contextPath}/logout"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4M16 17l5-5-5-5M21 12H9"/></svg><span class="side-label">Sign out</span></a></li>
            </ul>
        </nav>

        <div class="sidebar-foot">
            <div class="side-profile">
                <span class="avatar avatar-me" aria-hidden="true">${sessionScope.user.prenom.substring(0,1)}${sessionScope.user.nom.substring(0,1)}</span>
                <span class="side-profile-text">
                    <span class="side-profile-name">${sessionScope.user.prenom} ${sessionScope.user.nom}</span>
                    <span class="side-profile-role">Enseignant</span>
                </span>
            </div>
        </div>
    </aside>

    <div class="app-main">
        <header class="topbar">
            <button type="button" class="icon-btn d-lg-none js-only" data-bs-toggle="offcanvas" data-bs-target="#sidebar" aria-controls="sidebar" aria-label="Open menu"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><path d="M4 6h16M4 12h16M4 18h16"/></svg></button>
            <button type="button" class="icon-btn d-none d-lg-inline-flex js-only" id="sidebar-collapse" aria-controls="sidebar" aria-expanded="true" aria-label="Collapse sidebar"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="3" width="18" height="18" rx="2"/><path d="M9 3v18"/><path d="m16 15-3-3 3-3"/></svg></button>

            <div class="topbar-end ms-auto">
                <span class="text-muted small me-3 d-none d-sm-inline">Bienvenue, <strong>${sessionScope.user.prenom}</strong></span>

                <button type="button" class="theme-toggle-btn" id="theme-toggle" aria-label="Changer de thème">
                    <svg id="icon-sun" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="display:none;"><circle cx="12" cy="12" r="4"/><path d="M12 2v2M12 20v2M4.93 4.93l1.41 1.41M17.66 17.66l1.41 1.41M2 12h2M20 12h2M6.34 17.66l-1.41 1.41M19.07 4.93l-1.41 1.41"/></svg>
                    <svg id="icon-moon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 3a6 6 0 0 0 9 9 9 9 0 1 1-9-9Z"/></svg>
                </button>
            </div>
        </header>

        <main id="main" class="page" tabindex="-1">
            <section class="page-head" aria-labelledby="page-title">
                <div class="page-head-text">
                    <p class="eyebrow">Trimestre en cours</p>
                    <h1 id="page-title">Performance de la classe</h1>
                    <p class="lede">Visualisez les résultats de vos élèves. Les graphiques se mettent à jour à partir du carnet de notes.</p>
                </div>
                <div class="page-head-actions js-only">
                    <button type="button" class="btn btn-outline" id="print-report"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><path d="M6 9V2h12v7"/><path d="M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2"/><rect x="6" y="14" width="12" height="8"/></svg>Imprimer le rapport</button>
                </div>
            </section>

            <div class="toolbar js-only">
                <div class="toolbar-field">
                    <label for="report-class">Classe</label>
                    <select id="report-class" class="form-select form-select-sm">
                        <option value="7H">7H Science</option>
                        <option value="8K">8K Science</option>
                        <option value="9R">9R Science</option>
                        <option value="10B">10B Physique</option>
                        <option value="11B" selected>11B Chimie</option>
                        <option value="12C">12C Chimie</option>
                        <option value="13C">13C Chimie</option>
                    </select>
                </div>
                <p class="toolbar-note" id="report-note">Année 11 · 24 élèves · Objectif 71%</p>
            </div>

            <section class="stat-row" aria-label="Class summary">
                <div class="stat"><p class="stat-label">Moyenne de classe</p><p class="stat-value" data-r="avg">74.4<small>%</small></p><p class="stat-note" data-r="avg-note">+3.4 pts vs objectif 71%</p></div>
                <div class="stat"><p class="stat-label">Élève médian</p><p class="stat-value" data-r="median">75.4<small>%</small></p><p class="stat-note">La moitié de la classe est au-dessus</p></div>
                <div class="stat"><p class="stat-label">Au-dessus de l'objectif</p><p class="stat-value" data-r="on">14<small> sur 24</small></p><p class="stat-note" data-r="on-note">58% de la classe</p></div>
                <div class="stat"><p class="stat-label">Travaux manquants</p><p class="stat-value" data-r="missing">17</p><p class="stat-note">Non rendus ou non notés</p></div>
            </section>

            <div class="row g-4">
                <div class="col-xl-7">
                    <section class="card-desk h-100" aria-labelledby="hist-title">
                        <header class="card-desk-head">
                            <div>
                                <p class="card-eyebrow">Moyennes des élèves</p>
                                <h2 id="hist-title" class="card-title">Distribution des notes</h2>
                            </div>
                        </header>
                        <figure class="chart">
                            <div class="chart-plot" id="hist-chart"></div>
                            <figcaption class="chart-caption">Nombre d'élèves par tranche de moyenne.</figcaption>
                        </figure>
                    </section>
                </div>
                <div class="col-xl-5">
                    <section class="card-desk h-100" aria-labelledby="br-title">
                        <header class="card-desk-head">
                            <div>
                                <p class="card-eyebrow">Score moyen par tâche</p>
                                <h2 id="br-title" class="card-title">Détail des évaluations</h2>
                            </div>
                        </header>
                        <ul class="br-list" id="br-list">
                            <li class="br-item"><p class="br-title"><span class="gb-type t-test">Test</span>Test sur la structure atomique</p><div class="br-bar"><span style="width:72.9%"></span></div><p class="br-val">72.9%</p></li>
                            <li class="br-item"><p class="br-title"><span class="gb-type t-homework">Devoir</span>Devoir sur les liaisons</p><div class="br-bar"><span style="width:79.1%"></span></div><p class="br-val">79.1%</p></li>
                            <li class="br-item"><p class="br-title"><span class="gb-type t-practical">Pratique</span>Compte-rendu de titration</p><div class="br-bar"><span style="width:73.5%"></span></div><p class="br-val">73.5%</p></li>
                        </ul>
                    </section>
                </div>

                <div class="col-lg-6">
                    <section class="card-desk h-100" aria-labelledby="top-title">
                        <header class="card-desk-head">
                            <div>
                                <p class="card-eyebrow">Meilleures moyennes</p>
                                <h2 id="top-title" class="card-title">Tête de classe</h2>
                            </div>
                        </header>
                        <ol class="people" id="top-list">
                            <li class="person">
                                <span class="avatar av-1" aria-hidden="true">FH</span>
                                <div class="person-main"><p class="person-name">Florence Hussain</p></div>
                                <p class="person-avg s5">95.0%</p>
                            </li>
                            <li class="person">
                                <span class="avatar av-0" aria-hidden="true">AO</span>
                                <div class="person-main"><p class="person-name">Amara Okafor</p></div>
                                <p class="person-avg s5">94.2%</p>
                            </li>
                            <li class="person">
                                <span class="avatar av-2" aria-hidden="true">MN</span>
                                <div class="person-main"><p class="person-name">Maisie Nash</p></div>
                                <p class="person-avg s5">91.7%</p>
                            </li>
                        </ol>
                    </section>
                </div>
                <div class="col-lg-6">
                    <section class="card-desk h-100" aria-labelledby="risk-title">
                        <header class="card-desk-head">
                            <div>
                                <p class="card-eyebrow">Élèves en difficulté</p>
                                <h2 id="risk-title" class="card-title">Besoin de soutien</h2>
                            </div>
                        </header>
                        <ul class="people" id="risk-list">
                            <li class="person">
                                <span class="avatar av-3" aria-hidden="true">JW</span>
                                <div class="person-main">
                                    <p class="person-name">Jonah Whitaker</p>
                                    <p class="person-tags"><span class="tag-risk">24 pts sous l'objectif</span><span class="tag-risk">3 manquants</span></p>
                                </div>
                                <p class="person-avg s2">46.7%</p>
                            </li>
                            <li class="person">
                                <span class="avatar av-0" aria-hidden="true">EE</span>
                                <div class="person-main">
                                    <p class="person-name">Eden Edwards</p>
                                    <p class="person-tags"><span class="tag-risk">16 pts sous l'objectif</span></p>
                                </div>
                                <p class="person-avg s3">55.3%</p>
                            </li>
                        </ul>
                    </section>
                </div>
            </div>
        </main>

        <footer class="app-footer">
            <p>© 2024 ENSA · Teacher Portal</p>
        </footer>
    </div>
</div>

<div class="toast-stack" id="toast-stack" aria-live="polite" aria-atomic="false"></div>

<script src="${pageContext.request.contextPath}/enseignant/js/vendor/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        // Force le mode clair au démarrage
        document.documentElement.setAttribute('data-bs-theme', 'light');
        
        // Gestion du changement de thème
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