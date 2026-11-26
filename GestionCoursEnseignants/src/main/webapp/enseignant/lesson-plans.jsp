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
    <title>Plans de cours — ENSA</title>
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
        .plan-title, .day-name, .card-title { color: #222 !important; }
    </style>
</head>
<body class="page-plans">
<a class="skip-link" href="#main">Skip to main content</a>

<div class="app">
    <!-- SIDEBAR -->
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
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/ressources.jsp" data-tip="Gradebook"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="3" width="18" height="18" rx="2"/><path d="M3 9h18M3 15h18M9 3v18M15 9v12"/></svg><span class="side-label">My Ressources</span></a></li>

                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/lesson-plans.jsp" aria-current="page" data-tip="Lesson plans"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="4" width="18" height="18" rx="2"/><path d="M16 2v4M8 2v4M3 10h18M8 14h.01M12 14h.01M16 14h.01M8 18h.01M12 18h.01"/></svg><span class="side-label">Lesson plans</span></a></li>
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/reports.jsp" data-tip="Reports"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><path d="M3 3v18h18"/><path d="M8 17v-4M13 17V8M18 17v-7"/></svg><span class="side-label">Reports</span></a></li>
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

            <div class="topbar-end ms-auto">
                <span class="text-muted small me-3 d-none d-sm-inline">Bienvenue, <strong>${sessionScope.user.prenom}</strong></span>

                <button type="button" class="theme-toggle-btn" id="theme-toggle" aria-label="Changer de thème">
                    <svg id="icon-sun" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="display:none;"><circle cx="12" cy="12" r="4"/><path d="M12 2v2M12 20v2M4.93 4.93l1.41 1.41M17.66 17.66l1.41 1.41M2 12h2M20 12h2M6.34 17.66l-1.41 1.41M19.07 4.93l-1.41 1.41"/></svg>
                    <svg id="icon-moon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 3a6 6 0 0 0 9 9 9 9 0 1 1-9-9Z"/></svg>
                </button>
            </div>
        </header>

        <main id="main" class="page page-wide" tabindex="-1">
            <section class="page-head" aria-labelledby="page-title">
                <div class="page-head-text">
                    <p class="eyebrow">Emploi du temps</p>
                    <h1 id="page-title">Plans de cours</h1>
                    <p class="lede">La semaine en un coup d'œil, cours par cours. Chaque carte contient ses objectifs et les ressources à préparer.</p>
                </div>
                <div class="page-head-actions js-only">
                    <button type="button" class="btn btn-accent" data-add-day="fri"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><path d="M12 5v14M5 12h14"/></svg>Nouveau plan</button>
                </div>
            </section>

            <div class="board-wrap" id="board-wrap">
                <div class="board" id="board">

                    <section class="day-col" data-day="mon" aria-labelledby="day-mon">
                        <header class="day-head">
                            <h2 class="day-name" id="day-mon">Lundi <span class="day-date">21 Sep</span></h2>
                            <span class="day-count" data-day-count>1 cours</span>
                        </header>
                        <div class="day-cards">
                            <article class="plan-card status-taught" data-id="plan-1" data-day="mon" data-period="1" data-class="9R" data-status="taught">
                                <div class="plan-top">
                                    <span class="plan-period">P1 · 08:50</span>
                                    <span class="chip chip-sci"><span class="chip-dot" aria-hidden="true"></span>9R</span>
                                </div>
                                <h3 class="plan-title">Les cellules spécialisées</h3>
                                <p class="plan-label">Objectifs</p>
                                <ul class="plan-obj"><li>Décrire comment les cellules nerveuses, les spermatozoïdes et les poils absorbants sont adaptés</li></ul>
                                <div class="plan-foot">
                                    <button type="button" class="plan-edit js-only" aria-label="Modifier"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><path d="M17 3a2.85 2.85 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5Z"/></svg>Modifier</button>
                                    <span class="plan-status">Terminé</span>
                                </div>
                            </article>
                        </div>
                        <button type="button" class="plan-add js-only" data-add-day="mon"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><path d="M12 5v14M5 12h14"/></svg>Ajouter<span class="visually-hidden"> pour Lundi</span></button>
                    </section>

                    <section class="day-col" data-day="tue" aria-labelledby="day-tue">
                        <header class="day-head">
                            <h2 class="day-name" id="day-tue">Mardi <span class="day-date">22 Sep</span></h2>
                            <span class="day-count" data-day-count>0 cours</span>
                        </header>
                        <div class="day-cards"></div>
                        <button type="button" class="plan-add js-only" data-add-day="tue"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><path d="M12 5v14M5 12h14"/></svg>Ajouter<span class="visually-hidden"> pour Mardi</span></button>
                    </section>

                    <section class="day-col" data-day="wed" aria-labelledby="day-wed">
                        <header class="day-head">
                            <h2 class="day-name" id="day-wed">Mercredi <span class="day-date">23 Sep</span></h2>
                            <span class="day-count" data-day-count>0 cours</span>
                        </header>
                        <div class="day-cards"></div>
                        <button type="button" class="plan-add js-only" data-add-day="wed"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><path d="M12 5v14M5 12h14"/></svg>Ajouter<span class="visually-hidden"> pour Mercredi</span></button>
                    </section>

                    <section class="day-col" data-day="thu" aria-labelledby="day-thu">
                        <header class="day-head">
                            <h2 class="day-name" id="day-thu">Jeudi <span class="day-date">24 Sep</span></h2>
                            <span class="day-count" data-day-count>0 cours</span>
                        </header>
                        <div class="day-cards"></div>
                        <button type="button" class="plan-add js-only" data-add-day="thu"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><path d="M12 5v14M5 12h14"/></svg>Ajouter<span class="visually-hidden"> pour Jeudi</span></button>
                    </section>

                    <section class="day-col" data-day="fri" aria-labelledby="day-fri">
                        <header class="day-head">
                            <h2 class="day-name" id="day-fri">Vendredi <span class="day-date">25 Sep</span></h2>
                            <span class="day-count" data-day-count>0 cours</span>
                        </header>
                        <div class="day-cards"></div>
                        <button type="button" class="plan-add js-only" data-add-day="fri"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><path d="M12 5v14M5 12h14"/></svg>Ajouter<span class="visually-hidden"> pour Vendredi</span></button>
                    </section>
                </div>
            </div>

            <dialog class="desk-dialog" id="plan-dialog" aria-labelledby="plan-dialog-title">
                <form id="plan-form" class="desk-form" novalidate>
                    <div class="dialog-head">
                        <h2 id="plan-dialog-title" class="card-title">Nouveau plan de cours</h2>
                        <button type="button" class="icon-btn" data-dialog-close aria-label="Fermer"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><path d="M18 6 6 18M6 6l12 12"/></svg></button>
                    </div>
                    <div class="dialog-body">
                        <div class="mb-3">
                            <label class="form-label" for="pl-title">Titre du cours</label>
                            <input type="text" class="form-control" id="pl-title" name="title" required placeholder="Ex: Électrolyse du sulfate de cuivre">
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="pl-obj">Objectifs</label>
                            <textarea class="form-control" id="pl-obj" name="objectives" rows="3" required></textarea>
                        </div>
                    </div>
                    <div class="dialog-foot">
                        <button type="button" class="btn btn-outline" data-dialog-close>Annuler</button>
                        <button type="submit" class="btn btn-primary">Enregistrer</button>
                    </div>
                </form>
            </dialog>
        </main>

        <footer class="app-footer">
            <p>© 2024 ENSA · Teacher Portal</p>
        </footer>
    </div>
</div>

<script src="${pageContext.request.contextPath}/enseignant/js/vendor/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        // Force le mode clair
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