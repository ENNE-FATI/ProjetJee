<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Classes — Gradebook</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/enseignant/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/enseignant/css/style.css">
</head>
<body class="page-classes">
<div class="app">
    <!-- SIDEBAR -->
    <aside class="sidebar offcanvas-lg offcanvas-start" id="sidebar">
        <div class="sidebar-head"><a class="brand" href="${pageContext.request.contextPath}/enseignant/index.jsp"><span class="brand-name">Gradebook</span></a></div>
        <nav class="sidebar-nav">
            <ul class="side-list">
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/index.jsp"><span class="side-label">Dashboard</span></a></li>
                <li><a class="side-link" href="${pageContext.request.contextPath}/classesEnseignant" aria-current="page"><span class="side-label">Classes</span></a></li>
                <li><a class="side-link" href="${pageContext.request.contextPath}/gradebook"><span class="side-label">Gradebook</span></a></li>
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/assignments.jsp"><span class="side-label">Assignments</span></a></li>
                <li><a class="side-link" href="${pageContext.request.contextPath}/public/login.jsp"><span class="side-label">Sign out</span></a></li>
            </ul>
        </nav>
    </aside>

    <div class="app-main">
        <main id="main" class="page">
            <section class="page-head">
                <div class="page-head-text">
                    <p class="eyebrow">Année en cours</p>
                    <h1 id="page-title">Mes Classes</h1>
                </div>
            </section>
            <ul class="class-grid">
                <c:forEach var="aff" items="${listeClasses}">
                    <li class="class-col">
                        <article class="class-card">
                            <div class="class-cover cover-sci">
                                <span class="class-code">${aff.cours.code}</span>
                            </div>
                            <div class="class-body">
                                <h2 class="class-title">${aff.cours.intitule}</h2>
                                <p class="class-course">Année: ${aff.anneeUniversitaire.libelle}</p>
                            </div>
                        </article>
                    </li>
                </c:forEach>
                <c:if test="${empty listeClasses}">
                    <p>Aucune classe trouvée.</p>
                </c:if>
            </ul>
        </main>
    </div>
</div>
</body>
</html>