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
<html lang="en">
<head>
    <script>document.documentElement.classList.add('js');(function(){try{var d=document.documentElement,t=localStorage.getItem('gradebook-theme');if(!t&&window.matchMedia&&window.matchMedia('(prefers-color-scheme: dark)').matches)t='dark';d.setAttribute('data-bs-theme',t==='dark'?'dark':'light');if(localStorage.getItem('gradebook-sidebar')==='collapsed')d.classList.add('sidebar-collapsed')}catch(e){}})();</script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Gradebook — Gradebook</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/enseignant/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/enseignant/css/style.css?v=20261103.1">
    <style>
        .theme-toggle-btn { background: transparent; border: 1px solid var(--bs-border-color); color: var(--bs-body-color); border-radius: 8px; width: 38px; height: 38px; display: flex; align-items: center; justify-content: center; cursor: pointer; }
        .theme-toggle-btn:hover { background: var(--bs-tertiary-bg); }
        .topbar { justify-content: flex-end; padding: 15px 20px; }
    </style>
    <script>
        window.addEventListener('pageshow', function (event) {
            // Si la page est chargée depuis le cache du navigateur (bouton Précédent)
            if (event.persisted || (window.performance && window.performance.navigation.type === 2)) {
                window.location.reload(); // Force le rechargement depuis le serveur
            }
        });
    </script>
</head>
<body class="page-gradebook">
<a class="skip-link" href="#main">Skip to main content</a>
<div class="app">
    <aside class="sidebar offcanvas-lg offcanvas-start" id="sidebar" tabindex="-1">
        <div class="sidebar-head">
            <a class="brand" href="${pageContext.request.contextPath}/enseignant/dashboard">
                <span class="brand-mark"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75"><path d="M2 5.5C4.8 4.3 8.6 4.4 12 6.3c3.4-1.9 7.2-2 10-.8V19c-2.8-1.2-6.6-1.1-10 .8-3.4-1.9-7.2-2-10-.8Z"/><path d="M12 6.3v13.5"/></svg></span>
                <span class="brand-text"><span class="brand-name">Gradebook</span><span class="brand-sub">Harbourview Academy</span></span>
            </a>
            <button type="button" class="icon-btn sidebar-close d-lg-none js-only" data-bs-dismiss="offcanvas" data-bs-target="#sidebar"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75"><path d="M18 6 6 18M6 6l12 12"/></svg></button>
        </div>
        <nav class="sidebar-nav" aria-label="Main">
            <p class="side-heading">Teaching</p>
            <ul class="side-list">
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/dashboard"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75"><rect x="3" y="3" width="7" height="9" rx="1.5"/><rect x="14" y="3" width="7" height="5" rx="1.5"/><rect x="14" y="12" width="7" height="9" rx="1.5"/><rect x="3" y="16" width="7" height="5" rx="1.5"/></svg><span class="side-label">Dashboard</span></a></li>
                <!-- Liens corrigés vers les JSP -->
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/classes"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M22 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg><span class="side-label">Cours</span></a></li>
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/gradebook.jsp" aria-current="page"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75"><rect x="3" y="3" width="18" height="18" rx="2"/><path d="M3 9h18M3 15h18M9 3v18M15 9v12"/></svg><span class="side-label">Gradebook</span></a></li>
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/assignments.jsp"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75"><rect x="8" y="2" width="8" height="4" rx="1"/><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"/><path d="m9 14 2 2 4-4"/></svg><span class="side-label">Assignments</span></a></li>
            </ul>
            <p class="side-heading">Account</p>
            <ul class="side-list">
                <li><a class="side-link" href="${pageContext.request.contextPath}/logout"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4M16 17l5-5-5-5M21 12H9"/></svg><span class="side-label">Sign out</span></a></li>
            </ul>
        </nav>
    </aside>

    <div class="app-main">
        <header class="topbar">
            <div class="d-flex align-items-center gap-3">
                <span class="text-muted small d-none d-sm-inline">Bienvenue, <strong>${sessionScope.user.prenom} ${sessionScope.user.nom}</strong></span>
                <button type="button" class="theme-toggle-btn" id="theme-toggle">
                    <svg id="icon-sun" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="display:none;"><circle cx="12" cy="12" r="4"/><path d="M12 2v2M12 20v2M4.93 4.93l1.41 1.41M17.66 17.66l1.41 1.41M2 12h2M20 12h2M6.34 17.66l-1.41 1.41M19.07 4.93l-1.41 1.41"/></svg>
                    <svg id="icon-moon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 3a6 6 0 0 0 9 9 9 9 0 1 1-9-9Z"/></svg>
                </button>
            </div>
        </header>

        <main id="main" class="page page-wide" tabindex="-1">
            <section class="page-head">
                <div class="page-head-text">
                    <p class="eyebrow">Autumn term</p>
                    <h1 id="page-title">Gradebook</h1>
                    <p class="lede">Enter marks straight into the grid.</p>
                </div>
            </section>
            <div class="row">
                <div class="col-12">
                    <div class="dashboard-card p-5 text-center text-muted">
                        <h3>Aucune note disponible</h3>
                        <p>Le carnet de notes sera bientôt disponible.</p>
                    </div>
                </div>
            </div>
        </main>
        <footer class="app-footer"><p>© Harbourview Academy · Gradebook teacher portal</p></footer>
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
        function updateIcons(t) { if (t === 'dark') { sun.style.display = 'block'; moon.style.display = 'none'; } else { sun.style.display = 'none'; moon.style.display = 'block'; } }
        updateIcons(theme);
        if(btn) {
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