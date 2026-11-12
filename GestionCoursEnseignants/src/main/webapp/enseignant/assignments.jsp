<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Assignments — Gradebook</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/enseignant/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/enseignant/css/style.css">
</head>
<body class="page-assignments">
<div class="app">
    <!-- SIDEBAR -->
    <aside class="sidebar offcanvas-lg offcanvas-start" id="sidebar">
        <div class="sidebar-head"><a class="brand" href="${pageContext.request.contextPath}/enseignant/index.jsp"><span class="brand-name">Gradebook</span></a></div>
        <nav class="sidebar-nav">
            <ul class="side-list">
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/index.jsp"><span class="side-label">Dashboard</span></a></li>
                <li><a class="side-link" href="${pageContext.request.contextPath}/classesEnseignant"><span class="side-label">Classes</span></a></li>
                <li><a class="side-link" href="${pageContext.request.contextPath}/gradebook"><span class="side-label">Gradebook</span></a></li>
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/assignments.jsp" aria-current="page"><span class="side-label">Assignments</span></a></li>
                <li><a class="side-link" href="${pageContext.request.contextPath}/public/login.jsp"><span class="side-label">Sign out</span></a></li>
            </ul>
        </nav>
    </aside>

    <div class="app-main">
        <main id="main" class="page">
            <section class="page-head">
                <div class="page-head-text">
                    <p class="eyebrow">Tâches</p>
                    <h1 id="page-title">Assignments</h1>
                    <p class="lede">Gérez les devoirs de vos classes.</p>
                </div>
            </section>
            <div class="row">
                <div class="col-12">
                    <div class="dashboard-card p-5 text-center text-muted">
                        <h3>Aucun devoir disponible</h3>
                        <p>Cette page sera bientôt reliée à la base de données.</p>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
</body>
</html>